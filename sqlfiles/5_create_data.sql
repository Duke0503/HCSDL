USE [DB_HBTT]
GO

-- Insert 10 tuples into [Users] table
INSERT INTO [Users] ([name], [dob], [usertype], [username], [pwd])
VALUES
    (N'John Doe', '1990-05-15', 'Customer', 'john_doe', 'password1'),
    (N'Jane Smith', '1985-08-20', 'Store Owner', 'jane_smith', 'securepwd2'),
    (N'Bob Johnson', '2000-03-10', 'Admin', 'bob_j', 'admin123'),
    (N'Alice Brown', '1998-11-25', 'Customer', 'alice_b', 'Customerpass'),
    (N'David White', '1995-07-03', 'Store Owner', 'david_w', 'storepwd'),
    (N'Eva Green', '1987-12-18', 'Customer', 'eva_g', 'mypassword'),
    (N'Mark Wilson', '1992-09-08', 'Admin', 'mark_w', 'pass1234'),
    (N'Susan Lee', '2001-04-30', 'Customer', 'susan_l', 'secure123'),
    (N'Alex Turner', '1983-06-22', 'Store Owner', 'alex_t', 'turnerpass'),
    (N'Linda Adams', '1994-02-14', 'Customer', 'linda_a', 'mypwd');
GO
-- Select all data from [Users] to verify
-- SELECT * FROM [Users];

-- Insert sample data into [User_Email] table
INSERT INTO [User_Email] ([id_user], [email])
VALUES
    (100000001, 'john_doe@example.com'),
    (100000002, 'jane_smith@example.com'),
    (100000003, 'bob_j@example.com'),
    (100000004, 'alice_b@example.com'),
    (100000005, 'david_w@example.com'),
    (100000006, 'eva_g@example.com'),
    (100000007, 'mark_w@example.com'),
    (100000008, 'susan_l@example.com'),
    (100000009, 'alex_t@example.com'),
    (100000010, 'linda_a@example.com');
GO
-- Select all data from [User_Email] to verify
-- SELECT * FROM [User_Email];

-- Insert sample data into [User_Pnumber] table
INSERT INTO [User_Pnumber] ([id_user], [pNumber])
VALUES
    (100000001, '0918827371'),
    (100000002, '0987126361'),
    (100000003, '0989671562'),
    (100000004, '0912831623'),
    (100000005, '0371892342'),
    (100000006, '0161239812'),
    (100000007, '0987123582'),
    (100000008, '0938712631'),
    (100000009, '0912346912'),
    (100000010, '0123648124');
GO
-- Select all data from [User_Pnumber] to verify
-- SELECT * FROM [User_Pnumber];

-- Insert sample data into [User_Address] table
INSERT INTO [User_Address] ([id_user], [address])
VALUES
    (100000001, N'123 Main Street, CityA'),
    (100000002, N'456 Oak Avenue, CityB'),
    (100000003, N'789 Pine Lane, CityC'),
    (100000004, N'101 Elm Road, CityD'),
    (100000005, N'222 Maple Drive, CityE'),
    (100000006, N'333 Cedar Street, CityF'),
    (100000007, N'444 Birch Avenue, CityG'),
    (100000008, N'555 Spruce Lane, CityH'),
    (100000009, N'666 Pine Road, CityI'),
    (100000010, N'777 Oak Drive, CityJ');
GO
-- Select all data from [User_Address] to verify
-- SELECT * FROM [User_Address];


INSERT INTO [Store] ([id_owner], [name])
VALUES
    (100000002, N'Electronics Hub'),
    (100000005, N'Fashion World'),
    (100000009, N'Home Essentials');
GO
-- Select all data from [Store] to verify
-- SELECT * FROM [Store];

-- Insert sample data into [Category] table
INSERT INTO [Category] ([name], [description])
VALUES
    (N'Electronics', N'Electronic devices and accessories'),
    (N'Clothing', N'Apparel and fashion accessories'),
    (N'Home Decor', N'Furniture, decorations, and home accessories'),
    (N'Books', N'Books of various genres'),
    (N'Sports', N'Sports equipment and gear'),
    (N'Beauty', N'Cosmetics and beauty products'),
    (N'Automotive', N'Auto parts and accessories'),
    (N'Toys', N'Toys and games for all ages'),
    (N'Groceries', N'Food and household essentials'),
    (N'Health', N'Health and wellness products');
GO
-- Select all data from [Category] to verify
-- SELECT * FROM [Category];


