/*
Script de implementación para NorthWindOLTP

Este código lo generó una herramienta.
Los cambios en este archivo pueden provocar un comportamiento incorrecto y se perderán si
el código se vuelve a generar.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "NorthWindOLTP"
:setvar DefaultFilePrefix "NorthWindOLTP"
:setvar DefaultDataPath "C:\Users\Dell\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Dell\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detecte el modo SQLCMD y deshabilite la ejecución de scripts si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
ESTABLECER NOEXEC DESACTIVADO; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creando Índice [dbo].[Categories].[CategoryName]...';


GO
CREATE NONCLUSTERED INDEX [CategoryName]
    ON [dbo].[Categories]([CategoryName] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Customers].[City]...';


GO
CREATE NONCLUSTERED INDEX [City]
    ON [dbo].[Customers]([City] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Customers].[CompanyName]...';


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Customers]([CompanyName] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Customers].[PostalCode]...';


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Customers]([PostalCode] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Customers].[Region]...';


GO
CREATE NONCLUSTERED INDEX [Region]
    ON [dbo].[Customers]([Region] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Employees].[LastName]...';


GO
CREATE NONCLUSTERED INDEX [LastName]
    ON [dbo].[Employees]([LastName] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Employees].[PostalCode]...';


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Employees]([PostalCode] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[OrderDetails].[OrderID]...';


GO
CREATE NONCLUSTERED INDEX [OrderID]
    ON [dbo].[OrderDetails]([OrderID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[OrderDetails].[OrdersOrder_Details]...';


GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details]
    ON [dbo].[OrderDetails]([OrderID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[OrderDetails].[ProductID]...';


GO
CREATE NONCLUSTERED INDEX [ProductID]
    ON [dbo].[OrderDetails]([ProductID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[OrderDetails].[ProductsOrder_Details]...';


GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details]
    ON [dbo].[OrderDetails]([ProductID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[CustomerID]...';


GO
CREATE NONCLUSTERED INDEX [CustomerID]
    ON [dbo].[Orders]([CustomerID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[CustomersOrders]...';


GO
CREATE NONCLUSTERED INDEX [CustomersOrders]
    ON [dbo].[Orders]([CustomerID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[EmployeeID]...';


GO
CREATE NONCLUSTERED INDEX [EmployeeID]
    ON [dbo].[Orders]([EmployeeID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[EmployeesOrders]...';


GO
CREATE NONCLUSTERED INDEX [EmployeesOrders]
    ON [dbo].[Orders]([EmployeeID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[OrderDate]...';


GO
CREATE NONCLUSTERED INDEX [OrderDate]
    ON [dbo].[Orders]([OrderDate] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[ShippedDate]...';


GO
CREATE NONCLUSTERED INDEX [ShippedDate]
    ON [dbo].[Orders]([ShippedDate] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[ShippersOrders]...';


GO
CREATE NONCLUSTERED INDEX [ShippersOrders]
    ON [dbo].[Orders]([ShipVia] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Orders].[ShipPostalCode]...';


GO
CREATE NONCLUSTERED INDEX [ShipPostalCode]
    ON [dbo].[Orders]([ShipPostalCode] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Products].[CategoriesProducts]...';


GO
CREATE NONCLUSTERED INDEX [CategoriesProducts]
    ON [dbo].[Products]([CategoryID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Products].[CategoryID]...';


GO
CREATE NONCLUSTERED INDEX [CategoryID]
    ON [dbo].[Products]([CategoryID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Products].[ProductName]...';


GO
CREATE NONCLUSTERED INDEX [ProductName]
    ON [dbo].[Products]([ProductName] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Products].[SupplierID]...';


GO
CREATE NONCLUSTERED INDEX [SupplierID]
    ON [dbo].[Products]([SupplierID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Products].[SuppliersProducts]...';


GO
CREATE NONCLUSTERED INDEX [SuppliersProducts]
    ON [dbo].[Products]([SupplierID] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Suppliers].[CompanyName]...';


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Suppliers]([CompanyName] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Índice [dbo].[Suppliers].[PostalCode]...';


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Suppliers]([PostalCode] ASC)
    ON [PRIMARY];


GO
PRINT N'Creando Procedimiento [dbo].[CustOrderHist]...';


GO
CREATE PROCEDURE [dbo].[CustOrderHist] @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName
GO
PRINT N'Creando Procedimiento [dbo].[CustOrdersDetail]...';


GO
CREATE PROCEDURE [dbo].[CustOrdersDetail] @OrderID int
AS
SELECT ProductName,
    UnitPrice=ROUND(Od.UnitPrice, 2),
    Quantity,
    Discount=CONVERT(int, Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
FROM Products P, [Order Details] Od
WHERE Od.ProductID = P.ProductID and Od.OrderID = @OrderID
GO
PRINT N'Creando Procedimiento [dbo].[CustOrdersOrders]...';


GO
CREATE PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID
GO
PRINT N'Creando Procedimiento [dbo].[Employee Sales by Country]...';


GO
create procedure [dbo].[Employee Sales by Country] 
@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
FROM Employees INNER JOIN 
	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
PRINT N'Creando Procedimiento [dbo].[GetCustomerChangesByRowVersion]...';


GO
CREATE   PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
    @startRow BIGINT 
    ,@endRow  BIGINT 
)
AS
BEGIN
  SELECT c.[CustomerID]
    ,c.[CompanyName]
    ,c.[ContactName]
    ,c.[ContactTitle]
    ,c.[Address]
    ,c.[City]
    ,c.[Region]
    ,c.[PostalCode]
    ,c.[Country]
    ,c.[Phone]
    ,c.[Fax]
    ,c.[rowversion]
    ,g.[CustomerDesc]
  FROM 
    [dbo].[Customers] c
    LEFT JOIN [dbo].[CustomerCustomerDemo] d ON c.CustomerID=d.CustomerID
    LEFT JOIN [dbo].[CustomerDemographics] g ON g.CustomerTypeID=g.CustomerTypeID
  WHERE 
    (c.[rowversion] > CONVERT(ROWVERSION,@startRow) AND c.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR (d.[rowversion] > CONVERT(ROWVERSION,@startRow) AND d.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR (g.[rowversion] > CONVERT(ROWVERSION,@startRow) AND g.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
PRINT N'Creando Procedimiento [dbo].[GetEmployeeChangesByRowVersion]...';


GO
CREATE   PROCEDURE [dbo].[GetEmployeeChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

  SELECT e.[EmployeeID]
      ,e.[LastName]
      ,e.[FirstName]
      ,e.[Title]
      ,e.[TitleOfCourtesy]
      ,e.[BirthDate]
      ,e.[HireDate]
      ,e.[Address]
      ,e.[City]
      ,e.[Region]
      ,e.[PostalCode]
      ,e.[Country]
      ,e.[HomePhone]
      ,e.[Extension]
      ,e.[Photo]
      ,e.[Notes]
      ,e.[ReportsTo]
      ,e.[PhotoPath]
    ,t.[TerritoryDescription]
    ,r.[RegionDescription]
  FROM 
  [dbo].[Employees] e
  INNER JOIN [dbo].[EmployeeTerritories] et ON e.EmployeeID=et.EmployeeID
  INNER JOIN [dbo].[Territories] t ON et.TerritoryID=t.TerritoryID
  INNER JOIN [dbo].[Region] r ON t.RegionID=r.RegionID
  WHERE 
  (e.[rowversion] > CONVERT(ROWVERSION,@startRow) AND e.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (et.[rowversion] > CONVERT(ROWVERSION,@startRow) AND et.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (t.[rowversion] > CONVERT(ROWVERSION,@startRow) AND t.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (r.[rowversion] > CONVERT(ROWVERSION,@startRow) AND r.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
PRINT N'Creando Procedimiento [dbo].[GetProductChangesByRowVersion]...';


GO
CREATE PROCEDURE [dbo].[GetProductChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
  SELECT p.[ProductID]
      ,p.[ProductName]
      ,s.[CompanyName]
      ,c.[CategoryName]
      ,p.[QuantityPerUnit]
      ,p.[UnitPrice]
      ,p.[UnitsInStock]
      ,p.[UnitsOnOrder]
      ,p.[ReorderLevel]
      ,p.[Discontinued]
  FROM 
	[dbo].[Products] p
	INNER JOIN [dbo].[Categories] c ON p.CategoryID=c.CategoryID
	INNER JOIN [dbo].[Suppliers] s ON p.SupplierID=s.SupplierID
  WHERE 
	(p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (c.[rowversion] > CONVERT(ROWVERSION,@startRow)	AND c.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (s.[rowversion] > CONVERT(ROWVERSION,@startRow) AND s.[rowversion] <= CONVERT(ROWVERSION,@endRow))

END
GO
PRINT N'Creando Procedimiento [dbo].[Sales by Year]...';


GO
create procedure [dbo].[Sales by Year] 
	@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
PRINT N'Creando Procedimiento [dbo].[SalesByCategory]...';


GO
CREATE PROCEDURE [dbo].[SalesByCategory]
    @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT ProductName,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
FROM [Order Details] OD, Orders O, Products P, Categories C
WHERE OD.OrderID = O.OrderID 
	AND OD.ProductID = P.ProductID 
	AND P.CategoryID = C.CategoryID
	AND C.CategoryName = @CategoryName
	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName
GO
PRINT N'Creando Procedimiento [dbo].[Ten Most Expensive Products]...';


GO
create procedure [dbo].[Ten Most Expensive Products] AS
SET ROWCOUNT 10
SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC
GO
PRINT N'Actualización completada.';


GO
