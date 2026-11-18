GO

CREATE DATABASE BidNile;
GO

USE BidNile;
GO



CREATE SCHEMA Users;
GO
CREATE SCHEMA Logistics;
GO
CREATE SCHEMA Catalog;
GO
CREATE SCHEMA Auctions;
GO

-- 1. Users.Country
CREATE TABLE Users.Country (
    CountryCode CHAR(2) NOT NULL,
    NameEn VARCHAR(50) NOT NULL,
    NameAr NVARCHAR(50) NOT NULL,
    PhoneCode VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Country PRIMARY KEY (CountryCode),
    CONSTRAINT CK_Country_CountryCode CHECK (CountryCode IN ('EG', 'SA', 'AE'))
);
GO

-- 2. Users.City
CREATE TABLE Users.City (

    CityId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(60) NOT NULL,
    CountryCode CHAR(2) NOT NULL,

    CONSTRAINT PK_City PRIMARY KEY (CityId),
    CONSTRAINT UQ_City_Name_CountryCode UNIQUE (Name, CountryCode)
);
GO

-- 3. Users.Member
CREATE TABLE Users.Member (

    MemberId UNIQUEIDENTIFIER NOT NULL 
		CONSTRAINT DF_Member_MemberId DEFAULT NEWID(),

    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(254) NOT NULL,
    Mobile VARCHAR(16) NOT NULL,
    NationalId VARCHAR(20) NOT NULL,
    BirthDate DATE NOT NULL,

    IsVerified BIT NOT NULL 
		CONSTRAINT DF_Member_IsVerified DEFAULT 0,

    RegisteredAt DATETIME2(3) NOT NULL 
		CONSTRAINT DF_Member_RegisteredAt DEFAULT SYSDATETIME(),

    CityId INT NOT NULL,
    InvitedByMemberId UNIQUEIDENTIFIER NULL,

    CONSTRAINT PK_Member PRIMARY KEY (MemberId),
    CONSTRAINT UQ_Member_Email UNIQUE (Email),
    CONSTRAINT UQ_Member_NationalId UNIQUE (NationalId),
    CONSTRAINT CK_Member_Age CHECK (DATEDIFF(YEAR, BirthDate, GETDATE()) >= 18)
);
GO

-- 4. Users.Wallet
CREATE TABLE Users.Wallet (

    MemberId UNIQUEIDENTIFIER NOT NULL,

    Balance DECIMAL(12, 2) NOT NULL 
		CONSTRAINT DF_Wallet_Balance DEFAULT 0.00,

    HeldAmount DECIMAL(12, 2) NOT NULL 
		CONSTRAINT DF_Wallet_HeldAmount DEFAULT 0.00,

    Currency CHAR(3) NOT NULL 
		CONSTRAINT DF_Wallet_Currency DEFAULT 'EGP',

    LastUpdatedAt DATETIME2(3) NOT NULL 

	CONSTRAINT DF_Wallet_LastUpdatedAt DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Wallet PRIMARY KEY (MemberId),
    CONSTRAINT CK_Wallet_Balance CHECK (Balance >= 0.00 AND Balance <= 9999999999.99),
    CONSTRAINT CK_Wallet_HeldAmount CHECK (HeldAmount >= 0.00),
    CONSTRAINT CK_Wallet_Held_LTE_Balance CHECK (HeldAmount <= Balance)
);
GO

-- 5. Logistics.Warehouse
CREATE TABLE Logistics.Warehouse (

    WarehouseId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(80) NOT NULL,
    Capacity INT NOT NULL,
    CityId INT NOT NULL,
    Latitude FLOAT NOT NULL,
    Longitude FLOAT NOT NULL,
    ManagerEmployeeId UNIQUEIDENTIFIER NULL,
    ManagerStartDate DATE NULL,

    CONSTRAINT PK_Warehouse PRIMARY KEY (WarehouseId),
    CONSTRAINT UQ_Warehouse_Name UNIQUE (Name),
    CONSTRAINT CK_Warehouse_Capacity CHECK (Capacity > 0),
    CONSTRAINT CK_Warehouse_Latitude CHECK (Latitude BETWEEN -90.0 AND 90.0),
    CONSTRAINT CK_Warehouse_Longitude CHECK (Longitude BETWEEN -180.0 AND 180.0)
);
GO

