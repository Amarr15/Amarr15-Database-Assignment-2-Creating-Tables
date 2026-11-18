USE [BidNile]
GO

-- Table [Users].[Country]
INSERT [Users].[Country] ([CountryCode], [NameEn], [NameAr], [PhoneCode]) VALUES (N'AE', N'United Arab Emirates', N'الإمارات', N'+971')
INSERT [Users].[Country] ([CountryCode], [NameEn], [NameAr], [PhoneCode]) VALUES (N'EG', N'EGYPT', N'مصر', N'+20')
INSERT [Users].[Country] ([CountryCode], [NameEn], [NameAr], [PhoneCode]) VALUES (N'SA', N'Saudi Arabia', N'السعودية', N'+966')
GO

-- Table [Users].[City]
SET IDENTITY_INSERT [Users].[City] ON
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (3, N'Alexandria', N'EG')
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (1, N'Cairo', N'EG')
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (8, N'Dubai', N'AE')
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (5, N'Giza', N'EG')
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (7, N'Jeddah', N'SA')
INSERT [Users].[City] ([CityId], [Name], [CountryCode]) VALUES (6, N'Riyadh', N'SA')
SET IDENTITY_INSERT [Users].[City] OFF
GO

-- Table [Users].[Member]
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000001-0000-0000-0000-000000000001', N'أحمد محمود الشناوي', N'ahmed.shennawy@bidnile.com', N'2.01011E+11', N'2.9501E+13', '1995-01-01 00:00:00.000', '2026-11-18 19:31:43.888', 1, NULL, N'ar', NULL)
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000003-0000-0000-0000-000000000003', N'عمر شريف الدسوقي', N'omar.sherif@bidnile.com', N'+201033334444', N'29408201234569', '1994-08-20 00:00:00.000', '2024-01-15 09:00:00.000', 3, NULL, N'ar', '2024-01-15 10:00:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000005-0000-0000-0000-000000000005', N'راشد بن محمد المزروعي', N'rashed.mazrouei@bidnile.com', N'+971501234567', N'784199012345678', '1990-11-25 00:00:00.000', '2024-02-05 16:45:00.000', 6, NULL, N'ar', '2024-02-05 17:30:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000006-0000-0000-0000-000000000006', N'كريم هاني بدوي', N'karim.badawy@gmail.com', N'+201144445555', N'29802141234560', '1998-02-14 00:00:00.000', '2024-02-10 12:00:00.000', 1, N'a0000001-0000-0000-0000-000000000001', N'ar', '2024-02-10 13:00:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000008-0000-0000-0000-000000000008', N'ظپظ‡ط¯ ط¨ظ† ط³ظ„ط·ط§ظ† ط§ظ„ظ‚ط­ط·ط§ظ†ظٹ', N'fahad.qahtani@bidnile.com', N'+966552223344', N'1087654321', '1993-07-07 00:00:00.000', '2024-02-20 18:00:00.000', 6, N'a0000005-0000-0000-0000-000000000005', N'ar', '2024-02-21 11:00:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000009-0000-0000-0000-000000000009', N'منى سعيد المهيري', N'mona.almehairi@outlook.com', N'+971559876543', N'784199512345679', '1995-12-12 00:00:00.000', '2024-02-25 10:00:00.000', 7, N'a0000005-0000-0000-0000-000000000005', N'en', NULL)
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'a0000010-0000-0000-0000-000000000010', N'ياسمين طارق العادلي', N'yasmine.adly@gmail.com', N'2.01567E+11', N'2.9704E+13', '1997-04-04 00:00:00.000', '2026-11-18 19:31:49.617', 3, NULL, N'ar', NULL)
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'11111111-1111-1111-1111-111111111111', N'Ammar Yasser', N'ammar@example.com', N'+201011111111', N'29901010101111', '2004-06-15 00:00:00.000', '2024-01-10 10:00:00.000', 1, NULL, N'ar', '2024-01-11 12:00:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'22222222-2222-2222-2222-222222222222', N'Ahmed Mohamed', N'	ahmed@example.com', N'+201022222222', N'29802020202222', '1998-05-15 00:00:00.000', '2024-01-12 11:30:00.000', 1, N'11111111-1111-1111-1111-111111111111', N'ar', '2024-01-13 14:00:00.000')
INSERT [Users].[Member] ([MemberId], [FullName], [Email], [Mobile], [NationalId], [BirthDate], [RegisteredAt], [CityId], [InvitedByMemberId], [AppLanguage], [VerifiedAt]) VALUES (N'33333333-3333-3333-3333-333333333333', N'Mahmoud Ali', N'mahmoud@example.com', N'+201033333333', N'29703030303333x', '1997-08-20 00:00:00.000', '2024-01-15 09:15:00.000', 3, N'11111111-1111-1111-1111-111111111111', N'en', NULL)
GO

