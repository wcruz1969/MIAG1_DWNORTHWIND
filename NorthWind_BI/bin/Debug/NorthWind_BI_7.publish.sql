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
PRINT N'Creando Tabla [dbo].[SupplyChain.Suppliers]...';


GO
CREATE TABLE [dbo].[SupplyChain.Suppliers] (
    [SupplierID]   INT            IDENTITY (1, 1) NOT NULL,
    [CompanyName]  NVARCHAR (40)  NOT NULL,
    [ContactName]  NVARCHAR (30)  NULL,
    [ContactTitle] NVARCHAR (30)  NULL,
    [Address]      NVARCHAR (60)  NULL,
    [City]         NVARCHAR (15)  NULL,
    [Region]       NVARCHAR (15)  NULL,
    [PostalCode]   NVARCHAR (10)  NULL,
    [Country]      NVARCHAR (15)  NULL,
    [Phone]        NVARCHAR (24)  NULL,
    [Fax]          NVARCHAR (24)  NULL,
    [HomePage]     NVARCHAR (MAX) NULL,
    [rowversion]   TIMESTAMP      NULL,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID] ASC)
);


GO
PRINT N'Actualización completada.';


GO
