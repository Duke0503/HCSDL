USE [DB_HBTT]
GO

-- Insert 10 tuples into [Users] table
INSERT INTO [Users] ([name], [dob], [usertype], [username], [pwd])
VALUES
    (N'Nguyễn Trung Vương', '1990-05-15', 'Customer', 'vuongnguyen123', '123'),
    (N'Trương Hoàng Nhật', '2003-10-03', 'Customer', 'nhattruong123', '123'),
    (N'Lê Nguyên Chương', '1998-08-20', 'Customer', 'chuongle333', '123'),
    (N'Nguyễn Minh Điềm', '2007-01-12', 'Customer', 'diem11a7', '123'),
    (N'Lê Nguyễn Bảo Ngọc', '1980-05-16', 'Customer', 'ngocLe0909', '123'),
    (N'Nguyễn Đức Anh Tuấn', '2000-01-29', 'Customer', 'tuannguyen0123', '123'),
    (N'Nguyễn Ngọc Khánh My', '1985-08-20', 'Customer', 'mirumiru0208', '123'),
    (N'Vũ Xuân Mai Trung', '1998-11-25', 'Customer', 'vxmtung001', '123'),
    (N'Đỗ Minh Đức', '1995-07-03', 'Customer', 'duckisreal', '123'),
    (N'Trần Minh Hiếu', '1987-12-18', 'Customer', 'hieupropro369', '123'),
    (N'Bùi Phước Ban', '2000-03-10', 'Admin', 'bbui2010', '123'),
    (N'Phạm Châu Thanh Tùng', '1992-09-08', 'Admin', 'tungnui25', '123'),
    (N'Nguyễn Thái Thời', '2001-04-30', 'Store Owner', 'thoiwibu0909', '123'),
    (N'Đoàn Minh Hiếu', '1983-06-22', 'Store Owner', 'hieufs2003', '123'),
    (N'Kim Nhật Thành', '1994-02-14', 'Store Owner', 'ktnvippro', '123');
    (N'Võ Ngọc Thành Nhân', '1980-11-13', 'Store Owner', 'nhanaruto', '123'),

GO
-- Select all data from [Users] to verify
-- SELECT * FROM [Users];