-- Table [Users].[Wallet]
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000001-0000-0000-0000-000000000001', 50000.00, 0.00, N'EGP', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000003-0000-0000-0000-000000000003', 42000.00, 0.00, N'EGP', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000005-0000-0000-0000-000000000005', 150000.00, 0.00, N'AED', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000006-0000-0000-0000-000000000006', 250000.00, 45000.00, N'EGP', '2024-03-05 14:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000008-0000-0000-0000-000000000008', 500000.00, 150000.00, N'SAR', '2024-03-05 15:30:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000009-0000-0000-0000-000000000009', 10000.00, 0.00, N'AED', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'a0000010-0000-0000-0000-000000000010', 95000.00, 20000.00, N'EGP', '2024-03-05 16:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'11111111-1111-1111-1111-111111111111', 120000.00, 0.00, N'EGP', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'22222222-2222-2222-2222-222222222222', 80000.00, 0.00, N'EGP', '2024-03-01 10:00:00.000')
INSERT [Users].[Wallet] ([MemberId], [Balance], [HeldAmount], [Currency], [LastUpdatedAt]) VALUES (N'33333333-3333-3333-3333-333333333333', 300000.00, 50000.00, N'SAR', '2024-03-01 10:00:00.000')
GO

-- Table [Logistics].[Warehouse]
SET IDENTITY_INSERT [Logistics].[Warehouse] ON
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerEmployeeId], [ManagerStartDate]) VALUES (6, N'ظ…ط³طھظˆط¯ط¹ ط§ظ„ظ‚ط§ظ‡ط±ط© ط§ظ„ظ…ط±ظƒط²ظٹ', 15000, 1, 30.0444196, 31.2357116, N'a0000001-0000-0000-0000-000000000001', '2024-01-10 00:00:00.000')
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerEmployeeId], [ManagerStartDate]) VALUES (7, N'ظ…ط³طھظˆط¯ط¹ ط§ظ„ط¥ط³ظƒظ†ط¯ط±ظٹط© ط§ظ„ظ„ظˆط¬ط³طھظٹ', 10000, 3, 31.2000924, 29.9187387, N'a0000003-0000-0000-0000-000000000003', '2024-01-12 00:00:00.000')
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerEmployeeId], [ManagerStartDate]) VALUES (8, N'ظ…ط³طھظˆط¯ط¹ ط§ظ„ط¬ظٹط²ط© ظ„ظ„طھط®ط²ظٹظ†', 8000, 5, 30.0130557, 31.2088526, N'a0000005-0000-0000-0000-000000000005', '2024-01-15 00:00:00.000')
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerEmployeeId], [ManagerStartDate]) VALUES (9, N'ظ…ط³طھظˆط¯ط¹ ط§ظ„ط±ظٹط§ط¶ ط§ظ„ط¥ظ‚ظ„ظٹظ…ظٹ', 25000, 6, 24.7135517, 46.6752957, N'11111111-1111-1111-1111-111111111111', '2024-02-01 00:00:00.000')
INSERT [Logistics].[Warehouse] ([WarehouseId], [Name], [MaxItems], [CityId], [Latitude], [Longitude], [ManagerEmployeeId], [ManagerStartDate]) VALUES (10, N'ظ…ط³طھظˆط¯ط¹ ط¯ط¨ظٹ ط§ظ„ط¬ظ†ظˆط¨ظٹ', 20000, 8, 25.2048493, 55.2707828, N'22222222-2222-2222-2222-222222222222', '2024-02-05 00:00:00.000')
SET IDENTITY_INSERT [Logistics].[Warehouse] OFF
GO