-- Insert 10 tuples of sample data into [Product] table
INSERT INTO [Product] ([id_store], [name], [id_category], [imgLink], [price], [quantity])
VALUES
    (200000001, N'Laptop XYZ', 1001, 'laptop_xyz.jpg', 1200, 50),
    (200000002, N'T-shirt Blue', 1002, 'tshirt_blue.jpg', 25, 100),
    (200000003, N'Sofa Set', 1003, 'sofa_set.jpg', 800, 20),
    (200000002, N'Mystery Novel', 1004, 'mystery_novel.jpg', 15, 50),
    (200000002, N'Tennis Racket', 1005, 'tennis_racket.jpg', 50, 30),
    (200000001, N'Makeup Kit', 1006, 'makeup_kit.jpg', 40, 40),
    (200000002, N'Car Accessories Kit', 1007, 'car_accessories.jpg', 100, 15),
    (200000001, N'Toy Robot', 1008, 'toy_robot.jpg', 30, 80),
    (200000001, N'Rice Bag', 1009, 'rice_bag.jpg', 10, 200),
    (200000002, N'Vitamin C Supplement', 1010, 'vitamin_c.jpg', 15, 60);
GO
-- Select all data from [Product] to verify
-- SELECT * FROM [Product];
UPDATE [Product] SET quantity = 111 WHERE id_product = 300000011
-- Insert 10 tuples of sample data into [Rating] table
INSERT INTO [Rating] ([id_customer], [id_product], [detail], [ratingStar])
VALUES
    (100000001, 300000001, N'Great laptop!', 4),
    (100000002, 300000002, N'Nice T-shirt, fits well.', 3),
    (100000003, 300000003, N'Comfortable sofa set.', 4),
    (100000004, 300000004, N'Exciting mystery novel!', 3),
    (100000005, 300000005, N'Excellent tennis racket!', 4),
    (100000006, 300000006, N'Love this makeup kit!', 4),
    (100000007, 300000007, N'Great car accessories kit!', 4),
    (100000008, 300000008, N'Fun toy robot for kids.', 3),
    (100000009, 300000009, N'Quality rice bag.', 4),
    (100000010, 300000010, N'Good vitamin C supplement.', 4);
GO
-- Select all data from [Rating] to verify
-- SELECT * FROM [Rating];

-- Insert 5 tuples of sample data into [CartItem] table
INSERT INTO [CartItem] ([id_user], [id_product], [quantity], [totalPrice])
VALUES
    (100000001, 300000001, 2, 2400),  -- 2 laptops in the cart
    (100000002, 300000002, 3, 75),    -- 3 T-shirts in the cart
    (100000003, 300000003, 1, 800),   -- 1 sofa set in the cart
    (100000004, 300000004, 5, 75),    -- 5 mystery novels in the cart
    (100000005, 300000005, 2, 100);   -- 2 tennis rackets in the cart
GO
-- Select all data from [CartItem] to verify
-- SELECT * FROM [CartItem];

-- Insert 5 tuples of sample data into [Discount] table
INSERT INTO [Discount] ([id_category], [dateStart], [dateEnd], [discountPercent], [discountMoney], [maxDiscount], [minBill], [quantity])
VALUES
    (1001, '2023-04-01', '2023-04-10', 0.15, NULL, 200000, 60000, 100), -- 15% off on Electronics for 10 days
    (1002, '2023-04-05', '2023-04-15', NULL, 50, 150000, 80000, 50),  -- $50 off on Clothing for 10 days
    (1003, '2023-04-10', '2023-04-20', 0.20, NULL, 250000, 70000, 75),  -- 20% off on Home Decor for 10 days
    (1004, '2023-04-15', '2023-04-25', NULL, 30, 180000, 55000, 40),  -- $30 off on Books for 10 days
    (1005, '2023-04-20', '2023-04-30', 0.18, NULL, 220000, 65000, 60);  -- 18% off on Sports for 10 days
GO
-- Select all data from [Discount] to verify
-- SELECT * FROM [Discount];

-- Insert 3 tuples of sample data into [PaymentMethod] table
INSERT INTO [PaymentMethod] ([name])
VALUES
    (N'Credit Card'),
    (N'PayPal'),
    (N'Bank Transfer');
GO
-- Select all data from [PaymentMethod] to verify
-- SELECT * FROM [PaymentMethod];

