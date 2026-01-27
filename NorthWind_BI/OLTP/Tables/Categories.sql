CREATE TABLE [dbo].[Production.Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_Categories Primary key,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Picture] [image] NULL,
	[rowversion] [timestamp] NULL
)