-- Table [Logistics].[Employee]
INSERT [Logistics].[Employee] ([EmployeeId], [WarehouseId]) VALUES (N'a0000001-0000-0000-0000-000000000001', 6)
INSERT [Logistics].[Employee] ([EmployeeId], [WarehouseId]) VALUES (N'a0000003-0000-0000-0000-000000000003', 7)
INSERT [Logistics].[Employee] ([EmployeeId], [WarehouseId]) VALUES (N'a0000005-0000-0000-0000-000000000005', 8)
INSERT [Logistics].[Employee] ([EmployeeId], [WarehouseId]) VALUES (N'11111111-1111-1111-1111-111111111111', 9)
INSERT [Logistics].[Employee] ([EmployeeId], [WarehouseId]) VALUES (N'22222222-2222-2222-2222-222222222222', 10)
GO

-- Table [Catalog].[Category]
INSERT [Catalog].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [Commission]) VALUES (100, NULL, N'Vehicles', N'مركبات', 5.00)
INSERT [Catalog].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [Commission]) VALUES (110, 100, N'Cars', N'سيارات', 7.50)
INSERT [Catalog].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [Commission]) VALUES (200, NULL, N'Electronics', N'إلكترونيات', 8.00)
INSERT [Catalog].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [Commission]) VALUES (210, 200, N'Mobiles', N'هواتف محمولة', 10.00)
INSERT [Catalog].[Category] ([CategoryId], [ParentCategoryId], [NameEn], [NameAr], [Commission]) VALUES (300, NULL, N'Antiques', N'تحف ومقتنيات', 15.00)
GO

