CREATE DATABASE [DB_HBTT]
GO

USE [DB_HBTT]
GO

----------------------------------------------------------------------------------
-- Users --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users')
CREATE TABLE [Users] 
(
    [id_user] INT IDENTITY(100000001, 1) PRIMARY KEY, -- [id_user] has 9 digit, start with 1: '1xxxxxxxx'
    [name] NVARCHAR(50) DEFAULT N'Không có tên',
    [dob] DATE DEFAULT '2000-01-01',
    [usertype] VARCHAR(12) DEFAULT 'Customer',
    [username] VARCHAR(50) NOT NULL UNIQUE,
    [pwd] VARCHAR(50) NOT NULL, 

    CONSTRAINT check_usertype CHECK (usertype in ('Customer', 'Store Owner', 'Admin')),
) 
GO

-- User Email --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'User_Email')
CREATE TABLE [User_Email] 
(
    [id_user] INT,
    [email] VARCHAR(50) DEFAULT '',

    FOREIGN KEY (id_user) REFERENCES [Users](id_user), 
)
GO

-- User pNumber --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'User_Pnumber')
CREATE TABLE [User_Pnumber]
(
    [id_user] INT,
    [pNumber] CHAR(10) UNIQUE,   

    FOREIGN KEY (id_user) REFERENCES [Users](id_user), 
)
GO

-- User Address --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'User_Address')
CREATE TABLE [User_Address]
(
    [id_user] INT,
    [address] NVARCHAR(255),   

    FOREIGN KEY (id_user) REFERENCES [Users](id_user), 
)
GO
-- End User
----------------------------------------------------------------------------------

-- Store --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Store')
CREATE TABLE [Store]
(
    [id_store] INT IDENTITY(200000001, 1) PRIMARY KEY, -- [id_store] has 9 digit, start with 2: '2xxxxxxxx'
    [id_owner] INT,
    [name] NVARCHAR(50) NOT NULL,
    [noProduct] INT DEFAULT 0,
    [storeRating] FLOAT DEFAULT 0,

    FOREIGN KEY (id_owner) REFERENCES [Users](id_user),
)
GO
-- End Store --
----------------------------------------------------------------------------------

-- Category --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Category')
CREATE TABLE [Category]
(
    [id_category] INT IDENTITY(1001, 1) PRIMARY KEY, -- [id_category] has 4 digit, start with 1: '1xxx'
    [name] NVARCHAR(20) UNIQUE,
    [description] NVARCHAR(255) DEFAULT N'Không có mô tả',
)
GO
-- End Category --
----------------------------------------------------------------------------------

-- Product --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Product')
CREATE TABLE [Product]
(
    [id_product] INT IDENTITY(300000001, 1) PRIMARY KEY, -- [id_product] has 9 digit, start with 3: '3xxxxxxxx'
    [id_store] INT,
    [name] NVARCHAR(255) NOT NULL,
    [description] NVARCHAR(255) DEFAULT N'Sản phẩm này không có mô tả',
    [id_category] INT,
    [imgLink] VARCHAR(100),
    [price] INT,
    [quantity] INT DEFAULT 0,
    [productRating] FLOAT DEFAULT 0,
    [ratingCount] INT DEFAULT 0,
    [soldNumber] INT DEFAULT 0,

    FOREIGN KEY (id_store) REFERENCES [Store](id_store),
    FOREIGN KEY (id_category) REFERENCES [Category](id_category),
    CONSTRAINT check_price CHECK (price > 0),
)
GO
-- End Product --
----------------------------------------------------------------------------------

-- Rating --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Rating')
CREATE TABLE [Rating]
(
    [id_customer] INT,
    [id_product] INT,
    [detail] NVARCHAR(255) DEFAULT N'Không có nội dung đánh giá',
    [ratingStar] FLOAT DEFAULT 0,

    PRIMARY KEY (id_customer, id_product),
    FOREIGN KEY (id_customer) REFERENCES [Users](id_user),
    FOREIGN key (id_product) REFERENCES [Product](id_product),
    CONSTRAINT check_ratingStar CHECK (ratingStar BETWEEN 1.0 and 5.0),
)
GO
-- End Rating --
----------------------------------------------------------------------------------

-- Cart Item --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CartItem')
CREATE TABLE [CartItem]
(
    [id_user] INT,
    [id_product] INT,
    [quantity] INT DEFAULT 1,
    [totalPrice] INT,

    PRIMARY KEY (id_user, id_product),
    FOREIGN KEY (id_user) REFERENCES [Users](id_user),
    FOREIGN key (id_product) REFERENCES [Product](id_product),
)
GO
-- End Cart Item --
----------------------------------------------------------------------------------

-- Discount --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Discount')
CREATE TABLE [Discount]
(
    [id_discount] INT IDENTITY(400000001, 1) PRIMARY KEY, -- [id_discount] has 9 digit, start with 4: '4xxxxxxxx'
    [id_category] INT NOT NULL,
    [dateStart] DATE DEFAULT GETDATE(), 
    [dateEnd] DATE DEFAULT DATEADD(DAY, 7, GETDATE()), -- If [dateStart] and [dateEnd] don't have initial values, set the usable time for 7 days from the current time
    [discountPercent] DECIMAL(3,2), -- 1% is equal to 0.01 in [discountPercent]
    [discountMoney] INT,
    [maxDiscount] INT DEFAULT 100000,
    [minBill] INT DEFAULT 50000,
    [quantity] INT,

    FOREIGN KEY (id_category) REFERENCES [Category](id_category),
    CONSTRAINT check_discount CHECK (discountPercent * discountMoney = 0), -- Always have 1 value = 0
	CONSTRAINT check_discount2 CHECK (discountPercent + discountMoney > 0)
)
GO
-- End Discount
----------------------------------------------------------------------------------

