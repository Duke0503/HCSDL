USE [DB_HBTT]
GO

-- Insert 10 tuples into [Users] table
INSERT INTO [Users] ([name], [dob], [usertype], [username], [pwd])
VALUES
    (N'Nguyễn Trung Vương', '1990-05-15', 'Customer', 'vuong_nguyen123', '123'),
    (N'Nguyễn Ngọc Khánh My', '1985-08-20', 'Store Owner', 'mirumiru0208', '123'),
    (N'Bùi Phước Ban', '2000-03-10', 'Admin', 'bbui2010', '123'),
    (N'Vũ Xuân Mai Trung', '1998-11-25', 'Customer', 'vxmtung001', '123'),
    (N'Đỗ Minh Đức', '1995-07-03', 'Store Owner', 'duckisreal', '123'),
    (N'Trần Minh Hiếu', '1987-12-18', 'Customer', 'hieupropro369', '123'),
    (N'Phạm Châu Thanh Tùng', '1992-09-08', 'Admin', 'tungnui25', '123'),
    (N'Nguyễn Thái Thời', '2001-04-30', 'Customer', 'thoiwibu0909', '123'),
    (N'Đoàn Minh Hiếu', '1983-06-22', 'Store Owner', 'hieufs2003', '123'),
    (N'Kim Nhật Thành', '1994-02-14', 'Customer', 'ktnvippro', '123');
GO
-- Select all data from [Users] to verify
-- SELECT * FROM [Users];