-- Table [Catalog].[Item]
SET IDENTITY_INSERT [Catalog].[Item] ON
INSERT [Catalog].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerMemberId], [InspectorMemberId], [WarehouseId], [CategoryId], [ListedAt], [IsFeatured]) VALUES (1, N'طھظˆظٹظˆطھط§ ظƒظˆط±ظˆظ„ط§ 2020 ط¨ط­ط§ظ„ط© ظ…ظ…طھط§ط²ط©', N'ط³ظٹط§ط±ط© ظ…ط³طھط¹ظ…ظ„ط© ظپط§ط¨ط±ظٹظƒط§ ط¨ط§ظ„ظƒط§ظ…ظ„ طµظٹط§ظ†ط© طھظˆظƒظٹظ„ ظ…ط¹ ظƒطھط§ظ„ظˆط¬ط§طھ ط§ظ„ظˆظƒظٹظ„', 9, N'{"brand":"Toyota","model":"Corolla","year":2020,"mileageKm":45000,"transmission":"Automatic"}', N'a0000006-0000-0000-0000-000000000006', N'a0000001-0000-0000-0000-000000000001', 6, 110, '2024-02-15 10:00:00.000', 1)
INSERT [Catalog].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerMemberId], [InspectorMemberId], [WarehouseId], [CategoryId], [ListedAt], [IsFeatured]) VALUES (2, N'ظ‡ظٹظˆظ†ط¯ط§ظٹ طھظˆط³ط§ظ† 2021 ظƒط³ط± ط²ظٹط±ظˆ', N'ط³ظٹط§ط±ط© ط¹ط§ط¦ظ„ظٹط© ظƒط§ظ…ظ„ط© ط§ظ„ظ…ظˆط§طµظپط§طھ ظپطھط­ط© ط³ظ‚ظپ ط¨ط§ظ†ظˆط±ط§ظ…ط§ ط¨طµظ…ط©', 8, N'{"brand":"Hyundai","model":"Tucson","year":2021,"mileageKm":32000,"fuelType":"Petrol"}', N'a0000006-0000-0000-0000-000000000006', N'a0000001-0000-0000-0000-000000000001', 6, 110, '2024-02-16 11:30:00.000', 0)
INSERT [Catalog].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerMemberId], [InspectorMemberId], [WarehouseId], [CategoryId], [ListedAt], [IsFeatured]) VALUES (3, N'ط¢ظٹظپظˆظ† 15 ط¨ط±ظˆ ظ…ط§ظƒط³ 256 ط¬ظٹط¬ط§', N'ط¨ط­ط§ظ„ط© ظ…ظ…طھط§ط²ط© ظ…ط¹ ط§ظ„ط¹ظ„ط¨ط© ظˆظƒط§ظپط© ط§ظ„ظ…ظ„ط­ظ‚ط§طھ ط§ظ„ط£طµظ„ظٹط© ط¨ط·ط§ط±ظٹط© 96%', 9, N'{"brand":"Apple","storage":"256GB","color":"Natural Titanium","batteryHealth":96}', N'a0000010-0000-0000-0000-000000000010', N'a0000003-0000-0000-0000-000000000003', 7, 210, '2024-02-18 14:00:00.000', 1)
INSERT [Catalog].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerMemberId], [InspectorMemberId], [WarehouseId], [CategoryId], [ListedAt], [IsFeatured]) VALUES (4, N'ط³ط§ظ…ط³ظˆظ†ط¬ ط¬ط§ظ„ط§ظƒط³ظٹ S23 ط§ظ„طھط±ط§', N'ط§ط³طھط®ط¯ط§ظ… ط®ظپظٹظپ ط¬ط¯ط§ظ‹ ط´ط±ظٹط­طھظٹظ† ظ…ط¹ ط§ظ„ظ‚ظ„ظ… ط§ظ„ط£طµظ„ظٹ ظˆط¶ظ…ط§ظ† ط³ط§ط±ظٹ', 9, N'{"brand":"Samsung","storage":"512GB","color":"Phantom Black","ram":"12GB"}', N'a0000010-0000-0000-0000-000000000010', N'a0000003-0000-0000-0000-000000000003', 8, 210, '2024-02-20 09:15:00.000', 0)
INSERT [Catalog].[Item] ([ItemId], [Title], [Description], [ConditionScore], [Specifications], [SellerMemberId], [InspectorMemberId], [WarehouseId], [CategoryId], [ListedAt], [IsFeatured]) VALUES (5, N'ط³ط§ط¹ط© ط¬ظٹط¨ ط³ظˆظٹط³ط±ظٹط© ط£ط«ط±ظٹط© ظ†ط§ط¯ط±ط©', N'طھط¹ظˆط¯ ظ„ط£ظˆط§ط¦ظ„ ط§ظ„ظ‚ط±ظ† ط§ظ„ط¹ط´ط±ظٹظ† ظ…طµظ†ظˆط¹ط© ظ…ظ† ط§ظ„ظپط¶ط© ط§ظ„ط®ط§ظ„طµط© طھط¹ظ…ظ„ ط¨ط¯ظ‚ط©', 7, N'{"origin":"Switzerland","era":"1920s","material":"Silver 925","mechanism":"Mechanical"}', N'a0000010-0000-0000-0000-000000000010', N'a0000005-0000-0000-0000-000000000005', 6, 300, '2024-02-22 16:20:00.000', 1)
SET IDENTITY_INSERT [Catalog].[Item] OFF
GO

-- Table [Catalog].[ItemPhoto]
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (1, 1, N'https://cdn.bidnile.com/items/1/front.jpg', 1)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (1, 2, N'https://cdn.bidnile.com/items/1/interior.jpg', 0)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (2, 1, N'https://cdn.bidnile.com/items/2/front.jpg', 1)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (3, 1, N'https://cdn.bidnile.com/items/3/box.jpg', 1)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (3, 2, N'https://cdn.bidnile.com/items/3/back.jpg', 0)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (4, 1, N'https://cdn.bidnile.com/items/4/main.jpg', 1)
INSERT [Catalog].[ItemPhoto] ([ItemId], [Position], [Url], [IsMain]) VALUES (5, 1, N'https://cdn.bidnile.com/items/5/antique.jpg', 1)
GO