-- Payment Method
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PaymentMethod')
CREATE TABLE [PaymentMethod]
(
    [id_pMethod] INT IDENTITY (2001, 1) PRIMARY KEY, -- [id_pMethod] has 4 digit, start with 2: '2xxx'
    [name] NVARCHAR(255) NOT NULL,
)
GO 
-- End Payment Method
----------------------------------------------------------------------------------

-- Order  -- 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Order')
CREATE TABLE [Order]
(
    [id_order] INT IDENTITY(500000001, 1) PRIMARY KEY, -- [id_order] has 9 digit, start with 5: '5xxxxxxxx'
    [id_customer] INT,
    [id_discount] INT,
    [id_pMethod] INT,
    [totalPrice] INT,
    [address] NVARCHAR(255) NOT NULL,
    [pNumber] VARCHAR(10) NOT NULL,
    [status] VARCHAR(10) DEFAULT 'Waiting',

    FOREIGN KEY (id_customer) REFERENCES [Users](id_user),
    FOREIGN KEY (id_discount) REFERENCES [Discount](id_discount),
    FOREIGN KEY (id_pMethod) REFERENCES [PaymentMethod](id_pMethod),
    CONSTRAINT check_statusOrder CHECK (status in ('Waiting', 'Confirmed')),
)
GO
-- End Order
----------------------------------------------------------------------------------

-- Order Item --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OrderItem')
CREATE TABLE [OrderItem]
(
    [id_order] INT,
    [id_product] INT,
    [quantity] INT,
    [totalPrice] INT,
    [status] VARCHAR(10) DEFAULT 'Waiting',
    [rated] VARCHAR(3) DEFAULT 'No',

    FOREIGN KEY (id_order) REFERENCES [Order](id_order),
    FOREIGN KEY (id_product) REFERENCES [Product](id_product),
    CONSTRAINT check_statusOrderItem CHECK (status in ('Waiting', 'Confirmed')),
    CONSTRAINT check_rated CHECK (rated in ('No', 'Yes')),
)
GO
-- End Order Item -- 
----------------------------------------------------------------------------------

-- Bill --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Bill')
CREATE TABLE [Bill]
(
    [id_bill] INT IDENTITY(600000001, 1) PRIMARY KEY, -- [id_bill] has 9 digit, start with 5: '6xxxxxxxx'
    [id_order] INT,
    [id_customer] INT,
    [totalPrice] INT,
    [address] NVARCHAR(255) NOT NULL,
    [pNumber] VARCHAR(10) NOT NULL,
    [time] DATE,

    FOREIGN KEY (id_order) REFERENCES [Order](id_order),
    FOREIGN KEY (id_customer) REFERENCES [Users](id_user),
)
GO
-- End Bill -- 
----------------------------------------------------------------------------------

-- Delivery Services --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeliveryService')
CREATE TABLE [DeliveryService]
(
    [id_delivery] INT IDENTITY(700000001, 1) PRIMARY KEY, -- [id_bill] has 9 digit, start with 5: '7xxxxxxxx'
    [name] NVARCHAR(50) NOT NULL,
)
GO
-- End Delivery Services --
----------------------------------------------------------------------------------

-- Delivery Service Email --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeliveryServiceEmail')
CREATE TABLE [DeliveryServiceEmail]
(
    [id_delivery] INT,
    [email] VARCHAR(50) NOT NULL,

    FOREIGN KEY (id_delivery) REFERENCES [DeliveryService](id_delivery),
)
GO
-- End Delivery Service Email --
----------------------------------------------------------------------------------

-- Delivery Service Address --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeliveryServiceAddress')
CREATE TABLE [DeliveryServiceAddress]
(
    [id_delivery] INT,
    [address] NVARCHAR(255) NOT NULL,

    FOREIGN KEY (id_delivery) REFERENCES [DeliveryService](id_delivery),
)
GO
-- End Delivery Services Address --
----------------------------------------------------------------------------------

-- Delivery Service pNumber --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DeliveryServicePNumber')
CREATE TABLE [DeliveryServicePNumber]
(
    [id_delivery] INT,
    [pNumber] VARCHAR(255) NOT NULL,

    FOREIGN KEY (id_delivery) REFERENCES [DeliveryService](id_delivery),
)
GO
-- End Delivery Services pNumber --
----------------------------------------------------------------------------------

-- Waybill --
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Waybill')
CREATE TABLE [Waybill]
(
    [id_waybill] INT IDENTITY(800000001, 1) PRIMARY KEY, -- [id_waybill] has 9 digit, start with 8: '8xxxxxxxx'
    [id_bill] INT,
    [id_delivery] INT,
    [customerName] NVARCHAR(50),
    [customerPhone] VARCHAR(10),
    [customerAddress] NVARCHAR(255),
    [dateStart] DATE DEFAULT GETDATE(),
    [datePredict] DATE DEFAULT DATEADD(DAY, 4, GETDATE()),

    FOREIGN KEY (id_bill) REFERENCES [Bill](id_bill),
    FOREIGN KEY (id_delivery) REFERENCES [DeliveryService](id_delivery),
)
GO
-- End Waybill --
