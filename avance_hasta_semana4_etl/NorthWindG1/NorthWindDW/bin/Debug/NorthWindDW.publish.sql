/*
Script de implementación para NorthWindDW

Este código lo generó una herramienta.
Los cambios en este archivo pueden provocar un comportamiento incorrecto y se perderán si
el código se vuelve a generar.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "NorthWindDW"
:setvar DefaultFilePrefix "NorthWindDW"
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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creando Tabla [dbo].[DimCustomer]...';


GO
CREATE TABLE [dbo].[DimCustomer] (
    [CustomerSK]   INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]   NCHAR (5)     NOT NULL,
    [CompanyName]  NVARCHAR (40) NOT NULL,
    [ContactName]  NVARCHAR (30) NULL,
    [ContactTitle] NVARCHAR (30) NULL,
    [Address]      NVARCHAR (60) NULL,
    [City]         NVARCHAR (15) NULL,
    [Region]       NVARCHAR (15) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Country]      NVARCHAR (15) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    [CustomerType] NVARCHAR (10) NULL,
    CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerSK] ASC),
    CONSTRAINT [UQ_DimCustomer_CustomerID] UNIQUE NONCLUSTERED ([CustomerID] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimCustomer].[IX_DimCustomer_Country]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimCustomer_Country]
    ON [dbo].[DimCustomer]([Country] ASC);


GO
PRINT N'Creando Índice [dbo].[DimCustomer].[IX_DimCustomer_City]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimCustomer_City]
    ON [dbo].[DimCustomer]([City] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimDate]...';


GO
CREATE TABLE [dbo].[DimDate] (
    [DateKey]        INT           NOT NULL,
    [FullDate]       DATE          NOT NULL,
    [DayOfMonth]     TINYINT       NOT NULL,
    [DayOfWeek]      TINYINT       NOT NULL,
    [DayName]        NVARCHAR (10) NOT NULL,
    [DayNameShort]   NCHAR (3)     NOT NULL,
    [DayOfYear]      INT           NOT NULL,
    [WeekOfYear]     TINYINT       NOT NULL,
    [WeekStart]      DATE          NOT NULL,
    [WeekEnd]        DATE          NOT NULL,
    [Month]          TINYINT       NOT NULL,
    [MonthName]      NVARCHAR (10) NOT NULL,
    [MonthNameShort] NCHAR (3)     NOT NULL,
    [MonthYear]      NCHAR (7)     NOT NULL,
    [Quarter]        TINYINT       NOT NULL,
    [QuarterName]    NCHAR (2)     NOT NULL,
    [QuarterYear]    NCHAR (7)     NOT NULL,
    [Year]           SMALLINT      NOT NULL,
    [IsWeekday]      BIT           NOT NULL,
    [IsWeekend]      BIT           NOT NULL,
    [IsHoliday]      BIT           NOT NULL,
    [HolidayName]    NVARCHAR (50) NULL,
    CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimDate].[IX_DimDate_FullDate]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimDate_FullDate]
    ON [dbo].[DimDate]([FullDate] ASC);


GO
PRINT N'Creando Índice [dbo].[DimDate].[IX_DimDate_Year_Month]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimDate_Year_Month]
    ON [dbo].[DimDate]([Year] ASC, [Month] ASC);


GO
PRINT N'Creando Índice [dbo].[DimDate].[IX_DimDate_Quarter]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimDate_Quarter]
    ON [dbo].[DimDate]([Quarter] ASC, [Year] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimEmployee]...';


GO
CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeSK]          INT            IDENTITY (1, 1) NOT NULL,
    [EmployeeID]          INT            NOT NULL,
    [LastName]            NVARCHAR (20)  NOT NULL,
    [FirstName]           NVARCHAR (10)  NOT NULL,
    [FullName]            AS             (FirstName + ' ' + LastName) PERSISTED,
    [Title]               NVARCHAR (30)  NULL,
    [TitleOfCourtesy]     NVARCHAR (25)  NULL,
    [BirthDate]           DATETIME       NULL,
    [HireDate]            DATETIME       NULL,
    [Address]             NVARCHAR (60)  NULL,
    [City]                NVARCHAR (15)  NULL,
    [Region]              NVARCHAR (15)  NULL,
    [PostalCode]          NVARCHAR (10)  NULL,
    [Country]             NVARCHAR (15)  NULL,
    [HomePhone]           NVARCHAR (24)  NULL,
    [Extension]           NVARCHAR (4)   NULL,
    [ReportsTo]           INT            NULL,
    [ManagerName]         NVARCHAR (31)  NULL,
    [AssignedTerritories] NVARCHAR (200) NULL,
    [AssignedRegions]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED ([EmployeeSK] ASC),
    CONSTRAINT [UQ_DimEmployee_EmployeeID] UNIQUE NONCLUSTERED ([EmployeeID] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimEmployee].[IX_DimEmployee_ReportsTo]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimEmployee_ReportsTo]
    ON [dbo].[DimEmployee]([ReportsTo] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimGeography]...';


GO
CREATE TABLE [dbo].[DimGeography] (
    [GeographySK] INT           IDENTITY (1, 1) NOT NULL,
    [City]        NVARCHAR (15) NULL,
    [Region]      NVARCHAR (15) NULL,
    [PostalCode]  NVARCHAR (10) NULL,
    [Country]     NVARCHAR (15) NOT NULL,
    CONSTRAINT [PK_DimGeography] PRIMARY KEY CLUSTERED ([GeographySK] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimGeography].[IX_DimGeography_Country]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimGeography_Country]
    ON [dbo].[DimGeography]([Country] ASC);


GO
PRINT N'Creando Índice [dbo].[DimGeography].[IX_DimGeography_Region]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimGeography_Region]
    ON [dbo].[DimGeography]([Region] ASC);


GO
PRINT N'Creando Índice [dbo].[DimGeography].[IX_DimGeography_City]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimGeography_City]
    ON [dbo].[DimGeography]([City] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimProduct]...';


GO
CREATE TABLE [dbo].[DimProduct] (
    [ProductSK]           INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]           INT            NOT NULL,
    [ProductName]         NVARCHAR (40)  NOT NULL,
    [QuantityPerUnit]     NVARCHAR (20)  NULL,
    [UnitPrice]           MONEY          NULL,
    [Discontinued]        BIT            NOT NULL,
    [CategoryID]          INT            NULL,
    [CategoryName]        NVARCHAR (15)  NULL,
    [CategoryDescription] NVARCHAR (MAX) NULL,
    [SupplierID]          INT            NULL,
    [SupplierName]        NVARCHAR (40)  NULL,
    [SupplierContact]     NVARCHAR (30)  NULL,
    [SupplierCountry]     NVARCHAR (15)  NULL,
    [SupplierCity]        NVARCHAR (15)  NULL,
    CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductSK] ASC),
    CONSTRAINT [UQ_DimProduct_ProductID] UNIQUE NONCLUSTERED ([ProductID] ASC)
);


GO
PRINT N'Creando Índice [dbo].[DimProduct].[IX_DimProduct_Category]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimProduct_Category]
    ON [dbo].[DimProduct]([CategoryName] ASC);


GO
PRINT N'Creando Índice [dbo].[DimProduct].[IX_DimProduct_Supplier]...';


GO
CREATE NONCLUSTERED INDEX [IX_DimProduct_Supplier]
    ON [dbo].[DimProduct]([SupplierName] ASC);


GO
PRINT N'Creando Tabla [dbo].[DimShipper]...';


GO
CREATE TABLE [dbo].[DimShipper] (
    [ShipperSK]   INT           IDENTITY (1, 1) NOT NULL,
    [ShipperID]   INT           NOT NULL,
    [CompanyName] NVARCHAR (40) NOT NULL,
    [Phone]       NVARCHAR (24) NULL,
    CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED ([ShipperSK] ASC),
    CONSTRAINT [UQ_DimShipper_ShipperID] UNIQUE NONCLUSTERED ([ShipperID] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[FactSales]...';


GO
CREATE TABLE [dbo].[FactSales] (
    [SalesSK]          BIGINT   IDENTITY (1, 1) NOT NULL,
    [OrderID]          INT      NOT NULL,
    [ProductSK]        INT      NOT NULL,
    [CustomerSK]       INT      NOT NULL,
    [EmployeeSK]       INT      NOT NULL,
    [OrderDateKey]     INT      NOT NULL,
    [RequiredDateKey]  INT      NULL,
    [ShippedDateKey]   INT      NULL,
    [GeographySK]      INT      NOT NULL,
    [ShipperSK]        INT      NOT NULL,
    [Quantity]         SMALLINT NOT NULL,
    [UnitPrice]        MONEY    NOT NULL,
    [DiscountPercent]  REAL     NOT NULL,
    [GrossSalesAmount] MONEY    NOT NULL,
    [DiscountAmount]   MONEY    NOT NULL,
    [NetSalesAmount]   MONEY    NOT NULL,
    [FreightCost]      MONEY    NULL,
    [DaysToShip]       INT      NULL,
    [IsLateShipment]   BIT      NULL,
    CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED ([SalesSK] ASC)
);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Product]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Product]
    ON [dbo].[FactSales]([ProductSK] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Customer]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Customer]
    ON [dbo].[FactSales]([CustomerSK] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Employee]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Employee]
    ON [dbo].[FactSales]([EmployeeSK] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_OrderDate]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_OrderDate]
    ON [dbo].[FactSales]([OrderDateKey] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Geography]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Geography]
    ON [dbo].[FactSales]([GeographySK] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_OrderID]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_OrderID]
    ON [dbo].[FactSales]([OrderID] ASC);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Date_Customer]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Date_Customer]
    ON [dbo].[FactSales]([OrderDateKey] ASC, [CustomerSK] ASC)
    INCLUDE([NetSalesAmount], [Quantity]);


GO
PRINT N'Creando Índice [dbo].[FactSales].[IX_FactSales_Date_Product]...';


GO
CREATE NONCLUSTERED INDEX [IX_FactSales_Date_Product]
    ON [dbo].[FactSales]([OrderDateKey] ASC, [ProductSK] ASC)
    INCLUDE([NetSalesAmount], [Quantity]);


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[DimDate]...';


GO
ALTER TABLE [dbo].[DimDate]
    ADD DEFAULT 0 FOR [IsHoliday];


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_Product]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_Product] FOREIGN KEY ([ProductSK]) REFERENCES [dbo].[DimProduct] ([ProductSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_Customer]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_Customer] FOREIGN KEY ([CustomerSK]) REFERENCES [dbo].[DimCustomer] ([CustomerSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_Employee]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_Employee] FOREIGN KEY ([EmployeeSK]) REFERENCES [dbo].[DimEmployee] ([EmployeeSK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_OrderDate]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_OrderDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_Geography]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_Geography] FOREIGN KEY ([GeographySK]) REFERENCES [dbo].[DimGeography] ([GeographySK]);


GO
PRINT N'Creando Clave externa [dbo].[FK_FactSales_Shipper]...';


GO
ALTER TABLE [dbo].[FactSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactSales_Shipper] FOREIGN KEY ([ShipperSK]) REFERENCES [dbo].[DimShipper] ([ShipperSK]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_Product];

ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_Customer];

ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_Employee];

ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_OrderDate];

ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_Geography];

ALTER TABLE [dbo].[FactSales] WITH CHECK CHECK CONSTRAINT [FK_FactSales_Shipper];


GO
PRINT N'Actualización completada.';


GO