-- Table [Auctions].[Auction]
SET IDENTITY_INSERT [Auctions].[Auction] ON
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (7, 1, 600000.00, 650000.00, 5000.00, '2024-03-01 10:00:00 +02:00', '2024-03-05 18:00:00 +02:00', N'Ended', 750000.00)
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (8, 2, 750000.00, 800000.00, 5000.00, '2024-03-10 12:00:00 +03:00', '2024-03-15 20:00:00 +03:00', N'Live', 900000.00)
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (9, 3, 40000.00, 45000.00, 500.00, '2024-03-12 14:00:00 +02:00', '2024-03-18 22:00:00 +02:00', N'Live', 52000.00)
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (10, 4, 35000.00, 38000.00, 500.00, '2024-03-20 09:00:00 +04:00', '2024-03-25 18:00:00 +04:00', N'PendingReview', 45000.00)
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (11, 5, 15000.00, 20000.00, 200.00, '2024-02-01 10:00:00 +02:00', '2024-02-03 15:00:00 +02:00', N'Cancelled', 28000.00)
INSERT [Auctions].[Auction] ([AuctionId], [ItemId], [StartingPrice], [ReservePrice], [BidIncrement], [StartTime], [EndTime], [Status], [BuyNowPrice]) VALUES (12, 3, 38000.00, NULL, 500.00, '2024-04-01 10:00:00 +02:00', '2024-04-05 18:00:00 +02:00', N'Draft', NULL)
SET IDENTITY_INSERT [Auctions].[Auction] OFF
GO

