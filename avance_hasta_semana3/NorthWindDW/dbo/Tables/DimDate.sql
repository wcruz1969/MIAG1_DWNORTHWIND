-- ============================================================================
-- DIMENSION: DimDate
-- ============================================================================
CREATE TABLE DimDate (
    DateKey INT NOT NULL,
    FullDate DATE NOT NULL,
    DayOfMonth TINYINT NOT NULL,
    DayOfWeek TINYINT NOT NULL,
    DayName NVARCHAR(10) NOT NULL,
    DayNameShort NCHAR(3) NOT NULL,
    DayOfYear INT NOT NULL,
    WeekOfYear TINYINT NOT NULL,
    WeekStart DATE NOT NULL,
    WeekEnd DATE NOT NULL,
    Month TINYINT NOT NULL,
    MonthName NVARCHAR(10) NOT NULL,
    MonthNameShort NCHAR(3) NOT NULL,
    MonthYear NCHAR(7) NOT NULL,
    Quarter TINYINT NOT NULL,
    QuarterName NCHAR(2) NOT NULL,
    QuarterYear NCHAR(7) NOT NULL,
    Year SMALLINT NOT NULL,
    IsWeekday BIT NOT NULL,
    IsWeekend BIT NOT NULL,
    IsHoliday BIT NOT NULL DEFAULT 0,
    HolidayName NVARCHAR(50) NULL,
    CONSTRAINT PK_DimDate PRIMARY KEY CLUSTERED (DateKey)
);
GO
CREATE NONCLUSTERED INDEX IX_DimDate_FullDate ON DimDate(FullDate);
GO
CREATE NONCLUSTERED INDEX IX_DimDate_Year_Month ON DimDate(Year, Month);
GO
CREATE NONCLUSTERED INDEX IX_DimDate_Quarter ON DimDate(Quarter, Year);