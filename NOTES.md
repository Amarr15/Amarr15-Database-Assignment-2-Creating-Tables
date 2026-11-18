# BidNile Online Auctions — Database Design & Implementation Notes

**Course:** Simulation Academy • .NET Diploma • Cycle 1  
**Project:** BidNile Online Auctions & LeetCode 238  

---

## 1. Your 4 Schemas, Their Tables, and Why

The database is divided into **4 logical schemas** (plus `Marketing` introduced in Task 3.12) to ensure high cohesion, low coupling, granular security control, and separation of business concerns:

1. **`Users`**:
   - **Tables:** `Users.Country`, `Users.City`, `Users.Member`, `Users.Wallet`
   - **Why:** Groups identity management, geographical residency, and personal accounts. Members and their financial balances (`Wallet`) share strict privacy and compliance requirements. Isolating them allows granular security policies (e.g., restricted access to sensitive national IDs, phone numbers, and balances) away from product listings and operational staff.

2. **`Logistics`**:
   - **Tables:** `Logistics.Warehouse`, `Logistics.Employee`
   - **Why:** Covers internal operational infrastructure. Manages physical storage facilities, GPS locations, inventory capacity, and employee staffing/management assignments. Employees are operational actors distinct from general marketplace members.

3. **`Catalog`**:
   - **Tables:** `Catalog.Category`, `Catalog.Item`, `Catalog.ItemPhoto`
   - **Why:** Represents merchandise taxonomy and product inventory before sale. Encapsulates hierarchical classification, dynamic item specifications (stored as JSON), condition grading, inspection associations, and media/photos.

4. **`Auctions`**:
   - **Tables:** `Auctions.Auction`, `Auctions.Bid` (and initially `AuctionFollower`)
   - **Why:** Manages the real-time marketplace bidding engine. Encapsulates pricing rules, increments, reserve prices, temporal validity across multiple time zones (`DATETIMEOFFSET`), auction lifecycles, and high-frequency bid transactions.

> **Note on Task 3.12 (`Marketing` Schema):**  
> `Marketing.AuctionFollower` was transferred from `Auctions` to `Marketing` using `ALTER SCHEMA Marketing TRANSFER Auctions.AuctionFollower`. The business rationale is that auction following represents user engagement and marketing lead data rather than core transactional bidding logic.

---

## 2. Relationships in BidNile & How They Were Mapped

| Relationship Type | Location in BidNile | Business Description | Relational Mapping Strategy |
| :--- | :--- | :--- | :--- |
| **1:1 (One-to-One)** | `Users.Member` ↔ `Users.Wallet` | *"The moment an account is created it gets its own wallet. No member has two wallets and no wallet is shared."* | Shared Primary Key: `Users.Wallet.MemberId` is both the **Primary Key** and a **Foreign Key** referencing `Users.Member(MemberId)`. This strictly enforces that a member can have at most one wallet and a wallet cannot exist without a member. |
| **1:N (One-to-Many)** | `Users.City` ↔ `Users.Member`<br>`Auctions.Auction` ↔ `Auctions.Bid` | *"Every member lives in one city; a city has many members."*<br>*"An auction receives bids from many members."* | Standard Foreign Key: The primary key of the parent table is placed as a foreign key in the child table (`Users.Member.CityId` references `City`, `Auctions.Bid.AuctionId` references `Auction`). |
| **M:N (Many-to-Many)** | `Users.Member` ↔ `Auctions.Auction` | *"A member follows many auctions, an auction has many followers, nobody follows the same auction twice."* | Junction Table: `Marketing.AuctionFollower` with a composite primary key `(AuctionId, MemberId)` referencing both `Auctions.Auction(AuctionId)` and `Users.Member(MemberId)`. |
| **Recursive (Self-Referencing)** | `Users.Member` (Referrals)<br>`Catalog.Category` (Tree) | *"A member may have joined through another member's invitation."*<br>*"Categories form a tree: Cars sits under Vehicles."* | Self-Referencing Foreign Key: A column references the table's own primary key (`Users.Member.InvitedByMemberId` references `Member.MemberId`; `Catalog.Category.ParentCategoryId` references `Category.CategoryId`). Both allow `NULL` for top-level records. |
| **Circular** | `Logistics.Warehouse` ↔ `Logistics.Employee` | Each employee works in one warehouse (`Employee.WarehouseId` → `Warehouse`), while one employee manages each warehouse (`Warehouse.ManagerEmployeeId` → `Employee`). | Mutual Foreign Keys: Both tables hold a foreign key to each other. One of the constraints (`FK_Warehouse_ManagerEmployee`) must be nullable and created via `ALTER TABLE` after both tables exist. |
| **Weak Entity** | `Catalog.ItemPhoto` (owned by `Catalog.Item`) | *"A photo means nothing on its own: it is identified by its item and its position (1st, 2nd … 20th) and disappears with its item."* | Composite Primary Key + Cascade: `(ItemId, Position)` forms the PK. `ItemId` references `Catalog.Item(ItemId)` with `ON DELETE CASCADE`, ensuring photos cannot exist independently and are automatically removed when the item is deleted. |