-- 6. Logistics.Employee
CREATE TABLE Logistics.Employee (

    EmployeeId UNIQUEIDENTIFIER NOT NULL,
    WarehouseId INT NOT NULL,

    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId)
);
GO

-- 7. Catalog.Category
CREATE TABLE Catalog.Category (

    CategoryId INT NOT NULL,
    ParentCategoryId INT NULL,
    NameEn VARCHAR(50) NOT NULL,
    NameAr NVARCHAR(50) NOT NULL,
    Commission DECIMAL(4, 2) NOT NULL,

    CONSTRAINT PK_Category PRIMARY KEY (CategoryId),
    CONSTRAINT UQ_Category_NameEn UNIQUE (NameEn),
    CONSTRAINT CK_Category_Commission CHECK (Commission BETWEEN 0.00 AND 30.00)
);
GO

-- 8. Catalog.Item
CREATE TABLE Catalog.Item (

    ItemId INT IDENTITY(1,1) NOT NULL,
    Title NVARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ConditionScore TINYINT NOT NULL,
    Specifications NVARCHAR(MAX) NOT NULL,
    SellerMemberId UNIQUEIDENTIFIER NOT NULL,
    InspectorMemberId UNIQUEIDENTIFIER NULL,
    WarehouseId INT NULL,
    CategoryId INT NOT NULL,

    ListedAt DATETIME2(3) NOT NULL 
		CONSTRAINT DF_Item_ListedAt DEFAULT SYSDATETIME(),

    CONSTRAINT PK_Item PRIMARY KEY (ItemId),
    CONSTRAINT CK_Item_ConditionScore CHECK (ConditionScore BETWEEN 1 AND 10),
    CONSTRAINT CK_Item_Specifications_Json CHECK (ISJSON(Specifications) = 1),
    CONSTRAINT CK_Item_Seller_Not_Inspector CHECK (SellerMemberId <> InspectorMemberId)
);
GO

-- 9. Catalog.ItemPhoto
CREATE TABLE Catalog.ItemPhoto (

    ItemId INT NOT NULL,
    Position TINYINT NOT NULL,
    Url VARCHAR(500) NOT NULL,

    IsMain BIT NOT NULL 
		CONSTRAINT DF_ItemPhoto_IsMain DEFAULT 0,

    CONSTRAINT PK_ItemPhoto PRIMARY KEY (ItemId, Position),
    CONSTRAINT CK_ItemPhoto_Position CHECK (Position BETWEEN 1 AND 20)
);
GO

-- 10. Auctions.Auction
CREATE TABLE Auctions.Auction (
    AuctionId INT IDENTITY(1,1) NOT NULL,
    ItemId INT NOT NULL,
    StartingPrice DECIMAL(12, 2) NOT NULL,
    ReservePrice DECIMAL(12, 2) NULL,

    BidIncrement DECIMAL(12, 2) NOT NULL 
		CONSTRAINT DF_Auction_BidIncrement DEFAULT 50.00,

    StartTime DATETIMEOFFSET NOT NULL,
    EndTime DATETIMEOFFSET NOT NULL,

    Status VARCHAR(20) NOT NULL CONSTRAINT DF_Auction_Status DEFAULT 'Draft',
    CONSTRAINT PK_Auction PRIMARY KEY (AuctionId),
    CONSTRAINT CK_Auction_StartingPrice CHECK (StartingPrice > 0.00),
    CONSTRAINT CK_Auction_ReservePrice CHECK (ReservePrice IS NULL OR ReservePrice >= StartingPrice),
    CONSTRAINT CK_Auction_TimeOrder CHECK (EndTime > StartTime),
    CONSTRAINT CK_Auction_Status CHECK (Status IN ('Draft', 'Live', 'Ended', 'Cancelled'))
);
GO

