--Drop procedure InsertOrderDetails
IF EXISTS (SELECT [NAME] FROM SYSOBJECTS WHERE [NAME] = 'InsertOrderDetails')
DROP PROCEDURE InsertOrderDetails
GO



CREATE PROCEDURE InsertOrderDetails
@orderID int,
@productID int,
@quantity smallint,
@discount int = 0
AS
BEGIN
IF NOT EXISTS(SELECT 1 FROM [Order Details]
WHERE OrderID = @orderID) OR
NOT EXISTS(SELECT 2 FROM [Order Details]
WHERE ProductID = @productID)
BEGIN
RETURN 0
END



IF EXISTS(SELECT 1, 2 FROM [Order Details]
WHERE OrderID = @orderID and ProductID = @productID)
BEGIN
RETURN 0
END



DECLARE @unitprice money
set @unitprice = (select UnitPrice from Products
WHERE ProductID = @productID)



INSERT INTO [Order Details]
(
OrderID, ProductID, UnitPrice, Quantity, Discount
)
VALUES
(
@orderID, @productID, @unitprice, @quantity, @discount
)
RETURN @@ROWCOUNT
END
GO



select * from [Order Details] order by OrderID
SELECT * FROM Products



DECLARE @return int
EXEC @return = InsertOrderDetails 10248,14,33
select @return
Go