---

## 3. Data Type Choices Justification

- **`UNIQUEIDENTIFIER` (GUID) for Members:**  
  The business case specifies: *"Most people sign up from the mobile app, which generates a globally unique member ID on the phone itself, before the request reaches our servers — so member IDs are never running numbers."*  
  Client-generated GUIDs allow offline/distributed ID generation without database roundtrips, prevent race conditions across multiple server instances, and avoid sequential integer enumeration security risks.

- **`BIGINT` for Bids:**  
  The business projects hundreds of millions of bids annually, quickly surpassing 2.1 billion. Standard `INT` tops out at $2,147,483,647$ ($2^{31} - 1$). Using `INT` would result in arithmetic overflow errors. `BIGINT` handles up to $9.22 \times 10^{18}$ ($2^{63} - 1$), future-proofing high-volume bidding.

- **`FLOAT` for GPS vs. `DECIMAL` for Money:**  
  - **GPS:** Coordinates (latitude and longitude) are continuous, approximate scientific measurements from map providers (e.g. `30.0444196 / 31.2357116`). `FLOAT` is computationally efficient and optimized for spatial/geometric operations where infinitesimal floating-point approximations do not impact physical precision.  
  - **Money:** Financial balances, hold amounts, and bid prices require **exact precision**. Floating-point types suffer from binary rounding errors (e.g., $0.1 + 0.2 \neq 0.3$), which can lead to compounding accounting discrepancies. `DECIMAL(12, 2)` guarantees exact fixed-point storage down to the exact cent/piastre.

- **`DATETIMEOFFSET` for Auctions:**  
  BidNile operates across three countries with distinct time zones: Egypt (`+02:00`), Saudi Arabia (`+03:00`), and UAE (`+04:00`). Auctions are timed events where start and end moments must represent the exact same absolute point in time for all bidders regardless of their geographical location. `DATETIMEOFFSET` stores the explicit UTC offset, eliminating ambiguity and errors caused by daylight saving shifts or local server timezone discrepancies.

---

## 4. Why Can't the Circular Relationship Be Created Inside `CREATE TABLE`?

In SQL Server DDL, a `FOREIGN KEY` constraint requires that the referenced table and its primary key **must already exist** when the constraint is created.
- If we try to create `Logistics.Warehouse` first with an inline reference to `Logistics.Employee`, the command fails because `Employee` has not been created yet.
- Conversely, if we try to create `Logistics.Employee` first with an inline reference to `Logistics.Warehouse`, it fails because `Warehouse` does not exist yet.

Neither table can be created with all foreign keys in a single forward pass.  
**Resolution:**  
1. Create `Warehouse` without the manager foreign key (or with `ManagerEmployeeId` column defined as `NULL`).
2. Create `Employee` referencing `Warehouse`.
3. Apply `ALTER TABLE Logistics.Warehouse ADD CONSTRAINT FK_Warehouse_ManagerEmployee FOREIGN KEY (ManagerEmployeeId) REFERENCES Logistics.Employee(EmployeeId);`.

