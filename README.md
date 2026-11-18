# BidNile Online Auctions — Database Assignment 2

**Simulation Academy • .NET Diploma • Cycle 1**  
**Student Name:** Ammar Yasser  
**Track:** Backend .NET  
**Assignment:** Database Design & SQL Server DDL + DSA (LeetCode 238)  
**Branch:** `assignment/1-12`  

---

## Repository Structure

```text
├── docs/
│   ├── mapping.png               # Task 1: Relational Schema Mapping
│   ├── erd.png                   # Bonus: Entity-Relationship Diagram (ERD)
│   └── screenshots/              # Tasks 4 & 5 Screenshots
│       ├── leetcode.png          # LeetCode 238 Accepted Submission
│       ├── error_duplicate_bid.png
│       ├── error_held_gt_balance.png
│       └── error_seller_inspector.png
├── database/
│   ├── BidNile.sql               # Tasks 2 & 3: CREATE and ALTER Scripts
│   ├── BidNile_Data.sql          # Task 4: Exported Data Script
│   ├── BidNile_Data.xlsx         # Multi-sheet Excel Seed Data
│   └── seed_data/                # CSV Seed Data files
├── dsa/
│   └── ProductExceptSelf.cs      # Task 5: LeetCode 238 (Solutions 5.1 & 5.2)
├── NOTES.md                      # Section 03: Detailed Answers & Hand Trace
└── README.md                     # Project overview and student details
```

---

## Tasks Summary

1. **Task 1 — Relational Mapping & Schemas (`docs/mapping.png`):** Complete mapping of all entities across 4 schemas (`Users`, `Logistics`, `Catalog`, `Auctions`).
2. **Task 2 — CREATE DDL (`database/BidNile.sql`):** Top-to-bottom executable DDL defining schemas, tables, data types, constraints (PK, UK, CK, DF).
3. **Task 3 — ALTER Evolution (`database/BidNile.sql`):** 12 ALTER operations reflecting evolving business rules on existing populated tables.
4. **Task 4 — Data Population (`database/BidNile_Data.sql`):** Seeded with realistic data (10 members, 42 bids, all auction statuses, multiple time zones, distinct JSON schemas).
5. **Task 5 — DSA Prefix & Suffix Accumulation (`dsa/ProductExceptSelf.cs`):** LeetCode 238 solved with both $O(n)$ space (`prefix[]` + `suffix[]`) and $O(1)$ extra space follow-up.
