USE [DB_HBTT]
GO

-- Procedure update all OrderItem.status to 'Confirmed' when store click button 'Confirm all orders'
CREATE PROCEDURE update_allOrderItemStatus
    @id_store INT
AS
BEGIN
    UPDATE OI
    SET OI.[status] = 'Confirmed'
    FROM [OrderItem] OI, [Product] P
    WHERE (
        OI.[id_product] = P.[id_product]
        AND P.[id_store] = @id_store
    )
END
GO

-----------------------------------------------------------------------------------------------------
-- Procedure check and delete a customer without any waiting order
CREATE PROCEDURE delete_customer
    @id_customer INT
AS
BEGIN
    DECLARE @result VARCHAR(3) = 'Yes';

    -- Check if the user with the provided id_customer is a Customer
    IF (SELECT TOP 1 usertype FROM [Users] U WHERE U.[id_user] = @id_customer) <> 'Customer'
        SET @result = 'No';
    ELSE
    BEGIN
        -- Check if there are Waiting orders associated with the customer
        IF EXISTS (
            SELECT * FROM [Order] O
            WHERE O.[id_customer] = @id_customer AND O.[status] = 'Waiting'
        ) SET @result = 'No';
        ELSE
        BEGIN
            -- Delete records associated with the customer
            DELETE FROM [Bill] WHERE id_customer = @id_customer;
            DELETE FROM [OrderItem] WHERE id_order = (SELECT id_order FROM [Order] WHERE id_customer = @id_customer);
            DELETE FROM [Order] WHERE id_customer = @id_customer;
            DELETE FROM [CartItem] WHERE id_user = @id_customer;
            DELETE FROM [Rating] WHERE id_customer = @id_customer;
            DELETE FROM [User_Email] WHERE id_user = @id_customer;
            DELETE FROM [User_Address] WHERE id_user = @id_customer;
            DELETE FROM [User_Pnumber] WHERE id_user = @id_customer;
            DELETE FROM [Users] WHERE id_user = @id_customer;

            SET @result = 'Yes';
        END
    END
    SELECT @result AS Result;
END;
