CREATE TABLE [dbo].[HumanResources.Region](
	[RegionID] [int] NOT NULL CONSTRAINT PK_RegionId Primary key,
	[RegionDescription] [nchar](50) NOT NULL,
	[rowversion] [timestamp] NULL
)