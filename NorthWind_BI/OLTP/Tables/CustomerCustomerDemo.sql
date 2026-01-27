CREATE TABLE [dbo].[Customer.CustomerCustomerDemo](
	[CustomerID] [nchar](5) NOT NULL      CONSTRAINT FK_CustomerCustomerDemo_Customers FOREIGN KEY REFERENCES [dbo].[Customer.Customers]([CustomerId]),
	[CustomerTypeID] [nchar](10) NOT NULL CONSTRAINT FK_CustomerCustomerDemo      FOREIGN KEY REFERENCES [dbo].[Customer.CustomerDemographics]([CustomerTypeId]),
	[rowversion] [timestamp] NULL
)
go

ALTER TABLE [dbo].[Customer.CustomerCustomerDemo] ADD  CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
(
	[CustomerID] ASC,
	[CustomerTypeID] ASC
)