-- 11. Auctions.Bid
CREATE TABLE Auctions.Bid (
    BidId BIGINT IDENTITY(1,1) NOT NULL,
    AuctionId INT NOT NULL,
    MemberId UNIQUEIDENTIFIER NOT NULL,
    Amount DECIMAL(12, 2) NOT NULL,

    PlacedAt DATETIME2(3) NOT NULL
		CONSTRAINT DF_Bid_PlacedAt DEFAULT SYSDATETIME(),

    IpAddress VARCHAR(45) NOT NULL,
    CONSTRAINT PK_Bid PRIMARY KEY (BidId),
    CONSTRAINT CK_Bid_Amount CHECK (Amount > 0.00),
    CONSTRAINT UQ_Bid_Auction_Amount UNIQUE (AuctionId, Amount)
);
GO

-- 12. Auctions.AuctionFollower
CREATE TABLE Auctions.AuctionFollower (

    AuctionId INT NOT NULL,
    MemberId UNIQUEIDENTIFIER NOT NULL,

    FollowedAt DATETIME2(3) NOT NULL 
		CONSTRAINT DF_AuctionFollower_FollowedAt DEFAULT SYSDATETIME(),

    CONSTRAINT PK_AuctionFollower PRIMARY KEY (AuctionId, MemberId)
);
GO



-- 3.1 Connect everything: Add all Foreign Keys
ALTER TABLE Users.City
    ADD CONSTRAINT FK_City_Country FOREIGN KEY (CountryCode)
        REFERENCES Users.Country (CountryCode);
GO

ALTER TABLE Users.Member
    ADD CONSTRAINT FK_Member_City FOREIGN KEY (CityId)
        REFERENCES Users.City (CityId),
        CONSTRAINT FK_Member_InvitedByMember FOREIGN KEY (InvitedByMemberId)
        REFERENCES Users.Member (MemberId);
GO

ALTER TABLE Users.Wallet
    ADD CONSTRAINT FK_Wallet_Member FOREIGN KEY (MemberId)
        REFERENCES Users.Member (MemberId);
GO

ALTER TABLE Logistics.Warehouse
    ADD CONSTRAINT FK_Warehouse_City FOREIGN KEY (CityId)
        REFERENCES Users.City (CityId);
GO

ALTER TABLE Logistics.Employee
    ADD CONSTRAINT FK_Employee_Member FOREIGN KEY (EmployeeId)
        REFERENCES Users.Member (MemberId),
        CONSTRAINT FK_Employee_Warehouse FOREIGN KEY (WarehouseId)
        REFERENCES Logistics.Warehouse (WarehouseId);
GO

-- Circular relationship back to Employee
ALTER TABLE Logistics.Warehouse
    ADD CONSTRAINT FK_Warehouse_ManagerEmployee FOREIGN KEY (ManagerEmployeeId)
        REFERENCES Logistics.Employee (EmployeeId);
GO

ALTER TABLE Catalog.Category
    ADD CONSTRAINT FK_Category_ParentCategory FOREIGN KEY (ParentCategoryId)
        REFERENCES Catalog.Category (CategoryId);
GO

ALTER TABLE Catalog.Item
    ADD CONSTRAINT FK_Item_SellerMember FOREIGN KEY (SellerMemberId)
        REFERENCES Users.Member (MemberId),
        CONSTRAINT FK_Item_InspectorEmployee FOREIGN KEY (InspectorMemberId)
        REFERENCES Logistics.Employee (EmployeeId),
        CONSTRAINT FK_Item_Warehouse FOREIGN KEY (WarehouseId)
        REFERENCES Logistics.Warehouse (WarehouseId),
        CONSTRAINT FK_Item_Category FOREIGN KEY (CategoryId)
        REFERENCES Catalog.Category (CategoryId);
GO

-- Deleting an item deletes its photos (CASCADE)
ALTER TABLE Catalog.ItemPhoto
    ADD CONSTRAINT FK_ItemPhoto_Item FOREIGN KEY (ItemId)
        REFERENCES Catalog.Item (ItemId) ON DELETE CASCADE;
GO

ALTER TABLE Auctions.Auction
    ADD CONSTRAINT FK_Auction_Item FOREIGN KEY (ItemId)
        REFERENCES Catalog.Item (ItemId);
GO

ALTER TABLE Auctions.Bid
    ADD CONSTRAINT FK_Bid_Auction FOREIGN KEY (AuctionId)
        REFERENCES Auctions.Auction (AuctionId),
        CONSTRAINT FK_Bid_Member FOREIGN KEY (MemberId)
        REFERENCES Users.Member (MemberId);
