USE [DB_HBTT]
GO
-----------------------------------------------------------------------------------------------------
-- Function authentication with username & pwd
CREATE FUNCTION check_login
(
    @username VARCHAR(50),
    @pwd VARCHAR(50)
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @result VARCHAR(20);
    IF (   
        SELECT COUNT(*) FROM [Users] U 
        WHERE U.[username] = @username AND U.[pwd] = @pwd
    ) > 0 
    BEGIN
        SET @result = (SELECT TOP 1 [usertype] FROM [Users] U 
        WHERE U.[username] = @username AND U.[pwd] = @pwd)
    END
    ELSE SET @result = 'Invalid User';

    RETURN @result;           
END
GO 
--SELECT dbo.check_login('mark_w', 'pass1234') as result;
-----------------------------------------------------------------------------------------------------
-- Function calc Order_totalPrice with id_order
CREATE FUNCTION calculate_orderTotalPrice
(
    @id_order INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    DECLARE @id_discount INT;
    DECLARE @discountValue INT;

    SET @result = (SELECT SUM(totalPrice) FROM [OrderItem] OI WHERE OI.[id_order] = @id_order);
    SET @discountValue = 0;

    SET @id_discount = (SELECT TOP 1 [id_discount] FROM [Order] O WHERE O.[id_order] = @id_order);

    IF (@id_discount <> 0)
    BEGIN
        DECLARE @id_category INT;
        DECLARE @discountPercent DECIMAL(5, 2);
        DECLARE @discountMoney INT;

        SELECT TOP 1
            @id_category = [id_category],
            @discountPercent = [discountPercent],
            @discountMoney = [discountMoney]
        FROM [Discount] D
        WHERE D.[id_discount] = @id_discount;

        IF @discountMoney <> 0
            SET @discountValue = @discountMoney;
        ELSE
            SET @discountValue = @discountPercent * (
                SELECT SUM(totalPrice) FROM [OrderItem] OI
                INNER JOIN [Product] P ON OI.[id_product] = P.[id_product]
                WHERE P.[id_category] = @id_category
            );
    END
    IF @discountValue = NULL SET @discountValue = 0
    SET @result = @result - @discountValue;

    RETURN @result;
END
GO
-----------------------------------------------------------------------------------------------------
-- Function return list of Product when use filter
CREATE FUNCTION filter_product
(
    @searchString NVARCHAR(255),
    @id_category INT,
    @min_price INT = 0,
    @max_price INT = 1000000000,
    @searchType VARCHAR(10) = 'BestRating' -- 'BestRating' for best rating, 'BestSeller' for bestseller
)
RETURNS TABLE
AS
RETURN
(
    SELECT *, ROW_NUMBER() OVER (ORDER BY (
        CASE 
        WHEN @searchType = 'BestRating' THEN productRating
        ELSE soldNumber
        END
    ) DESC) AS RowNum FROM [Product] P
    WHERE 
        (P.[name] LIKE '%' + @searchString + '%' OR @searchString IS NULL)
        AND (@id_category IS NULL OR P.[id_category] = @id_category)
        AND (@min_price IS NULL OR P.[price] >= @min_price)
        AND (@max_price IS NULL OR P.[price] <= @max_price)
);
GO

-----------------------------------------------------------------------------------------------------
-- Function return usable Discount with table of chosen CartItem

-----------------------------------------------------------------------------------------------------
-- Function return all rating of a product
CREATE FUNCTION product_allRating
(
    @id_product INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM [Rating] R
    WHERE R.[id_product] = @id_product
);
GO
-----------------------------------------------------------------------------------------------------
-- Group function
-- Function calculate store's revenue by product
CREATE FUNCTION revenue_byProduct
(
    @id_store INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT id_product, [name], price, soldnumber, price * soldNumber AS Total FROM [Product] P
    WHERE P.[id_store] = @id_store
)
GO
-- Function calculate total revenue of store
CREATE FUNCTION total_revenueStore
(
    @id_store INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    SELECT @result = SUM(price * soldNumber)
    FROM [Product] P
    WHERE P.id_store = @id_store;

    IF @result IS NULL
        SET @result = 0;

    RETURN @result;
END;
GO
-----------------------------------------------------------------------------------------------------
-- Function return money user have paid on a particular period of time
CREATE FUNCTION money_CustomerPaid
(
    @id_customer INT,
    @startTime DATE = GETDATE,
    @endTime DATE = GETDATE
)
RETURNS INT
AS
BEGIN
    DECLARE @totalCustomerPaid INT;

    SET @totalCustomerPaid = (
        SELECT SUM(totalPrice) FROM [Bill] B
        WHERE (B.[id_customer] = @id_customer AND B.[time] BETWEEN @startTime AND @endTime)
    )

    IF @totalCustomerPaid IS NULL
        SET @totalCustomerPaid = 0;

    RETURN @totalCustomerPaid;
END
GO

-----------------------------------------------------------------------------------------------------
-- Group of similar functions --
-- Function return list of discount (Admin)
-- Function return list of discount (Store)
-- (can be done by using a single SELECT query in UI)
-----------------------------------------------------------------------------------------------------
-- Group of similar functions --
-- Function return list of user (All)
-- Function return list of user (Customer)
-- Function return list of user (Store Owner)
-- (can be done by using a single SELECT query in UI)
-----------------------------------------------------------------------------------------------------
-- Group of similar functions --
-- Function return list of OrderItem (Waiting)
-- Function return list of OrderItem (Confirmed)
-- Function return list of ItemBuyed
-- (can be done by using a single SELECT query in UI)
-----------------------------------------------------------------------------------------------------
SELECT * from OrderItem
GO
CREATE FUNCTION store_allOrderItem
(
    @id_store INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OI.[id_order],
        OI.[id_product],
        P.[name],
        OI.[quantity],
        OI.[totalPrice],
        OI.[status]
    FROM [OrderItem] OI 
    INNER JOIN [Product] P ON P.[id_product] = OI.[id_product]
    WHERE P.[id_store] = @id_store
)
GO

CREATE FUNCTION store_waitingOrderItem
(
    @id_store INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OI.[id_order],
        OI.[id_product],
        P.[name],
        OI.[quantity],
        OI.[totalPrice],
        OI.[status]
    FROM [OrderItem] OI 
    INNER JOIN [Product] P ON P.[id_product] = OI.[id_product]
    WHERE P.[id_store] = @id_store AND OI.[status] = 'Waiting'
)
GO

CREATE FUNCTION store_confirmedOrderItem
(
    @id_store INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OI.[id_order],
        OI.[id_product],
        P.[name],
        OI.[quantity],
        OI.[totalPrice],
        OI.[status]
    FROM [OrderItem] OI 
    INNER JOIN [Product] P ON P.[id_product] = OI.[id_product]
    WHERE P.[id_store] = @id_store AND OI.[status] = 'Confirmed'
)
GO


-- Function return list of discount and their reduced price
CREATE TYPE cartID AS TABLE
(
    id_cart INT
)
GO
CREATE FUNCTION suitableDiscount (
    @cart cartID READONLY
)
RETURNS TABLE
AS
RETURN
(
    SELECT D.id_discount, D.dateStart, D.dateEnd, D.id_category, D.discountPercent, D.discountMoney, D.maxDiscount, D.minBill
    FROM [Discount] D, @cart C, [Product] P
    WHERE
    (
        P.[id_product] = C.id_cart
        AND (D.[id_category] = P.[id_category] OR D.[id_category] = NULL)
    )
)
GO
