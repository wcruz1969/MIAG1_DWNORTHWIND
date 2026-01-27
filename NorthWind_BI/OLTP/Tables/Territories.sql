CREATE TABLE [dbo].[HumanResources.Territories]
(
	[TerritoryID] [nvarchar](20) NOT NULL CONSTRAINT PK_Territories PRIMARY KEY,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL CONSTRAINT FK_Territories_Region FOREIGN KEY REFERENCES [dbo].[HumanResources.Region]([RegionId]),
	[rowversion] [timestamp] NULL
)
