--drop procedure CustCatSummary
CREATE PROCEDURE CustCatSummary @CustomerID nchar(5)
AS
Select ca.CategoryName, Sum(od.Quantity) as TOTAL, Round(Sum(od.Quantity * od.UnitPrice),2) as Cost
FROM Customers c 
LEFT JOIN Orders o on o.CustomerID = c.CustomerID
LEFT JOIN [Order Details] od on o.OrderID = od.OrderID
Left JOIN Products p on od.ProductID = p.ProductID
Left JOIN Categories ca on p.CategoryID = ca.CategoryID
where c.CustomerID = @CustomerID
group by ca.CategoryName
order by Sum(od.Quantity) asc
go
