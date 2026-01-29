-- ============================================================================
-- DIMENSION: DimGeography
-- ============================================================================
CREATE TABLE DimGeography (
    GeographySK INT IDENTITY(1,1) NOT NULL,
    City NVARCHAR(15) NULL,
    Region NVARCHAR(15) NULL,
    PostalCode NVARCHAR(10) NULL,
    Country NVARCHAR(15) NOT NULL,
    CONSTRAINT PK_DimGeography PRIMARY KEY CLUSTERED (GeographySK)
);
GO
CREATE NONCLUSTERED INDEX IX_DimGeography_Country ON DimGeography(Country);
GO
CREATE NONCLUSTERED INDEX IX_DimGeography_Region ON DimGeography(Region);
GO
CREATE NONCLUSTERED INDEX IX_DimGeography_City ON DimGeography(City);