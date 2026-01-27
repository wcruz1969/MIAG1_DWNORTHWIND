/*
Script de implementación para NorthWind_BI

Este código lo generó una herramienta.
Los cambios en este archivo pueden provocar un comportamiento incorrecto y se perderán si
el código se vuelve a generar.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "NorthWind_BI"
:setvar DefaultFilePrefix "NorthWind_BI"
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
PRINT N'Creando Tabla [dbo].[HumanResources.Employees]...';


GO
CREATE TABLE [dbo].[HumanResources.Employees] (
    [EmployeeID]      INT            IDENTITY (1, 1) NOT NULL,
    [LastName]        NVARCHAR (20)  NOT NULL,
    [FirstName]       NVARCHAR (10)  NOT NULL,
    [Title]           NVARCHAR (30)  NULL,
    [TitleOfCourtesy] NVARCHAR (25)  NULL,
    [BirthDate]       DATETIME       NULL,
    [HireDate]        DATETIME       NULL,
    [Address]         NVARCHAR (60)  NULL,
    [City]            NVARCHAR (15)  NULL,
    [Region]          NVARCHAR (15)  NULL,
    [PostalCode]      NVARCHAR (10)  NULL,
    [Country]         NVARCHAR (15)  NULL,
    [HomePhone]       NVARCHAR (24)  NULL,
    [Extension]       NVARCHAR (4)   NULL,
    [Photo]           IMAGE          NULL,
    [Notes]           NVARCHAR (MAX) NULL,
    [ReportsTo]       INT            NULL,
    [PhotoPath]       NVARCHAR (255) NULL,
    [rowversion]      TIMESTAMP      NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[HumanResources.EmployeeTerritories]...';


GO
CREATE TABLE [dbo].[HumanResources.EmployeeTerritories] (
    [EmployeeID]  INT           NOT NULL,
    [TerritoryID] NVARCHAR (20) NOT NULL,
    [rowversion]  TIMESTAMP     NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED ([EmployeeID] ASC, [TerritoryID] ASC)
);


GO
PRINT N'Creando Clave externa [dbo].[FK_Employees_Employees]...';


GO
ALTER TABLE [dbo].[HumanResources.Employees] WITH NOCHECK
    ADD CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [dbo].[HumanResources.Employees] ([EmployeeID]);


GO
PRINT N'Creando Clave externa [dbo].[FK_EmployeeTerritories_Employees]...';


GO
ALTER TABLE [dbo].[HumanResources.EmployeeTerritories] WITH NOCHECK
    ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[HumanResources.Employees] ([EmployeeID]);


GO
PRINT N'Creando Clave externa [dbo].[FK_EmployeeTerritories_Territories]...';


GO
ALTER TABLE [dbo].[HumanResources.EmployeeTerritories] WITH NOCHECK
    ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [dbo].[HumanResources.Territories] ([TerritoryID]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[HumanResources.Employees] WITH CHECK CHECK CONSTRAINT [FK_Employees_Employees];

ALTER TABLE [dbo].[HumanResources.EmployeeTerritories] WITH CHECK CHECK CONSTRAINT [FK_EmployeeTerritories_Employees];

ALTER TABLE [dbo].[HumanResources.EmployeeTerritories] WITH CHECK CHECK CONSTRAINT [FK_EmployeeTerritories_Territories];


GO
PRINT N'Actualización completada.';


GO
