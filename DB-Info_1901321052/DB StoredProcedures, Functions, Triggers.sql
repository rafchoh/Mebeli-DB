--Created BY: 
--Рафет Халил, СИ Редовно, Фак.№ 1901321052

--Моделиране и анализ на софтуер
--=======================================================================================================================================================

--Stored Procedures 
---------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE GetReevaluatedProducts
AS 
SET NOCOUNT ON
SELECT  ProductName, Price*Discount AS NewPrice, ProductInfo, CategoryName, Stock FROM Product
WHERE CategoryName = N'Преоценени'
GO

-------------------------------------------------------------------------------

CREATE PROCEDURE OrdersFromToday
AS 
SET NOCOUNT ON
SELECT ProductName, TotalPrice, FullName, PhoneNumber, City + ' ,' + HomeAddress AS FullAddress, OrderDate FROM Orders
WHERE CONVERT(date, OrderDate) = CONVERT(date, GETDATE())
GO

-------------------------------------------------------------------------------

CREATE PROCEDURE NumOfOrdersFromToday
AS
BEGIN
SELECT Count(OrderID) AS TodaysOrders FROM Orders 
WHERE CONVERT(date, OrderDate) = CONVERT(date, GETDATE())
END
GO


--_______________________________________________________________________________________________________________________________________________________
--_______________________________________________________________________________________________________________________________________________________

--Functions
---------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION MostSoldProducts()
RETURNS @MostSoldProducts TABLE(
         CategoryName nvarchar(50) NOT NULL,
         ProductName nvarchar(75) NOT NULL,
         Price DECIMAL(6,2) NOT NULL,
         Discount DECIMAL(6,2),
         NumOfProducts TINYINT,
	 NewPrice DECIMAL(6,2) NOT NULL,
	 Losses DECIMAL(6,2) NOT NULL		 
)
AS 
BEGIN
    INSERT INTO @MostSoldProducts
    SELECT 
        p.CategoryName,
        p.ProductName,
        p.Price,
        p.Discount, 
	c.NumOfProducts,
	p.Price*p.Discount AS NewPrice,
	p.Price-(p.Price*p.Discount) AS Losses
    FROM
	Product p 
    FULL OUTER JOIN Cart c 
           ON p.ProductName = c.ProductName AND p.CategoryName = c.CategoryName
RETURN
END
GO

                     USE [KursovaDB]
                     GO
                     select * from dbo.MostSoldProducts();


-------------------------------------------------------------------------------

CREATE FUNCTION NumBedroomDiscount()
RETURNS INT
AS 
BEGIN
DECLARE @TotalCount INT ;
SELECT @TotalCount = COUNT(ProductID) FROM Product
WHERE CategoryName = N'Спалня' and Discount != 1.00;
RETURN @TotalCount
END
GO

                     USE [KursovaDB]
                     GO
                     select dbo.NumBedroomDiscount()


--_______________________________________________________________________________________________________________________________________________________
--_______________________________________________________________________________________________________________________________________________________

--Triggers
---------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER OnUpdateCart 
ON Cart
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
UPDATE Cart 
SET DateOfUpdate = GETDATE()
FROM Cart c
INNER JOIN inserted i ON i.CartID = c.CartID
END
GO


--_______________________________________________________________________________________________________________________________________________________
