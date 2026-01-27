CREATE TABLE [dbo].[Sales.Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_Orders Primary Key,
	[CustomerID] [nchar](5) NULL CONSTRAINT FK_Orders_Customers FOREIGN KEY REFERENCES [dbo].[Customer.Customers]([CustomerId]),
	[EmployeeID] [int] NULL CONSTRAINT FK_Orders_Employees FOREIGN KEY REFERENCES [dbo].[HumanResources.Employees]([EmployeeID]),
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL CONSTRAINT FK_Orders_Shippers FOREIGN KEY REFERENCES [dbo].[SupplyChain.Shippers]([ShipperID]),
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[rowversion] [timestamp] NULL
)
