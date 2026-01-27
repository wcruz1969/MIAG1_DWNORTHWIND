CREATE TABLE [dbo].[HumanResources.EmployeeTerritories](
	[EmployeeID] [int] NOT NULL CONSTRAINT FK_EmployeeTerritories_Employees FOREIGN KEY REFERENCES [dbo].[HumanResources.Employees]([EmployeeId]),
	[TerritoryID] [nvarchar](20) NOT NULL CONSTRAINT FK_EmployeeTerritories_Territories FOREIGN KEY REFERENCES [dbo].[HumanResources.Territories]([TerritoryId]),
	[rowversion] [timestamp] NULL
)
go
ALTER TABLE [dbo].[HumanResources.EmployeeTerritories] ADD  CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeID] ASC,
	[TerritoryID] ASC
)
go
