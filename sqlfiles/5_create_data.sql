USE [DB_HBTT]
GO

-- Insert 10 tuples into [Users] table
INSERT INTO [Users] ([name], [dob], [usertype], [username], [pwd])
VALUES
    (N'Nguyễn Văn A', '1990-05-15', 'Customer', 'nva', '123'),
    (N'Trần Thị B', '1985-08-20', 'Customer', 'ttb', '123'),
    (N'Lê Văn C', '2000-03-10', 'Customer', 'lvc', '123'),
    (N'Phạm Thị D', '1998-11-25', 'Customer', 'ptd', '123'),
    (N'Hồ Văn E', '1995-07-03', 'Customer', 'hve', '123'),
    (N'Đặng Thị F', '1987-12-18', 'Customer', 'dtf', '123'),
    (N'Vũ Văn G', '1992-09-08', 'Store Owner', 'vvg', '123'),
    (N'Ngô Thị H', '2001-04-30', 'Store Owner', 'nth', '123'),
    (N'Lý Văn I', '1983-06-22', 'Store Owner', 'lvi', '123'),
    (N'Mai Thị K', '1994-02-14', 'Admin', 'mtk', '123');
GO
-- Select all data from [Users] to verify
-- SELECT * FROM [Users];

-- Insert sample data into [User_Email] table
INSERT INTO [User_Email] ([id_user], [email])
VALUES
    (100000001, 'nva1@gmail.com'),
    (100000001, 'nva2@gmail.com'),
    (100000002, 'ttb@gmail.com'),
    (100000003, 'lvc@gmail.com'),
    (100000004, 'ptd1@gmail.com'),
    (100000004, 'ptd2@gmail.com'),
    (100000005, 'hve@gmail.com'),
    (100000006, 'dtf@gmail.com'),
    (100000007, 'vvg@gmail.com'),
    (100000008, 'nth1@gmail.com'),
    (100000008, 'bth2@gmail.com'),
    (100000009, 'lvi1@gmail.com'),
    (100000009, 'lvi2@gmail.com'),
    (100000010, 'mtk@gmail.com');
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
    (100000001, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM'),
    (100000001, N'123 đường Trần Hưng Đạo, Q.1, Tp.HCM'),
    (100000002, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội'),
    (100000003, N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM'),
    (100000004, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM'),
    (100000005, N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng'),
    (100000006, N'100 Đặng Văn Bi, Bình Thọ, Thủ Đức, Tp.HCM'),
    (100000007, N'54 đường Nguyễn Lương Bằng, Q.Liên Chiểu, Đà Nẵng'),
    (100000008, N'56 đường Nguyễn Tất Thành, Q.10, Tp.HCM'),
    (100000009, N'đường số 13 Tân Thuận Đông, Quận 7, Tp.HCM'),
    (100000010, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM');
GO

-- Select all data from [User_Address] to verify
-- SELECT * FROM [User_Address];


INSERT INTO [Store] ([id_owner], [name])
VALUES
    (100000007, N'Cửa Hàng Chính Hãng Logitech'),
    (100000008, N'NowSaiGon'),
    (100000009, N'Cửa Hàng Đồ Gia Dụng Home Essential');
GO
-- Select all data from [Store] to verify
-- SELECT * FROM [Store];

-- Insert sample data into [Category] table
INSERT INTO [Category] ([name], [description])
VALUES
    (N'Điện tử', N'Thiết bị và phụ kiện điện tử'),
    (N'Quần Áo', N'Quần áo và phụ kiện thời trang'),
    (N'Trang Trí Nhà Cửa', N'Đồ nội thất, trang trí và phụ kiện nhà cửa'),
    (N'Sách', N'Sách thuộc nhiều thể loại'),
    (N'Thể Thao', N'Thiết bị và đồ dùng thể thao'),
    (N'Làm Đẹp', N'Mỹ phẩm và sản phẩm làm đẹp'),
    (N'Oto', N'Phụ tùng và phụ kiện ô tô'),
    (N'Đồ Chơi', N'Đồ chơi và trò chơi cho mọi độ tuổi'),
    (N'Tiêu Dùng', N'Tiêu dùng và hàng gia dụng cần thiết'),
    (N'Sức Khỏe', N'Sản phẩm chăm sóc sức khỏe và phong cách sống');
GO
-- Select all data from [Category] to verify
-- SELECT * FROM [Category];


-- Insert sample data into [Product] table
INSERT INTO [Product] ([id_store], [name], [id_category], [imgLink], [price], [quantity])
VALUES
    (200000001, N'Bàn Phím Logitech G Pro X', 1001, N'https://example.com/keyboard1.jpg', 2500000, 50),
    (200000001, N'Chuột Gaming Logitech G502', 1001, N'https://example.com/mouse1.jpg', 800000, 40),
    (200000001, N'Tai Nghe Logitech G Pro X', 1001, N'https://example.com/headset1.jpg', 1200000, 30),
    (200000002, N'Bánh Mì Gà Nướng Phô Mai', 1009, N'https://example.com/banhmi1.jpg', 25000, 100),
    (200000002, N'Cà Phê Sữa Đá', 1009, N'https://example.com/coffee1.jpg', 40000, 150),
    (200000002, N'Pizza NowSaiGon', 1009, N'https://example.com/pizza1.jpg', 180000, 20),
    (200000003, N'Bàn Là Hơi Nước', 1003, N'https://example.com/iron1.jpg', 490000, 15),
    (200000003, N'Nồi Cơm Điện', 1003, N'https://example.com/ricecooker1.jpg', 360000, 25),
    (200000003, N'Chảo Chống Dính', 1003, N'https://example.com/fryingpan1.jpg', 120000, 35)
GO
-- Select all data from [Product] to verify
-- SELECT * FROM [Product];

-- Insert sample data into [Discount] table
INSERT INTO [Discount] ([id_category], [dateStart], [dateEnd], [discountPercent], [discountMoney], [maxDiscount], [minBill], [quantity])
VALUES
    (1001, '2023-01-01', '2024-01-31', 0.1, 0, 50000, 100000, 50),
    (1002, '2023-02-01', '2024-02-28', 0.15, 0, 75000, 120000, 30),
    (1003, '2023-03-01', '2024-03-31', 0.20, 0, 100000, 150000, 20),
    (1004, '2023-04-01', '2024-04-30', 0.25, 0, 120000, 180000, 15),
    (1005, '2023-05-01', '2024-05-31', 0.30, 0, 150000, 200000, 10),
    (1006, '2023-06-01', '2024-06-30', 0, 10000, 30000, 50000, 100),
    (1007, '2023-07-01', '2024-07-31', 0, 20000, 50000, 80000, 80),
    (1008, '2023-08-01', '2024-08-31', 0, 30000, 75000, 100000, 60),
    (1009, '2023-09-01', '2024-09-30', 0, 40000, 100000, 120000, 40),
    (1010, '2023-10-01', '2024-10-31', 0, 50000, 120000, 150000, 30);
GO
-- Select all data from [Discount] to verify
-- SELECT * FROM [Discount];

-- Insert of sample data into [PaymentMethod] table
INSERT INTO [PaymentMethod] ([name])
VALUES
    (N'Thẻ Tín Dụng'),
    (N'Thẻ Ghi Nợ'),
    (N'PayPal'),
    (N'Chuyển Khoản Ngân Hàng'),
    (N'Thanh Toán Bằng Tiền Mặt');
GO
-- Select all data from [PaymentMethod] to verify
-- SELECT * FROM [PaymentMethod];

-- Insert sample data into [DeliveryService]
INSERT INTO [DeliveryService] ([name])
VALUES
    (N'Giao Hàng Nhanh'),
    (N'Viettel Post'),
    (N'GrabExpress'),
    (N'J&T Express'),
    (N'NowShip');
GO
-- Insert sample data into [DeliveryServiceEmail]
INSERT INTO [DeliveryServiceEmail] ([id_delivery], [email])
VALUES
    (700000001, 'GHN@gmail.com'),
    (700000002, 'VTP@gmail.com'),
    (700000003, 'GRAB@gmail.com'),
    (700000004, 'JnT@gmail.com'),
    (700000005, 'NowShip@gmail.com');
GO
-- Insert sample data into [DeliveryServiceAddress]
INSERT INTO [DeliveryServiceAddress] ([id_delivery], [address])
VALUES
    (700000001, N'123 Đường Hùng Vương, Quận Hải Châu, Thành phố Đà Nẵng'),
    (700000002, N'456 Đường Lê Lợi, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng'),
    (700000003, N'789 Đường Nguyễn Sinh Cung, Quận Cẩm Lệ, Thành phố Đà Nẵng'),
    (700000004, N'101 Đường Trưng Nữ Vương, Quận Sơn Trà, Thành phố Đà Nẵng'),
    (700000005, N'222 Đường Điện Biên Phủ, Quận Liên Chiểu, Thành phố Đà Nẵng');
GO
-- Insert sample data into [DeliveryServicePNumber]
INSERT INTO [DeliveryServicePNumber] ([id_delivery], [pNumber])
VALUES
    (700000001, '0983115577'),
    (700000002, '0381777888'),
    (700000003, '0913555777'),
    (700000004, '0168666888'),
    (700000005, '0975987687');
GO
-- Select all data from [DeliveryService], [DeliveryServiceEmail], [DeliveryServiceAddress], and [DeliveryServicePNumber] to verify
-- SELECT * FROM [DeliveryService];
-- SELECT * FROM [DeliveryServiceEmail];
-- SELECT * FROM [DeliveryServiceAddress];
-- SELECT * FROM [DeliveryServicePNumber];

INSERT INTO [CartItem] ([id_user], [id_product], [quantity], [totalPrice])
VALUES
    (100000001, 300000001, 2, 5000000),  -- Bàn Phím Logitech G Pro X
    (100000001, 300000002, 1, 800000),   -- Chuột Gaming Logitech G502
    (100000001, 300000003, 3, 3600000),  -- Tai Nghe Logitech G Pro X
    (100000002, 300000004, 2, 50000),  -- Bánh Mì Gà Nướng Phô Mai
    (100000002, 300000005, 1, 40000),  -- Cà Phê Sữa Đá
    (100000002, 300000006, 3, 540000), -- Pizza NowSaiGon
    (100000003, 300000007, 1, 490000), -- Bàn Là Hơi Nước
    (100000003, 300000008, 2, 720000), -- Nồi Cơm Điện
    (100000003, 300000009, 1, 120000), -- Chảo Chống Dính
    (100000004, 300000001, 3, 7500000), -- Sản phẩm khác cho cửa hàng 200000003
    (100000004, 300000002, 1, 800000),  -- Sản phẩm khác cho cửa hàng 200000003
    (100000004, 300000003, 2, 2400000),  -- Sản phẩm khác cho cửa hàng 200000003
    (100000005, 300000001, 1, 2500000), -- Bàn Phím Logitech G Pro X
    (100000005, 300000002, 2, 1600000), -- Chuột Gaming Logitech G502
    (100000005, 300000003, 3, 3600000); -- Tai Nghe Logitech G Pro X
GO
-- SELECT * FROM [CartItem]

-- Insert sample data into [Order] table
INSERT INTO [Order] ([id_customer], [id_discount], [id_pMethod], [address], [pNumber])
VALUES
    (100000001, 400000001, 2001, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM', '0918827371'),
    (100000002, 400000003, 2003, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', '0989671562'),
    (100000003, 400000005, 2005, N'123 đường Nguyễn Văn Linh, Q.7, Tp.HCM', '0912345678'),
    (100000004, 400000002, 2002, N'456 đường Lê Lợi, Q.1, Tp.HCM', '0909876543'),
    (100000005, 400000004, 2004, N'789 đường Cách Mạng Tháng Tám, Q.3, Tp.HCM', '0978563412');
GO
-- Select all data from [Order] to verify
-- SELECT * FROM [Order];

-- Insert of sample data for each id_order into [OrderItem] table
INSERT INTO [OrderItem] ([id_order], [id_product], [quantity], [totalPrice])
VALUES
    (500000001, 300000001, 2, 5000000),
    (500000001, 300000002, 1, 800000),
    
    (500000002, 300000003, 3, 3600000),
    (500000002, 300000004, 2, 50000),
    
    (500000003, 300000005, 1, 40000),
    (500000003, 300000006, 4, 720000),
    
    (500000004, 300000007, 2, 980000),
    (500000004, 300000008, 1, 360000),
    
    (500000005, 300000009, 3, 360000);
GO
-- Select all data from [OrderItem] to verify
-- SELECT * FROM [OrderItem];
/*
INSERT INTO [Rating] ([id_customer], [id_product], [detail], [ratingStar])
VALUES
GO
-- Select all data from [Rating] to verify
-- SELECT * FROM [Rating];

-- Insert data into the Bill table
INSERT INTO [Bill] ([id_order], [id_customer], [totalPrice], [address], [pNumber], [time])
VALUES
GO

-- SELECT * FROM [Bill];

-- Insert sample data into [Waybill] (for 2 orders)
INSERT INTO [Waybill] ([id_bill], [id_delivery], [customerName], [customerPhone], [customerAddress], [dateStart], [datePredict])
VALUES
GO
-- Select all data from [Waybill] to verify
-- SELECT * FROM [Waybill];

-- Insert sample data into [Rating] table
INSERT INTO [Rating] ([id_customer], [id_product], [detail], [ratingStar])
VALUES
GO
-- Select all data from [Rating] to verify
-- SELECT * FROM [Rating];

-- Insert sample data into [CartItem] table
INSERT INTO [CartItem] ([id_user], [id_product], [quantity], [totalPrice])
VALUES
GO
-- Select all data from [CartItem] to verify
-- SELECT * FROM [CartItem];
*/