GO

ALTER TABLE Auctions.AuctionFollower
    ADD CONSTRAINT FK_AuctionFollower_Auction FOREIGN KEY (AuctionId)
        REFERENCES Auctions.Auction (AuctionId),
        CONSTRAINT FK_AuctionFollower_Member FOREIGN KEY (MemberId)
        REFERENCES Users.Member (MemberId);
GO

-- 3.2 Members choose an app language ar or en and Add NOT NULL column
ALTER TABLE Users.Member
    ADD AppLanguage VARCHAR(2) NOT NULL 
    CONSTRAINT DF_Member_AppLanguage DEFAULT 'ar'
    CONSTRAINT CK_Member_AppLanguage CHECK (AppLanguage IN ('ar', 'en'));
GO

-- 3.3 Add a NOT NULL Yes/No column default No
ALTER TABLE Catalog.Item
    ADD IsFeatured BIT NOT NULL 
    CONSTRAINT DF_Item_IsFeatured DEFAULT 0;
GO

-- 3.4 Rename bid IP column to DeviceIp and warehouse capacity to MaxItems
EXEC sp_rename 'Auctions.Bid.IpAddress', 'DeviceIp', 'COLUMN';
GO


ALTER TABLE Logistics.Warehouse
    DROP CONSTRAINT CK_Warehouse_Capacity;
GO

EXEC sp_rename 'Logistics.Warehouse.Capacity', 'MaxItems', 'COLUMN';
GO

-- 3.5 Some names are longer than 100 characters
ALTER TABLE Users.Member
    ALTER COLUMN FullName NVARCHAR(150) NOT NULL;
GO

-- 3.6 No warehouse will hold more than 30,000 items
ALTER TABLE Logistics.Warehouse
    ALTER COLUMN MaxItems SMALLINT NOT NULL;
GO

ALTER TABLE Logistics.Warehouse
    ADD CONSTRAINT CK_Warehouse_MaxItems CHECK (MaxItems > 0);
GO

-- 3.7 Max commission
ALTER TABLE Catalog.Category
    DROP CONSTRAINT CK_Category_Commission;
GO

ALTER TABLE Catalog.Category
    ADD CONSTRAINT CK_Category_Commission CHECK (Commission BETWEEN 0.00 AND 25.00);
GO

-- 3.8 Auctions must be reviewed first
ALTER TABLE Auctions.Auction
    DROP CONSTRAINT DF_Auction_Status;
GO

ALTER TABLE Auctions.Auction
    DROP CONSTRAINT CK_Auction_Status;
GO

ALTER TABLE Auctions.Auction
    ADD CONSTRAINT CK_Auction_Status CHECK (Status IN ('Draft', 'PendingReview', 'Live', 'Ended', 'Cancelled'));
GO

ALTER TABLE Auctions.Auction
    ADD CONSTRAINT DF_Auction_Status DEFAULT 'PendingReview' FOR Status;
GO


ALTER TABLE Auctions.Auction
    ADD BuyNowPrice DECIMAL(12, 2) NULL;
GO

-- Used WITH CHECK 
ALTER TABLE Auctions.Auction WITH CHECK
    ADD CONSTRAINT CK_Auction_BuyNowPrice CHECK (BuyNowPrice IS NULL OR BuyNowPrice > StartingPrice);
GO

-- 3.10 Duplicate accounts were found
ALTER TABLE Users.Member
    ADD CONSTRAINT UQ_Member_Mobile UNIQUE (Mobile);
GO

-- 3.11 We need when a member was verified Add VerifiedAt then drop the old Yes/No column
ALTER TABLE Users.Member
    ADD VerifiedAt DATETIME2(3) NULL;
GO

-- Must drop DF_Member_IsVerified first otherwise DROP COLUMN fails
ALTER TABLE Users.Member
    DROP CONSTRAINT DF_Member_IsVerified;
GO

ALTER TABLE Users.Member
    DROP COLUMN IsVerified;
GO

-- 3.12 Create schema Marketing and move followed auctions table into it
CREATE SCHEMA Marketing;
GO

ALTER SCHEMA Marketing TRANSFER Auctions.AuctionFollower;
GO