CREATE TABLE [dbo].[Production.Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_Products Primary key,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL CONSTRAINT FK_Products_Suppliers FOREIGN KEY REFERENCES [dbo].[SupplyChain.Suppliers]([SupplierId]),
	[CategoryID] [int] NULL CONSTRAINT FK_Products_Categories FOREIGN KEY REFERENCES [dbo].[Production.Categories]([CategoryID]),
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[rowversion] [timestamp] NULL
)