-- Insert 5 tuples of sample data into [Order] table
INSERT INTO [Order] ([id_customer], [id_discount], [id_pMethod], [totalPrice], [address], [pNumber])
VALUES
    (100000001, 400000001, 2001, 1200, N'123 Main St', '1234567890'),
    (100000002, 400000002, 2002, 800, N'456 Oak Ave', '9876543210'),
    (100000003, 400000003, 2003, 1500, N'789 Pine Ln', '1112233445'),
    (100000004, 400000004, 2001, 500, N'101 Elm St', '9988776655'),
    (100000005, 400000005, 2002, 1000, N'202 Maple Dr', '1122334455');
GO

-- Select all data from [Order] to verify
-- SELECT * FROM [Order];

-- Insert 2 tuples of sample data for each id_order into [OrderItem] table
INSERT INTO [OrderItem] ([id_order], [id_product], [quantity], [totalPrice], [status], [rated])
VALUES
    -- Order 500000001
    (500000001, 300000001, 2, 240, 'Waiting', 'No'),
    (500000001, 300000002, 1, 180, 'Confirmed', 'No'),

    -- Order 500000002
    (500000002, 300000003, 3, 300, 'Confirmed', 'No'),
    (500000002, 300000004, 2, 200, 'Waiting', 'No'),

    -- Order 500000003
    (500000003, 300000005, 1, 150, 'Waiting', 'No'),
    (500000003, 300000006, 4, 400, 'Confirmed', 'No'),

    -- Order 500000004
    (500000004, 300000007, 2, 100, 'Waiting', 'No'),
    (500000004, 300000008, 1, 50, 'Confirmed', 'No'),

    -- Order 500000005
    (500000005, 300000009, 3, 300, 'Confirmed', 'No'),
    (500000005, 300000010, 2, 200, 'Waiting', 'No');
GO
-- Select all data from [OrderItem] to verify
-- SELECT * FROM [OrderItem];

-- Insert data into the Bill table
INSERT INTO [Bill] ([id_order], [id_customer], [totalPrice], [address], [pNumber], [time])
VALUES
    (500000001, 100000001, 500, '123 Main St', '555-1234', '2023-01-15'),
    (500000002, 100000002, 750, '456 Oak St', '555-5678', '2023-01-16'),
    (500000003, 100000003, 600, '789 Pine St', '555-9012', '2023-01-17'),
    (500000004, 100000004, 900, '321 Elm St', '555-3456', '2023-01-18'),
    (500000005, 100000005, 800, '654 Birch St', '555-7890', '2023-01-19');
GO

-- SELECT * FROM [Bill];

-- Insert sample data into [DeliveryService]
INSERT INTO [DeliveryService] ([name])
VALUES
    (N'Delivery Express'),
    (N'Standard Delivery'),
    (N'Next Day Delivery');
GO
-- Insert sample data into [DeliveryServiceEmail]
INSERT INTO [DeliveryServiceEmail] ([id_delivery], [email])
VALUES
    (700000001, 'express@delivery.com'),
    (700000002, 'standard@delivery.com'),
    (700000003, 'nextday@delivery.com');
GO
-- Insert sample data into [DeliveryServiceAddress]
INSERT INTO [DeliveryServiceAddress] ([id_delivery], [address])
VALUES
    (700000001, 'Express Delivery HQ, City'),
    (700000002, 'Standard Delivery Office, Town'),
    (700000003, 'Next Day Delivery Center, Village');
GO
-- Insert sample data into [DeliveryServicePNumber]
INSERT INTO [DeliveryServicePNumber] ([id_delivery], [pNumber])
VALUES
    (700000001, '1234567890'),
    (700000002, '9876543210'),
    (700000003, '1112233445');
GO
-- Select all data from [DeliveryService], [DeliveryServiceEmail], [DeliveryServiceAddress], and [DeliveryServicePNumber] to verify
-- SELECT * FROM [DeliveryService];
-- SELECT * FROM [DeliveryServiceEmail];
-- SELECT * FROM [DeliveryServiceAddress];
-- SELECT * FROM [DeliveryServicePNumber];

-- Insert sample data into [Waybill] (for 2 orders)
INSERT INTO [Waybill] ([id_bill], [id_delivery], [customerName], [customerPhone], [customerAddress], [dateStart], [datePredict])
VALUES
    (600000001, 700000001, N'John Doe', '1234567890', '123 Main St, City', GETDATE(), DATEADD(DAY, 4, GETDATE())),
    (600000002, 700000002, N'Jane Smith', '9876543210', '456 Oak Ave, Town', GETDATE(), DATEADD(DAY, 4, GETDATE()));
GO
-- Select all data from [Waybill] to verify
-- SELECT * FROM [Waybill];