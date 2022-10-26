CREATE  PROCEDURE GetCustomers @Filter VARCHAR(25)
AS
SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE '%' +@Filter + '%'






