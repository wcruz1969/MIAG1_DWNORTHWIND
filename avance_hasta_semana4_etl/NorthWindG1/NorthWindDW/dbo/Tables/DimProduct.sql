-- ============================================================================
-- DIMENSION: DimProduct
-- ============================================================================
CREATE TABLE DimProduct (
    ProductSK INT IDENTITY(1,1) NOT NULL,
    ProductID INT NOT NULL,
    ProductName NVARCHAR(40) NOT NULL,
    QuantityPerUnit NVARCHAR(20) NULL,
    UnitPrice MONEY NULL,
    Discontinued BIT NOT NULL,
    CategoryID INT NULL,
    CategoryName NVARCHAR(15) NULL,
    CategoryDescription NVARCHAR(MAX) NULL,
    SupplierID INT NULL,
    SupplierName NVARCHAR(40) NULL,
    SupplierContact NVARCHAR(30) NULL,
    SupplierCountry NVARCHAR(15) NULL,
    SupplierCity NVARCHAR(15) NULL,
    CONSTRAINT PK_DimProduct PRIMARY KEY CLUSTERED (ProductSK),
    CONSTRAINT UQ_DimProduct_ProductID UNIQUE (ProductID)
);
GO
CREATE NONCLUSTERED INDEX IX_DimProduct_Category ON DimProduct(CategoryName);
GO
CREATE NONCLUSTERED INDEX IX_DimProduct_Supplier ON DimProduct(SupplierName);