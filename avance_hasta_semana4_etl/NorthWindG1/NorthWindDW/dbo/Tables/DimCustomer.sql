-- ============================================================================
-- DIMENSION: DimCustomer
-- ============================================================================
CREATE TABLE DimCustomer (
    CustomerSK INT IDENTITY(1,1) NOT NULL,
    CustomerID NCHAR(5) NOT NULL,
    CompanyName NVARCHAR(40) NOT NULL,
    ContactName NVARCHAR(30) NULL,
    ContactTitle NVARCHAR(30) NULL,
    Address NVARCHAR(60) NULL,
    City NVARCHAR(15) NULL,
    Region NVARCHAR(15) NULL,
    PostalCode NVARCHAR(10) NULL,
    Country NVARCHAR(15) NULL,
    Phone NVARCHAR(24) NULL,
    Fax NVARCHAR(24) NULL,
    CustomerType NVARCHAR(10) NULL,
    CONSTRAINT PK_DimCustomer PRIMARY KEY CLUSTERED (CustomerSK),
    CONSTRAINT UQ_DimCustomer_CustomerID UNIQUE (CustomerID)
);
GO
CREATE NONCLUSTERED INDEX IX_DimCustomer_Country ON DimCustomer(Country);
GO
CREATE NONCLUSTERED INDEX IX_DimCustomer_City ON DimCustomer(City);