---

## 5. The Order of Filling Tables & Why

Because Foreign Key constraints are active, parent tables must be populated before child tables to satisfy referential integrity. The insertion order is:

1. **`Users.Country`**: Independent master table (EG, SA, AE).
2. **`Users.City`**: References `Users.Country`.
3. **`Users.Member`**: References `Users.City`. Root members (`InvitedByMemberId = NULL`) are inserted first, then invited members referencing existing `MemberId`s.
4. **`Users.Wallet`**: 1:1 dependency referencing `Users.Member`.
5. **`Logistics.Warehouse`**: References `Users.City`. Inserted with `ManagerEmployeeId = NULL` initially to avoid circular dependency conflict with `Employee`.
6. **`Logistics.Employee`**: References `Users.Member` and `Logistics.Warehouse`.  
   *(Followed by updating `Warehouse.ManagerEmployeeId` now that employee records exist).*
7. **`Catalog.Category`**: Self-referencing tree; top-level categories (`ParentCategoryId = NULL`) inserted first, followed by child categories.
8. **`Catalog.Item`**: References `Users.Member` (Seller), `Logistics.Employee` (Inspector), `Logistics.Warehouse`, and `Catalog.Category`.
9. **`Catalog.ItemPhoto`**: Weak entity referencing `Catalog.Item`.
10. **`Auctions.Auction`**: References `Catalog.Item`.
11. **`Auctions.Bid`**: References `Auctions.Auction` and `Users.Member`.
12. **`Marketing.AuctionFollower`**: References `Auctions.Auction` and `Users.Member`.

---

## 6. The Errors in Tasks 3.6 and 3.11 & How They Were Fixed

### Task 3.6 (Change `MaxItems` to `SMALLINT` with `CHECK (MaxItems > 0)`):
- **Cause of Error:** Attempting `ALTER TABLE Logistics.Warehouse ALTER COLUMN Capacity SMALLINT;` fails because the column is bound to an active check constraint (`CK_Warehouse_Capacity`). SQL Server disallows modifying column types while participating in constraints.
- **Fix:**
  1. Drop the existing check constraint:  
     `ALTER TABLE Logistics.Warehouse DROP CONSTRAINT CK_Warehouse_Capacity;`
  2. Rename the column using `sp_rename`:  
     `EXEC sp_rename 'Logistics.Warehouse.Capacity', 'MaxItems', 'COLUMN';`
  3. Alter the column data type to `SMALLINT`:  
     `ALTER TABLE Logistics.Warehouse ALTER COLUMN MaxItems SMALLINT NOT NULL;`
  4. Re-add the check constraint:  
     `ALTER TABLE Logistics.Warehouse ADD CONSTRAINT CK_Warehouse_MaxItems CHECK (MaxItems > 0);`

### Task 3.11 (Add `VerifiedAt` and Drop `IsVerified`):
- **Cause of Error:** Attempting `ALTER TABLE Users.Member DROP COLUMN IsVerified;` fails with:
  > *"The object 'DF_Member_IsVerified' is dependent on column 'IsVerified'. ALTER TABLE DROP COLUMN IsVerified failed because one or more objects access this column."*
- **Fix:** SQL Server prevents dropping columns that have dependent objects (such as `DEFAULT` constraints). The default constraint must be dropped first:
  1. Add the new column:  
     `ALTER TABLE Users.Member ADD VerifiedAt DATETIME2(3) NULL;`
  2. Drop the default constraint:  
     `ALTER TABLE Users.Member DROP CONSTRAINT DF_Member_IsVerified;`
  3. Drop the column:  
     `ALTER TABLE Users.Member DROP COLUMN IsVerified;`

---

## 7. Hand Trace for Task 5 (LeetCode 238: Product of Array Except Self)

