USE [DB_HBTT]
GO

----------------------------------------------------------------------------------
-- Trigger update Store.noProduct when adding a product
CREATE TRIGGER update_storeProduct
ON [Product]
AFTER INSERT
AS
BEGIN
    UPDATE S
    SET S.[noProduct] = S.[noProduct] + I.TotalQuantity
    FROM [Store] S
    INNER JOIN (
        SELECT id_store, COUNT(*) AS TotalQuantity
        FROM inserted
        GROUP BY id_store
    ) I ON S.id_store = I.id_store;
END
GO
----------------------------------------------------------------------------------

-- Group Trigger --
-- Trigger update Product.quantity and Product.sold when an OrderItem is created
CREATE TRIGGER update_productQuantity
ON [OrderItem]
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.[quantity] = P.[quantity] - I.TotalQuantity,
        P.[soldNumber] = P.[soldNumber] + I.TotalQuantity
    FROM [Product] P
    INNER JOIN (
        SELECT id_product, SUM(quantity) AS TotalQuantity
        FROM inserted
        GROUP BY id_product
    ) I ON P.id_product = I.id_product
    WHERE P.id_product = I.id_product;
END
GO
----------------------------------------------------------------------------------

-- Group trigger --

-- Trigger update Product.productRating and Product.ratingCount when a Rating is created
-- Trigger set all OrderItem.ratingYet with [id_buyer, id_product] to 'Yes' if a Rating is created
CREATE TRIGGER update_productRating
ON [Rating]
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.[productRating] = (
            SELECT AVG(ratingStar) 
            FROM [Rating] R
            WHERE P.[id_product] = R.[id_product]
        ), 
        P.[ratingCount] = P.[ratingCount] + I.TotalRating
    FROM [Product] P
    INNER JOIN (
        SELECT id_product, COUNT(*) AS TotalRating FROM inserted GROUP BY id_product
    ) I ON P.id_product = I.id_product
    WHERE P.id_product = I.id_product;

    UPDATE OI
    SET OI.[rated] = 'Yes'
    FROM [OrderItem] OI
    INNER JOIN [Order] O ON OI.id_order = O.id_order
    INNER JOIN inserted I ON OI.id_product = I.id_product AND O.id_customer = I.id_customer;
END
GO

-- Trigger update Store.storeRating when a productRating is updated
CREATE TRIGGER update_storeRating
ON [Product]
AFTER UPDATE
AS
BEGIN
    UPDATE S
    SET S.[storeRating] = (
            SELECT AVG(CASE WHEN productRating <> 0 THEN productRating END) 
            FROM [Product] P
            WHERE S.[id_store] = P.[id_store]
        )
    FROM [Store] S
    INNER JOIN (
        SELECT id_store FROM inserted GROUP BY id_store
    ) I ON S.id_store = I.id_store
    WHERE S.id_store = I.id_store;
END
GO
----------------------------------------------------------------------------------

-- Trigger check and update Order.status when OrderItem.status is updated
CREATE TRIGGER update_orderStatus
ON [OrderItem]
AFTER UPDATE
AS
BEGIN
    DECLARE @id_order INT;
    DECLARE cur_uoS CURSOR FOR (SELECT DISTINCT I.[id_order] FROM inserted I);

    OPEN cur_uoS;
    FETCH FROM cur_uoS INTO @id_order;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE O_byID
        SET O_byID.[status] = 'Confirmed'
        FROM (SELECT * FROM [Order] O
            WHERE O.[id_order] = @id_order
        ) O_byID
        INNER JOIN (
            SELECT OI.[id_order], COUNT(CASE WHEN OI.[status] = 'Confirmed' THEN 1 END) as ConfirmedCount, COUNT(*) as TotalCount 
            FROM [OrderItem] OI GROUP BY OI.[id_order]
        ) S ON O_byID.[id_order] = S.[id_order] -- S for Summarize
        WHERE S.ConfirmedCount = S.TotalCount

        FETCH NEXT FROM cur_uoS INTO @id_order;
    END

    CLOSE cur_uoS;
    DEALLOCATE cur_uoS;
END
GO
----------------------------------------------------------------------------------

-- Group trigger --
-- Trigger create a Bill when an Order.status is updated to 'Yes'
CREATE TRIGGER create_bill
ON [Order]
AFTER UPDATE
AS
BEGIN
    DECLARE @id_order INT, 
            @id_customer INT,
            @totalPrice INT,
            @address NVARCHAR(255),
            @pNumber VARCHAR(10),
            @status VARCHAR(5);
    DECLARE cur_cb CURSOR FOR (
        SELECT [id_order], [id_customer], [totalPrice], [address], [pNumber], [status] 
        FROM inserted
    );

    OPEN cur_cb;
    FETCH FROM cur_cb INTO @id_order, @id_customer, @totalPrice, @address, @pNumber, @status;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @status = 'Confirmed'
        BEGIN
            INSERT INTO [Bill] ([id_order], [id_customer], [totalPrice], [address], [pNumber], [time])
            VALUES
                (@id_order, @id_customer, @totalPrice, @address, @pNumber, GETDATE())
        END

        FETCH NEXT FROM cur_cb INTO @id_order, @id_customer, @totalPrice, @address, @pNumber, @status;
    END

    CLOSE cur_cb;
    DEALLOCATE cur_cb;
END
GO
-- Trigger create a Waybill when a Bill is created
CREATE TRIGGER create_waybill
ON [Bill]
AFTER INSERT
AS
BEGIN
    DECLARE @id_bill INT, 
            @customerName NVARCHAR(30),
            @customerAddress NVARCHAR(255),
            @customerPhone VARCHAR(10);
    DECLARE cur_cw CURSOR FOR (
        SELECT [id_bill], [name], [address], [pNumber]
        FROM inserted I
        INNER JOIN (
            SELECT id_user, [name] FROM [Users] 
        ) UN ON I.[id_customer] = UN.[id_user]
    );

    OPEN cur_cw;
    FETCH FROM cur_cw INTO @id_bill, @customerName, @customerAddress, @customerPhone;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO [Waybill] ([id_bill], [id_delivery], [customerName], [customerPhone], [customerAddress])
        VALUES
        (
            @id_bill, 
            (SELECT TOP 1 [id_delivery] FROM [DeliveryService]),
            @customerName, 
            @customerPhone,
            @customerAddress
        )
        FETCH NEXT FROM cur_cw INTO @id_bill, @customerName, @customerAddress, @customerPhone;
    END

    CLOSE cur_cw;
    DEALLOCATE cur_cw;
END
GO
----------------------------------------------------------------------------------