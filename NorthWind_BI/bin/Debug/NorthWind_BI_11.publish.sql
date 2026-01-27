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
PRINT N'Creando Tabla [dbo].[Customer.CustomerCustomerDemo]...';


GO
CREATE TABLE [dbo].[Customer.CustomerCustomerDemo] (
    [CustomerID]     NCHAR (5)  NOT NULL,
    [CustomerTypeID] NCHAR (10) NOT NULL,
    [rowversion]     TIMESTAMP  NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED ([CustomerID] ASC, [CustomerTypeID] ASC)
);


GO
PRINT N'Creando Clave externa [dbo].[FK_CustomerCustomerDemo_Customers]...';


GO
ALTER TABLE [dbo].[Customer.CustomerCustomerDemo] WITH NOCHECK
    ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer.Customers] ([CustomerID]);


GO
PRINT N'Creando Clave externa [dbo].[FK_CustomerCustomerDemo]...';


GO
ALTER TABLE [dbo].[Customer.CustomerCustomerDemo] WITH NOCHECK
    ADD CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY ([CustomerTypeID]) REFERENCES [dbo].[Customer.CustomerDemographics] ([CustomerTypeID]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Customer.CustomerCustomerDemo] WITH CHECK CHECK CONSTRAINT [FK_CustomerCustomerDemo_Customers];

ALTER TABLE [dbo].[Customer.CustomerCustomerDemo] WITH CHECK CHECK CONSTRAINT [FK_CustomerCustomerDemo];


GO
PRINT N'Actualización completada.';


GO
