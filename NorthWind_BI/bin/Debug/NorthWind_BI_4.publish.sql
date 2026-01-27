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
PRINT N'Quitando Clave externa restricción sin nombre en [dbo].[HumanResources.Territories]...';


GO
ALTER TABLE [dbo].[HumanResources.Territories] DROP CONSTRAINT [FK__HumanReso__Regio__4CA06362];


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[HumanResources.Territories]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_HumanResources.Territories] (
    [TerritoryID]          NVARCHAR (20) NOT NULL,
    [TerritoryDescription] NCHAR (50)    NOT NULL,
    [RegionID]             INT           NOT NULL,
    [rowversion]           TIMESTAMP     NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Territories1] PRIMARY KEY CLUSTERED ([TerritoryID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[HumanResources.Territories])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_HumanResources.Territories] ([TerritoryID], [TerritoryDescription], [RegionID])
        SELECT   [TerritoryID],
                 [TerritoryDescription],
                 [RegionID]
        FROM     [dbo].[HumanResources.Territories]
        ORDER BY [TerritoryID] ASC;
    END

DROP TABLE [dbo].[HumanResources.Territories];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_HumanResources.Territories]', N'HumanResources.Territories';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Territories1]', N'PK_Territories', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creando Clave externa [dbo].[FK_Territories_Region]...';


GO
ALTER TABLE [dbo].[HumanResources.Territories] WITH NOCHECK
    ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [dbo].[HumanResources.Region] ([RegionID]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[HumanResources.Territories] WITH CHECK CHECK CONSTRAINT [FK_Territories_Region];


GO
PRINT N'Actualización completada.';


GO