-- Insert sample data into [User_Email] table
INSERT INTO [User_Email] ([id_user], [email])
VALUES
    (100000001, 'vuongnguyen11@gmail.com'),
    (100000002, 'mirumiru0208@gmail.com'),
    (100000003, 'phongnguoc3107@gmail.com'),
    (100000004, 'vxmtrung12@gmail.com'),
    (100000005, 'duckisreal0503@gmail.com'),
    (100000006, 'minhhieu212@gmail.com'),
    (100000007, 'thanhtumg2510@gmail.com'),
    (100000008, 'thoiwiwibubu@gmail.com'),
    (100000009, 'hieudoanminh18@gmail.com'),
    (100000010, 'thanhkim007@gmail.com');
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
    (100000002, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội'),
    (100000003, N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM'),
    (100000004, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM'),
    (100000005, N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng'),
    (100000006, N'100 Đặng Văn Bi, Bình Thọ, Thủ Đức, Tp.HCM'),
    (100000007, N'54 đường Nguyễn Lương Bằng, Q.Liên Chiểu, Đà Nẵng'),
    (100000008, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM'),
    (100000009, N'đường số 13 Tân Thuận Đông, Quận 7, Tp.HCM'),
    (100000010, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM');
GO
-- Select all data from [User_Address] to verify
-- SELECT * FROM [User_Address];


INSERT INTO [Store] ([id_owner], [name])
VALUES
    (100000002, N'Logitech Official Shop'),
    (100000005, N'NowSaiGon'),
    (100000009, N'Home Essential Shop');
GO
-- Select all data from [Store] to verify
-- SELECT * FROM [Store];

-- Insert sample data into [Category] table
INSERT INTO [Category] ([name], [description])
VALUES
    (N'Thiết bị điện tử', N'Các dụng cụ và thiết bị điện tử các loại, áp dụng công nghệ hiện đại giúp tăng năng suất làm việc, nâng cao chất lượng cuộc sống.'),
    (N'Thời trang', N'Quần áo, giày dép và các phụ kiện thời trang, mẫu mã đa dạng, chất liệu cao cấp. Đáp ứng nhu cầu thời trang của mọi lứa tuổi, đặc biệt là giới trẻ.'),
    (N'Nội thất', N'Đồ nội thất trang trí nhà ở, nhà hàng, khách sạn...'),
    (N'Sách', N'Sách, tiểu thuyết, truyện... Đáp ứng nhu cầu của mọi tầng lớp.'),
    (N'Thể thao', N'Dụng cụ thể thao chất lượng, đa dạng.'),
    (N'Làm đẹp', N'Các sản phẩm làm đẹp, mỹ phẩm chăm sóc da chính hãng, có tem phân phối, chất lượng tốt đã qua kiểm định.'),
    (N'Thiết bị thông minh', N'Thiết bị điện tử kết nối thiết bị khác thông qua mạng không dây khác nhau như Bluetooth, NFC, Wi-Fi, 4G..., đem đến sự thông minh cho ngôi nhà bạn'),
    (N'Đồ chơi', N'Thế Giới Đồ Chơi chất lượng, đa dạng mẫu mã, phù hợp mọi độ tuổi.'),
    (N'Văn phòng phẩm', N'Những vật phẩm đơn giản phục vụ cho các hoạt động văn phòng như: giấy in, sổ, giấy viết, bút, ghim, kẹp, giấy bóng kính, túi nhựa, cặp nhựa, băng dính, hồ dán, phong bì, túi bìa cứng, sổ cặp tài liệu, băng keo giấy...'),
    (N'Sức khỏe', N'Các dụng cụ hỗ trợ sức khỏe (xe lăn, trợ thính, gậy chống...). Các sản phẩm chăm sóc sức khỏe có nhiều thể loại với công dụng khác nhau như: thực phẩm chức năng hỗ trợ trí nhớ, bổ mắt, giảm đau ...');
GO
-- Select all data from [Category] to verify
-- SELECT * FROM [Category];


-- Insert 10 tuples of sample data into [Product] table
INSERT INTO [Product] ([id_store], [name], [id_category], [imgLink], [price], [quantity])
VALUES
    (200000001, N'Laptop Acer Nitro 5', 1001, 'laptop_acernitro_5.jpg', 1200, 50),
    (200000002, N'Áo Now SaiGon đen', 1002, 'tshirt_black.jpg', 25, 100),
    (200000003, N'Sofa phòng khách hiện đại hàng cao cấp', 1003, 'sofa_set.jpg', 800, 20),
    (200000002, N'Sách - Mộ Đom Đóm ( Tiểu Thuyết )', 1004, 'moDomDom_novel.jpg', 15, 50),
    (200000002, N'Vợt Tennis CROSSWAY YAVCK 5600 Sợi Carbon', 1005, 'tennis_racket.jpg', 50, 30),
    (200000001, N'Bộ sản phẩm trang điểm 3CE The glory', 1006, 'makeup_kit.jpg', 40, 40),
    (200000002, N'Thiết Bị Định Vị GPS Thông Minh Chống Thất Lạc', 1007, 'gps_accessories.jpg', 100, 15),
    (200000001, N'Mô hình Gundam SD RX-0', 1008, 'toy_gundam.jpg', 30, 80),
    (200000001, N'Gạo Thơm Lài 1Kg - Dẻo mềm thơm ngọt cơm', 1009, 'rice_bag.jpg', 10, 200),
    (200000002, N'Viên uống bổ sung vitamin C DHC, tăng cường đề kháng ', 1010, 'vitamin_c.jpg', 15, 60);
GO
-- Select all data from [Product] to verify
-- SELECT * FROM [Product];

-- Insert 10 tuples of sample data into [Rating] table
INSERT INTO [Rating] ([id_customer], [id_product], [detail], [ratingStar])
VALUES
    (100000001, 300000001, N'Laptop giá rẻ, cấu hình ổn, build khá chắc chắn. Trong tầm giá này hàng chính hãng ở VN là best rồi.', 4),
    (100000002, 300000002, N'Áo xinh lắm nha troiii oiiiiiii highly recommend nhaaaaa nếu có size nhỏ hơn nữa thì tuyệtttt', 5),
    (100000003, 300000003, N'1 chiếc sofa quá ok tiện lợi, mằm mát mẻ êm. Giao hàng nhanh, chất lượng, đóng gói kỹ', 4),
    (100000004, 300000004, N'Sách mới, chất lượng nhé các bạn. Giao hàng nhanh, ship rất thân thiện, nhiệt tình. Cốt truyện thì miễn bàn, xem anime đã khóc đọc novel auto sưng mắt.', 5),
    (100000005, 300000005, N'Vợt tennis đẹp, đóng gói rất tốt, giá cả phải chăng, giao hàng rất nhanh, giống như trên hình ảnh, chất lượng rất tốt, độ đàn hồi tốt, đáng để mua và giới thiệu!', 4),
    (100000006, 300000006, N'Hàng quốc tế nhưng giao hàng nhanh,nhận hàng quá ứng ý,mẫu mã nhìn đẹp,xịn xò ghê. Mình chưa dùng nên không biết chất kem như thế nào,nhưng mùi kem thơm nhẹ. Shop tặng kèm kem tẩy trang chiết xuất bơ xinh xỉu.', 4),
    (100000007, 300000007, N'Có hoạt động, kết nối được. Nhưng tiếng chuông không được to và kết nối không được xa lắm', 4),
    (100000008, 300000008, N'Siêu đẹp và dễ lắp ráp, hàng giao nhanh, đóng gói kĩ. Nhân viên dthg, giá hợp lí. Đem trang trí nhìn xịn xò lắm luôn', 4),
    (100000009, 300000009, N'Giao hàng nhanh đóng gói cẩn thận mình chưa ăn nhưng vẫn đánh giá 5 sao cho mẫu mã sản phẩm. Ăn ngon sẽ ủng hộ shop tiếp', 5),
    (100000010, 300000010, N'Mình uống vitamin C được 1 tháng thấy cũng ổn, uống nhiều nước để ko bị nổi mụn nha.', 4);
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
    (1001, '2023-12-01', '2023-12-10', 0.15, NULL, 200000, 60000, 100), -- 15% off on Electronics for 10 days
    (1002, '2023-12-05', '2023-12-15', NULL, 50, 150000, 80000, 50),  -- $50 off on Clothing for 10 days
    (1003, '2023-12-10', '2023-12-20', 0.20, NULL, 250000, 70000, 75),  -- 20% off on Home Decor for 10 days
    (1004, '2023-12-15', '2023-12-25', NULL, 30, 180000, 55000, 40),  -- $30 off on Books for 10 days
    (1005, '2023-12-20', '2023-12-30', 0.18, NULL, 220000, 65000, 60);  -- 18% off on Sports for 10 days
GO
-- Select all data from [Discount] to verify
-- SELECT * FROM [Discount];

-- Insert 3 tuples of sample data into [PaymentMethod] table
INSERT INTO [PaymentMethod] ([name])
VALUES
    (N'Thẻ tín dụng/Ghi nợ'),
    (N'Chuyển khoản ngân hàng');
    (N'Thanh toán khi nhận hàng');
GO
-- Select all data from [PaymentMethod] to verify
-- SELECT * FROM [PaymentMethod];

-- Insert 5 tuples of sample data into [Order] table
INSERT INTO [Order] ([id_customer], [id_discount], [id_pMethod], [totalPrice], [address], [pNumber])
VALUES
    (100000001, 400000001, 2001, 1200, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM', '0918827371'),
    (100000002, 400000002, 2002, 800, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', '0987126361'),
    (100000003, 400000003, 2003, 1500, N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM', '0989671562'),
    (100000004, 400000004, 2001, 500, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM', '0912831623'),
    (100000005, 400000005, 2002, 1000, N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng', '0371892342');
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
    (500000001, 100000001, 500,  N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM', '0918827371', '2023-12-15'),
    (500000002, 100000002, 750, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', '0987126361', '2023-12-16'),
    (500000003, 100000003, 600,  N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM', '0989671562', '2023-12-17'),
    (500000004, 100000004, 900, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM', '2023-12-18'),
    (500000005, 100000005, 800,  N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng', '2023-12-19');
GO

-- SELECT * FROM [Bill];

-- Insert sample data into [DeliveryService]
INSERT INTO [DeliveryService] ([name])
VALUES
    (N'Giao Hàng Nhanh'),
    (N'Giao Hàng Tiết Kiệm'),
    (N'Next Day Delivery');
GO
-- Insert sample data into [DeliveryServiceEmail]
INSERT INTO [DeliveryServiceEmail] ([id_delivery], [email])
VALUES
    (700000001, 'cskh@ghn.vn'),
    (700000002, 'cskh@ghtk.vn'),
    (700000003, 'cskh@viettelpost.com.vn');
GO
-- Insert sample data into [DeliveryServiceAddress]
INSERT INTO [DeliveryServiceAddress] ([id_delivery], [address])
VALUES
    (700000001, '405/15 Xô Viết Nghệ Tĩnh, Phường 24, Quận Bình Thạnh, TP HCM'),
    (700000002, 'Tòa nhà VTV, số 8 Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, thành phố Hà Nội'),
    (700000003, 'Toà nhà Viettel Post, Ngõ 15 Duy Tân, Cầu Giấy, Hà Nội');
GO
-- Insert sample data into [DeliveryServicePNumber]
INSERT INTO [DeliveryServicePNumber] ([id_delivery], [pNumber])
VALUES
    (700000001, '1900 636677'),
    (700000002, '1900 6092'),
    (700000003, '1900 8095');
GO
-- Select all data from [DeliveryService], [DeliveryServiceEmail], [DeliveryServiceAddress], and [DeliveryServicePNumber] to verify
-- SELECT * FROM [DeliveryService];
-- SELECT * FROM [DeliveryServiceEmail];
-- SELECT * FROM [DeliveryServiceAddress];
-- SELECT * FROM [DeliveryServicePNumber];

-- Insert sample data into [Waybill] (for 2 orders)
INSERT INTO [Waybill] ([id_bill], [id_delivery], [customerName], [customerPhone], [customerAddress], [dateStart], [datePredict])
VALUES
    (600000001, 700000001, N'Nguyễn Trung Vương', '0918827371', '268 đường Lý Thường Kiệt, Q.10, Tp.HCM', GETDATE(), DATEADD(DAY, 4, GETDATE())),
    (600000002, 700000002, N'Nguyễn Ngọc Khánh My', '0987126361', '1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', GETDATE(), DATEADD(DAY, 4, GETDATE()));
GO
-- Select all data from [Waybill] to verify
-- SELECT * FROM [Waybill];