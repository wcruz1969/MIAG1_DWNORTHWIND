CREATE TABLE [dbo].[Sales.OrderDetails]
(
	[OrderID] [int] NOT NULL   CONSTRAINT FK_Order_Details_Orders   FOREIGN KEY REFERENCES [dbo].[Sales.Orders]([OrderID]),
	[ProductID] [int] NOT NULL CONSTRAINT FK_Order_Details_Products FOREIGN KEY REFERENCES [dbo].[Production.Products]([ProductID]),
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[rowversion] [timestamp] NULL,
)
go

ALTER TABLE [dbo].[Sales.OrderDetails] ADD  CONSTRAINT [PK_Order_Details] PRIMARY KEY NONCLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)
