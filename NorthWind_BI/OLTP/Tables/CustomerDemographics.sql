CREATE TABLE [dbo].[Customer.CustomerDemographics](
	[CustomerTypeID] [nchar](10) NOT NULL CONSTRAINT PK_CustomerDemographics Primary Key,
	[CustomerDesc] [nvarchar](max) NULL,
	[rowversion] [timestamp] NULL
) 