**Input Array:** `nums = [1, 2, 3, 4]` (Length $n = 4$)  
**Goal:** Return array `result` where `result[i]` is the product of all elements in `nums` except `nums[i]`, without using division in $O(n)$ time.

### Step 1: Prefix Products (`prefix[]`)
`prefix[i]` holds the product of all elements strictly to the **left** of index `i`.  
By definition, `prefix[0] = 1` (no elements to the left).

$$\begin{aligned}
\text{prefix}[0] &= 1 \\
\text{prefix}[1] &= \text{prefix}[0] \times \text{nums}[0] = 1 \times 1 = 1 \\
\text{prefix}[2] &= \text{prefix}[1] \times \text{nums}[1] = 1 \times 2 = 2 \\
\text{prefix}[3] &= \text{prefix}[2] \times \text{nums}[2] = 2 \times 3 = 6
\end{aligned}$$

$$\mathbf{\text{prefix}} = [1,\, 1,\, 2,\, 6]$$

---

### Step 2: Suffix Products (`suffix[]`)
`suffix[i]` holds the product of all elements strictly to the **right** of index `i`.  
By definition, `suffix[n - 1] = suffix[3] = 1` (no elements to the right).

$$\begin{aligned}
\text{suffix}[3] &= 1 \\
\text{suffix}[2] &= \text{suffix}[3] \times \text{nums}[3] = 1 \times 4 = 4 \\
\text{suffix}[1] &= \text{suffix}[2] \times \text{nums}[2] = 4 \times 3 = 12 \\
\text{suffix}[0] &= \text{suffix}[1] \times \text{nums}[1] = 12 \times 2 = 24
\end{aligned}$$

$$\mathbf{\text{suffix}} = [24,\, 12,\, 4,\, 1]$$

---

### Step 3: Combine Prefix & Suffix (`result[i] = prefix[i] * suffix[i]`)

$$\begin{aligned}
\text{result}[0] &= \text{prefix}[0] \times \text{suffix}[0] = 1 \times 24 = \mathbf{24} \quad (\text{product of } 2 \times 3 \times 4) \\
\text{result}[1] &= \text{prefix}[1] \times \text{suffix}[1] = 1 \times 12 = \mathbf{12} \quad (\text{product of } 1 \times 3 \times 4) \\
\text{result}[2] &= \text{prefix}[2] \times \text{suffix}[2] = 2 \times 4 = \mathbf{8} \quad (\text{product of } 1 \times 2 \times 4) \\
\text{result}[3] &= \text{prefix}[3] \times \text{suffix}[3] = 6 \times 1 = \mathbf{6} \quad (\text{product of } 1 \times 2 \times 3)
\end{aligned}$$

$$\mathbf{\text{result}} = [24,\, 12,\, 8,\, 6]$$

---

### Summary Trace Table

| Index ($i$) | `nums[i]` | Elements to Left | `prefix[i]` | Elements to Right | `suffix[i]` | Calculation: `prefix[i] * suffix[i]` | Final `result[i]` |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **0** | **1** | *(none)* | **1** | `[2, 3, 4]` | **24** | $1 \times 24$ | **24** |
| **1** | **2** | `[1]` | **1** | `[3, 4]` | **12** | $1 \times 12$ | **12** |
| **2** | **3** | `[1, 2]` | **2** | `[4]` | **4** | $2 \times 4$ | **8** |
| **3** | **4** | `[1, 2, 3]` | **6** | *(none)* | **1** | $6 \times 1$ | **6** |

---

### Complexity Analysis
- **5.1 Solution (prefix & suffix arrays):**
  - **Time Complexity:** $O(n)$ — Three sequential linear iterations over the array.
  - **Space Complexity:** $O(n)$ — Two auxiliary arrays of size $n$ (`prefix` and `suffix`).
- **5.2 Follow-up Solution ($O(1)$ extra space):**
  - **Time Complexity:** $O(n)$ — Two sequential linear iterations over the array.
  - **Space Complexity:** $O(1)$ — Only a single variable (`suffix`) maintained as a running product. Output array does not count towards extra space per LeetCode specification.
