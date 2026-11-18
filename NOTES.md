# BidNile Online Auctions — Notes

**Course:** Simulation Academy – .NET Diploma – Cycle 1  
**Student Name:** Ammar Yasser  
**Group:** G2  
**Track:** Backend .NET

---

## 1. Database Schemas

I divided the database into four schemas to keep the tables organized.

- **Users:** Contains Country, City, Member, and Wallet. These tables store member information and their related data.
- **Logistics:** Contains Warehouse and Employee. These tables manage warehouses and the employees working there.
- **Catalog:** Contains Category, Item, and ItemPhoto. These tables store the items listed for sale and their details.
- **Auctions:** Contains Auction and Bid. These tables handle auctions and bidding.

In Task 3.12, I created the Marketing schema and moved AuctionFollower from Auctions to Marketing because it is related to user engagement.

## 2. Relationships

There are different types of relationships in the database.

- **One-to-One:** Each member has one wallet. I used MemberId as both the primary key and foreign key in Wallet.
- **One-to-Many:** One city can have many members, so I added CityId as a foreign key in Member.
- **Many-to-Many:** A member can follow many auctions, and an auction can have many followers. I used AuctionFollower to connect them.
- **Recursive:** Members can invite other members, and categories can have parent categories. Both relationships reference the same table.
- **Circular:** Employees work in warehouses, and each warehouse has a manager who is an employee.
- **Weak Entity:** ItemPhoto depends on Item. I used ItemId and Position together as its primary key.

I also used ON DELETE CASCADE for ItemPhoto so that deleting an item deletes its photos.

## 3. Data Types

I chose the data types based on the business requirements.

- **UNIQUEIDENTIFIER:** Used for MemberId because the mobile app can generate a unique ID before sending the request to the server.
- **BIGINT:** Used for BidId because the system may store billions of bids.
- **FLOAT:** Used for GPS coordinates because they are approximate values.
- **DECIMAL:** Used for money because financial values need exact decimal precision.
- **DATETIMEOFFSET:** Used for auction start and end times because the platform works in different time zones.

## 4. Circular Relationship

The circular relationship is between Warehouse and Employee.

An employee works in one warehouse, and a warehouse has one employee as its manager.

I created both tables first without adding the manager foreign key. Then I added the Employee foreign key to Warehouse and used ALTER TABLE to add the manager foreign key after both tables existed.

## 5. Data Entry Order

I entered the data in an order that respects the foreign key relationships.

First, I added countries and cities, then members and wallets. After that, I added warehouses and employees.

I entered the warehouses without managers at first because employees had not been added yet. After adding the employees, I updated the warehouse managers.

Then I added categories, items, photos, auctions, bids, and finally auction followers.

This order helped me avoid foreign key errors while entering the data.

## 6. Errors in Task 3

### Task 3.6 – Changing MaxItems to SMALLINT

I got an error when I tried to change the column type because it had a CHECK constraint.

I fixed it by dropping the old constraint, renaming the column to MaxItems, changing its type to SMALLINT, and adding the CHECK constraint again to make sure the value stays greater than zero.

### Task 3.11 – Dropping IsVerified

I got an error because a DEFAULT constraint was attached to the IsVerified column.

I fixed it by adding the VerifiedAt column first, dropping the default constraint, and then dropping IsVerified.

## 7. LeetCode 238 – Product of Array Except Self

The problem asks us to return an array where each element is the product of all the other elements, without using division.

For example:

Input: `[1, 2, 3, 4]`

Output: `[24, 12, 8, 6]`

I used the prefix and suffix approach.

**Prefix:** Stores the product of all elements to the left of the current index.

For the example, the prefix array is:

`[1, 1, 2, 6]`

**Suffix:** Stores the product of all elements to the right of the current index.

The suffix array is:

`[24, 12, 4, 1]`

I multiplied the prefix and suffix values at each index to get the final result:

`[24, 12, 8, 6]`

### Complexity

**Solution 5.1:**
- Time Complexity: O(n)
- Extra Space Complexity: O(n), because I used two additional arrays.

**Solution 5.2:**
- Time Complexity: O(n)
- Extra Space Complexity: O(1), excluding the output array.

In the optimized solution, I used the output array to store prefix products and one variable to calculate suffix products.