-- Insert sample data into [User_Email] table
INSERT INTO [User_Email] ([id_user], [email])
VALUES
    (100000001, 'vuongnguyen11@gmail.com'),
    (100000002, 'nhattruong0310@gmail.com'),
    (100000003, 'chuonglee123@gmail.com'),
    (100000004, 'diemnguyenminh@gmail.com'),
    (100000005, 'ngoccute0770@gmail.com'),
    (100000006, 'tuannguyensiu@gmail.com'),
    (100000007, 'mirumiru0208@gmail.com'),
    (100000008, 'vxmtrung12@gmail.com'),
    (100000009, 'duckisreal0503@gmail.com'),
    (100000010, 'minhhieu212@gmail.com'),
    (100000011, 'phongnguoc3107@gmail.com'),
    (100000012, 'thanhtumg2510@gmail.com'),
    (100000013, 'thoiwiwibubu@gmail.com'),
    (100000014, 'hieudoanminh18@gmail.com'),
    (100000015, 'thanhkim007@gmail.com');
    (100000016, 'dattebayo@gmail.com');
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
    (100000011, '0983345623');
    (100000012, '0965888111');
    (100000013, '0984302102');
    (100000014, '0912345679');
    (100000015, '0944123422');
    (100000016, '0989797696');
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
    (100000008, N'56 đường Nguyễn Tất Thành, Q.10, Tp.HCM'),
    (100000009, N'đường số 13 Tân Thuận Đông, Quận 7, Tp.HCM'),
    (100000010, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM');
    (100000011, N'40 đường Quang Trung, Q.Bình Thạnh, Tp.HCM');
    (100000012, N'3 đường Cộng Hòa, Q.7, Tp.HCM');
    (100000013, N'12 đường Nguyễn Đình Chiểu, Q.10, Tp.HCM');
    (100000014, N'69 đường Nguyễn Trãi, Q.1, Tp.HCM');
    (100000015, N'20 đường Nguyễn Huệ, Q.Tân Phú, Tp.HCM');
    (100000016, N'23 đường Hai Bà Trưng, Q.7, Tp.HCM');
GO
-- Select all data from [User_Address] to verify
-- SELECT * FROM [User_Address];


INSERT INTO [Store] ([id_owner], [name])
VALUES
    (100000013, N'Logitech Official Shop'),
    (100000014, N'NowSaiGon'),
    (100000015, N'Home Essential Shop');
    (100000016, N'SaiGonBookStore');
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
    (N'Tạp hóa', N'Các thực phẩm tiêu dùng hằng ngày'),
    (N'Sức khỏe', N'Các dụng cụ hỗ trợ sức khỏe (xe lăn, trợ thính, gậy chống...). Các sản phẩm chăm sóc sức khỏe có nhiều thể loại với công dụng khác nhau như: thực phẩm chức năng hỗ trợ trí nhớ, bổ mắt, giảm đau ...');
GO
-- Select all data from [Category] to verify
-- SELECT * FROM [Category];


-- Insert 10 tuples of sample data into [Product] table
INSERT INTO [Product] ([id_store], [name], [id_category], [imgLink], [price], [quantity])
VALUES
    (200000013, N'Laptop Acer Nitro 5', 1001, "url('./assets/acer_nitro_5.jpg')", 26000000, 50),
    (200000014, N'Áo Now SaiGon đen', 1002, "url('./assets/nowSG_black.jpg')", 299000, 100),
    (200000015, N'Sofa phòng khách hiện đại hàng cao cấp', 1003, "url('./assets/sofa.jpg')", 2800000, 20),
    (200000016, N'Sách - Mộ Đom Đóm ( Tiểu Thuyết )', 1004, "url('./assets/sach_modomdom.jpg')", 96000, 90),
    (200000015, N'Vợt Tennis CROSSWAY YAVCK 5600 Sợi Carbon', 1005, "url('./assets/tennis.jpg')", 150000, 300),
    (200000014, N'Bộ sản phẩm trang điểm 3CE The glory', 1006, "url('./assets/makeup_kit.jpg')", 634000, 140),
    (200000013, N'Thiết Bị Định Vị GPS Thông Minh Chống Thất Lạc', 1007, "url('./assets/gps_bluetooth.jpg')", 1150000, 65),
    (200000016, N'Mô hình Gundam SD RX-0', 1008, "url('./assets/gundam.jpg')", 599000, 80),
    (200000015, N'Gạo Thơm Lài 1Kg - Dẻo mềm thơm ngọt cơm', 1009, "url('./assets/rice.jpg')", 139000, 200),
    (200000015, N'Viên uống bổ sung vitamin C DHC, tăng cường đề kháng ', 1010, "url('./assets/vitaminC.jpg')", 85000, 350);
    (200000013, N'Chuột game không dây Logitech G304', 1001, "url('./assets/g304.jpg')", 800000, 100),

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
    (100000001, 300000011, N'Chuột quá ok trong tầm giá, logitech khỏi bàn. Trễ thấp, bắn pubg csgo ok. Shop mall uy tín, nhiệt tình. Giao hàng nhanh!', 4)
GO
-- Select all data from [Rating] to verify
-- SELECT * FROM [Rating];

-- Insert 5 tuples of sample data into [CartItem] table
INSERT INTO [CartItem] ([id_user], [id_product], [quantity], [totalPrice])
VALUES
    (100000001, 300000001, 1, 26000000),  -- 1 laptops in the cart
    (100000002, 300000002, 3, 897000),    -- 3 T-shirts in the cart
    (100000003, 300000003, 1, 2800000),   -- 1 sofa set in the cart
    (100000004, 300000004, 2, 192000),    -- 5 mystery novels in the cart
    (100000005, 300000005, 2, 300000);   -- 2 tennis rackets in the cart
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
    (100000001, 400000001, 2001, 26299000, N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM', '0918827371'),
    (100000002, 400000002, 2002, 8592000, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', '0987126361'),
    (100000003, 400000003, 2003, 2686000, N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM', '0989671562'),
    (100000004, 400000004, 2001, 2947000, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM', '0912831623'),
    (100000005, 400000005, 2002, 587000, N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng', '0371892342');
GO
-- Select all data from [Order] to verify
-- SELECT * FROM [Order];
-- Insert 2 tuples of sample data for each id_order into [OrderItem] table
INSERT INTO [OrderItem] ([id_order], [id_product], [quantity], [totalPrice], [status], [rated])
VALUES
    -- Order 500000001
    (500000001, 300000001, 1, 26000000, 'Waiting', 'No'),
    (500000001, 300000002, 1, 299000, 'Confirmed', 'No'),

    -- Order 500000002
    (500000002, 300000003, 3, 8400000, 'Confirmed', 'No'),
    (500000002, 300000004, 2, 192000, 'Waiting', 'No'),

    -- Order 500000003
    (500000003, 300000005, 1, 150000, 'Waiting', 'No'),
    (500000003, 300000006, 4, 2536000, 'Confirmed', 'No'),

    -- Order 500000004
    (500000004, 300000007, 1, 1150000, 'Waiting', 'No'),
    (500000004, 300000008, 3, 1797000, 'Confirmed', 'No'),

    -- Order 500000005
    (500000005, 300000009, 3, 417000, 'Confirmed', 'No'),
    (500000005, 300000010, 2, 170000, 'Waiting', 'No');
GO
-- Select all data from [OrderItem] to verify
-- SELECT * FROM [OrderItem];

-- Insert data into the Bill table
INSERT INTO [Bill] ([id_order], [id_customer], [totalPrice], [address], [pNumber], [time])
VALUES
    (500000001, 100000001, 26299000,  N'268 đường Lý Thường Kiệt, Q.10, Tp.HCM', '0918827371', '2023-12-15'),
    (500000002, 100000002, 8592000, N'1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', '0987126361', '2023-12-16'),
    (500000003, 100000003, 2686000,  N'Đường số 13, Tân Thuận Đông, Q.7, Tp.HCM', '0989671562', '2023-12-17'),
    (500000004, 100000004, 2947000, N'15 đường D5 phường 25, Q.Bình Thạnh, Tp.HCM', '2023-12-18'),
    (500000005, 100000005, 587000,  N'15 đường Trần Phú, phường 3, Tp.Đà Lạt, Lâm Đồng', '2023-12-19');
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
    (600000002, 700000002, N'Trương Hoàng Nhật', '0987126361', '1 đường Đại Cồ Việt, Q.Hai Bà Trưng, Hà Nội', GETDATE(), DATEADD(DAY, 4, GETDATE()));
GO
-- Select all data from [Waybill] to verify
-- SELECT * FROM [Waybill];