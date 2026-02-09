
/*
================================================================================
NORTHWIND DATA WAREHOUSE - STAR SCHEMA
================================================================================
Description: Dimensional model for sales analysis
Granularity: Order detail line (OrderDetail)
SCD Type: Type 1 (Overwrite)
================================================================================
*/

USE master;
GO

IF DB_ID('DW_Northwind') IS NOT NULL
BEGIN
    ALTER DATABASE DW_Northwind SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DW_Northwind;
END
GO

CREATE DATABASE DW_Northwind;
GO

USE DW_Northwind;
GO

PRINT 'Northwind Data Warehouse created successfully';
GO
