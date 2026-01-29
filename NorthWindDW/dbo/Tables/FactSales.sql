-- ============================================================================
-- FACT TABLE: FactSales
-- ============================================================================
CREATE TABLE FactSales (
    SalesSK BIGINT IDENTITY(1,1) NOT NULL,
    OrderID INT NOT NULL,
    ProductSK INT NOT NULL,
    CustomerSK INT NOT NULL,
    EmployeeSK INT NOT NULL,
    OrderDateKey INT NOT NULL,
    RequiredDateKey INT NULL,
    ShippedDateKey INT NULL,
    GeographySK INT NOT NULL,
    ShipperSK INT NOT NULL,
    Quantity SMALLINT NOT NULL,
    UnitPrice MONEY NOT NULL,
    DiscountPercent REAL NOT NULL,
    GrossSalesAmount MONEY NOT NULL,
    DiscountAmount MONEY NOT NULL,
    NetSalesAmount MONEY NOT NULL,
    FreightCost MONEY NULL,
    DaysToShip INT NULL,
    IsLateShipment BIT NULL,
    CONSTRAINT PK_FactSales PRIMARY KEY CLUSTERED (SalesSK),
    CONSTRAINT FK_FactSales_Product FOREIGN KEY (ProductSK) 
        REFERENCES DimProduct(ProductSK),
    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (CustomerSK) 
        REFERENCES DimCustomer(CustomerSK),
    CONSTRAINT FK_FactSales_Employee FOREIGN KEY (EmployeeSK) 
        REFERENCES DimEmployee(EmployeeSK),
    CONSTRAINT FK_FactSales_OrderDate FOREIGN KEY (OrderDateKey) 
        REFERENCES DimDate(DateKey),
    CONSTRAINT FK_FactSales_Geography FOREIGN KEY (GeographySK) 
        REFERENCES DimGeography(GeographySK),
    CONSTRAINT FK_FactSales_Shipper FOREIGN KEY (ShipperSK) 
        REFERENCES DimShipper(ShipperSK)
);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Product ON FactSales(ProductSK);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Customer ON FactSales(CustomerSK);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Employee ON FactSales(EmployeeSK);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_OrderDate ON FactSales(OrderDateKey);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Geography ON FactSales(GeographySK);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_OrderID ON FactSales(OrderID);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Date_Customer ON FactSales(OrderDateKey, CustomerSK) 
    INCLUDE (NetSalesAmount, Quantity);
GO
CREATE NONCLUSTERED INDEX IX_FactSales_Date_Product ON FactSales(OrderDateKey, ProductSK) 
    INCLUDE (NetSalesAmount, Quantity);