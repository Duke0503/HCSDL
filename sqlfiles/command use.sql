SELECT * FROM [Store]
INSERT INTO [Product] ([id_store], [name], [id_category], [imgLink], [price], [quantity])
VALUES
    (200000001, N'Bàn Phím DAREU EK87', 1001, N'https://example.com/keyboard2.jpg', 2500000, 50)
GO
--------------------------------------------------------
SELECT * FROM [Order]
SELECT * FROM [OrderItem]
UPDATE [OrderItem]
SET [status] = 'Confirmed'
WHERE id_order = 500000001
--------------------------------------------------------
SELECT * FROM [Product]
SELECT * FROM [Store]
INSERT INTO [Rating] ([id_customer], [id_product], [detail], [ratingStar])
VALUES
    (100000001, 300000001, N'Rất tốt', 5),
    (100000002, 300000002, N'Cũng được', 4),
    (100000003, 300000001, N'Chê', 2)
GO
--------------------------------------------------
SELECT * FROM [Order]
SELECT * FROM [OrderItem]
EXEC update_allOrderItemStatus 200000003
----------------------------------------
SELECT * FROM [Users]
EXEC delete_customer 100000001
----------------------------------------
SELECT dbo.calculate_orderTotalPrice(500000002) AS res
-----------------------------------------------
SELECT * FROM filter_product(
    N'a',
    NULL,
    0,
    2000000,
    'BestRating'
)
--------------------------------------------
DECLARE @cart cartID
insert into @cart
VALUES (300000002), (300000003), (300000004)
SELECT * from suitableDiscount(@cart)
------------------------------
SELECT * FROM revenue_byProduct(200000001)
-------------------------------
INSERT INTO [Bill] ([id_order], [id_customer], [totalPrice], [address], [pNumber], [time])
VALUES
    (500000005, 100000005, 1319000, N'Đại học Bách Khoa', '0981738129', '2023-12-15')
GO
SELECT dbo.money_CustomerPaid(
    100000005,
    '2022-01-01',
    '2024-01-01'
) as result
--------------------------------------
SELECT * FROM product_allRating(300000001)
----------------------------------

SELECT * FROM [Users]
SELECT * FROM [User_Email]
SELECT * FROM [User_Address]
SELECT * FROM [User_Pnumber]
SELECT * FROM [Store]
SELECT * FROM [Category]
SELECT * FROM [CartItem]
SELECT * FROM [Order]
SELECT * FROM [OrderItem]
SELECT * FROM [PaymentMethod]
SELECT * FROM [Rating]
SELECT * FROM [Bill]
SELECT * FROM [DeliveryService]
SELECT * FROM [DeliveryServiceAddress]
SELECT * FROM [DeliveryServiceEmail]
SELECT * FROM [DeliveryServicePNumber]
SELECT * FROM [Waybill]

