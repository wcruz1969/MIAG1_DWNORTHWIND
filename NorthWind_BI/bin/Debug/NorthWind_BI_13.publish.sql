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
PRINT N'Creando Tabla [dbo].[Sales.Orders]...';


GO
CREATE TABLE [dbo].[Sales.Orders] (
    [OrderID]        INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]     NCHAR (5)     NULL,
    [EmployeeID]     INT           NULL,
    [OrderDate]      DATETIME      NULL,
    [RequiredDate]   DATETIME      NULL,
    [ShippedDate]    DATETIME      NULL,
    [ShipVia]        INT           NULL,
    [Freight]        MONEY         NULL,
    [ShipName]       NVARCHAR (40) NULL,
    [ShipAddress]    NVARCHAR (60) NULL,
    [ShipCity]       NVARCHAR (15) NULL,
    [ShipRegion]     NVARCHAR (15) NULL,
    [ShipPostalCode] NVARCHAR (10) NULL,
    [ShipCountry]    NVARCHAR (15) NULL,
    [rowversion]     TIMESTAMP     NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC)
);


GO
PRINT N'Creando Clave externa [dbo].[FK_Orders_Customers]...';


GO
ALTER TABLE [dbo].[Sales.Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer.Customers] ([CustomerID]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Orders_Employees]...';


GO
ALTER TABLE [dbo].[Sales.Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[HumanResources.Employees] ([EmployeeID]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Orders_Shippers]...';


GO
ALTER TABLE [dbo].[Sales.Orders] WITH NOCHECK
    ADD CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[SupplyChain.Shippers] ([ShipperID]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Sales.Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Customers];

ALTER TABLE [dbo].[Sales.Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Employees];

ALTER TABLE [dbo].[Sales.Orders] WITH CHECK CHECK CONSTRAINT [FK_Orders_Shippers];


GO
PRINT N'Actualización completada.';


GO