-- Table [Auctions].[Bid]
SET IDENTITY_INSERT [Auctions].[Bid] ON
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (1, 7, N'a0000008-0000-0000-0000-000000000008', 605000.00, '2024-03-01 11:03:15.123', N'2001:db8:85a3::101')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (2, 7, N'a0000010-0000-0000-0000-000000000010', 610000.00, '2024-03-01 12:06:15.123', N'197.35.42.12')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (3, 7, N'a0000006-0000-0000-0000-000000000006', 615000.00, '2024-03-01 13:09:15.123', N'2001:db8:85a3::103')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (4, 7, N'a0000008-0000-0000-0000-000000000008', 620000.00, '2024-03-01 14:12:15.123', N'197.35.42.14')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (5, 7, N'a0000010-0000-0000-0000-000000000010', 625000.00, '2024-03-01 15:15:15.123', N'2001:db8:85a3::105')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (6, 7, N'a0000006-0000-0000-0000-000000000006', 630000.00, '2024-03-01 16:18:15.123', N'197.35.42.16')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (7, 7, N'a0000008-0000-0000-0000-000000000008', 635000.00, '2024-03-01 17:21:15.123', N'2001:db8:85a3::107')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (8, 7, N'a0000010-0000-0000-0000-000000000010', 640000.00, '2024-03-01 18:24:15.123', N'197.35.42.18')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (9, 7, N'a0000006-0000-0000-0000-000000000006', 645000.00, '2024-03-01 19:27:15.123', N'2001:db8:85a3::109')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (10, 7, N'a0000008-0000-0000-0000-000000000008', 650000.00, '2024-03-02 10:30:15.123', N'197.35.42.20')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (11, 7, N'a0000010-0000-0000-0000-000000000010', 655000.00, '2024-03-02 11:33:15.123', N'2001:db8:85a3::111')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (12, 7, N'a0000006-0000-0000-0000-000000000006', 660000.00, '2024-03-02 12:36:15.123', N'197.35.42.22')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (13, 7, N'a0000008-0000-0000-0000-000000000008', 665000.00, '2024-03-02 13:39:15.123', N'2001:db8:85a3::113')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (14, 7, N'a0000010-0000-0000-0000-000000000010', 670000.00, '2024-03-02 14:42:15.123', N'197.35.42.24')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (15, 7, N'a0000008-0000-0000-0000-000000000008', 675000.00, '2024-03-02 15:45:15.123', N'2001:db8:85a3::115')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (16, 8, N'a0000010-0000-0000-0000-000000000010', 755000.00, '2024-03-10 11:04:30.456', N'2001:db8:3333::201')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (17, 8, N'a0000006-0000-0000-0000-000000000006', 760000.00, '2024-03-10 12:08:30.456', N'156.204.11.22')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (18, 8, N'a0000008-0000-0000-0000-000000000008', 765000.00, '2024-03-10 13:12:30.456', N'2001:db8:3333::203')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (19, 8, N'a0000010-0000-0000-0000-000000000010', 770000.00, '2024-03-10 14:16:30.456', N'156.204.11.24')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (20, 8, N'a0000006-0000-0000-0000-000000000006', 775000.00, '2024-03-10 15:20:30.456', N'2001:db8:3333::205')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (21, 8, N'a0000008-0000-0000-0000-000000000008', 780000.00, '2024-03-10 16:24:30.456', N'156.204.11.26')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (22, 8, N'a0000010-0000-0000-0000-000000000010', 785000.00, '2024-03-10 17:28:30.456', N'2001:db8:3333::207')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (23, 8, N'a0000006-0000-0000-0000-000000000006', 790000.00, '2024-03-10 18:32:30.456', N'156.204.11.28')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (24, 8, N'a0000008-0000-0000-0000-000000000008', 795000.00, '2024-03-10 19:36:30.456', N'2001:db8:3333::209')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (25, 8, N'a0000010-0000-0000-0000-000000000010', 800000.00, '2024-03-11 10:40:30.456', N'156.204.11.30')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (26, 8, N'a0000006-0000-0000-0000-000000000006', 805000.00, '2024-03-11 11:44:30.456', N'2001:db8:3333::211')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (27, 8, N'a0000008-0000-0000-0000-000000000008', 810000.00, '2024-03-11 12:48:30.456', N'156.204.11.32')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (28, 8, N'a0000010-0000-0000-0000-000000000010', 815000.00, '2024-03-11 13:52:30.456', N'2001:db8:3333::213')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (29, 8, N'a0000006-0000-0000-0000-000000000006', 820000.00, '2024-03-11 14:56:30.456', N'156.204.11.34')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (30, 8, N'a0000008-0000-0000-0000-000000000008', 825000.00, '2024-03-11 15:00:30.456', N'2001:db8:3333::215')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (31, 9, N'a0000006-0000-0000-0000-000000000006', 40500.00, '2024-03-12 11:05:45.789', N'197.165.77.31')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (32, 9, N'a0000008-0000-0000-0000-000000000008', 41000.00, '2024-03-12 12:10:45.789', N'197.165.77.32')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (33, 9, N'a0000010-0000-0000-0000-000000000010', 41500.00, '2024-03-12 13:15:45.789', N'197.165.77.33')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (34, 9, N'a0000006-0000-0000-0000-000000000006', 42000.00, '2024-03-12 14:20:45.789', N'197.165.77.34')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (35, 9, N'a0000008-0000-0000-0000-000000000008', 42500.00, '2024-03-12 15:25:45.789', N'197.165.77.35')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (36, 9, N'a0000010-0000-0000-0000-000000000010', 43000.00, '2024-03-12 16:30:45.789', N'197.165.77.36')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (37, 9, N'a0000006-0000-0000-0000-000000000006', 43500.00, '2024-03-12 17:35:45.789', N'197.165.77.37')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (38, 9, N'a0000008-0000-0000-0000-000000000008', 44000.00, '2024-03-12 18:40:45.789', N'197.165.77.38')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (39, 9, N'a0000010-0000-0000-0000-000000000010', 44500.00, '2024-03-12 19:45:45.789', N'197.165.77.39')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (40, 9, N'a0000006-0000-0000-0000-000000000006', 45000.00, '2024-03-13 10:50:45.789', N'197.165.77.40')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (41, 9, N'a0000008-0000-0000-0000-000000000008', 45500.00, '2024-03-13 11:55:45.789', N'197.165.77.41')
INSERT [Auctions].[Bid] ([BidId], [AuctionId], [MemberId], [Amount], [PlacedAt], [DeviceIp]) VALUES (42, 9, N'a0000010-0000-0000-0000-000000000010', 46000.00, '2024-03-13 12:00:45.789', N'197.165.77.42')
SET IDENTITY_INSERT [Auctions].[Bid] OFF
GO

-- Table [Marketing].[AuctionFollower]
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (7, N'a0000006-0000-0000-0000-000000000006', '2024-03-01 10:15:00.000')
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (7, N'a0000008-0000-0000-0000-000000000008', '2024-03-01 11:00:00.000')
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (8, N'a0000006-0000-0000-0000-000000000006', '2024-03-10 12:30:00.000')
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (8, N'a0000010-0000-0000-0000-000000000010', '2024-03-10 13:00:00.000')
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (9, N'a0000008-0000-0000-0000-000000000008', '2024-03-12 14:15:00.000')
INSERT [Marketing].[AuctionFollower] ([AuctionId], [MemberId], [FollowedAt]) VALUES (9, N'a0000010-0000-0000-0000-000000000010', '2024-03-12 15:00:00.000')
GO
