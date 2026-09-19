/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_SIBOMANA Eric
PURPOSE: Answer eight AdventureWorks business and metadata questions using SQL Server.

MODIFICATION LOG:
Ver      Date        Author          Description
-----    ----------  -------------   -------------------------------------------------------------------------------
1.0      09/19/2026  SIBOMANA Eric   Created W3.4 AdventureWorks answers

RUNTIME:
Estimated: Less than 1 minute

NOTES:
This script uses the AdventureWorks2022 OLTP sample database.
The questions are selected from the W3.3 discussion and include two of my own
questions plus questions created by other students.
******************************************************************************************************************/

USE AdventureWorks2022;
GO

/*****************************************************************************************************************
Q1: What are the ten most expensive products based on their list price?
Original author: Sibomana Eric
Category: Business User question - Marginal complexity
******************************************************************************************************************/

-- A1: Return the ten products with the highest ListPrice.
SELECT TOP (10)
       ProductID,
       Name AS ProductName,
       ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


/*****************************************************************************************************************
Q2: Which products have the highest standard cost?
Original author: Sibomana Eric
Category: Business User question - Marginal complexity
******************************************************************************************************************/

-- A2: Return the ten products with the highest StandardCost.
SELECT TOP (10)
       ProductID,
       Name AS ProductName,
       StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;
GO


/*****************************************************************************************************************
Q3: I want to understand our products better. Which product categories
    have the largest number of products?
Original author: Kwizera Hubert Sage
Category: Business User question - Moderate complexity
******************************************************************************************************************/

-- A3: Join products to subcategories and categories, then count products.
SELECT
       pc.Name AS ProductCategory,
       COUNT(p.ProductID) AS ProductCount
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY ProductCount DESC;
GO


/*****************************************************************************************************************
Q4: I want to compare our sales territories. Which territories have the
    highest total sales, and how many orders did each territory receive?
Original author: Kwizera Hubert Sage
Category: Business User question - Moderate complexity
******************************************************************************************************************/

-- A4: Summarize sales revenue and number of orders by sales territory.
SELECT
       st.Name AS SalesTerritory,
       COUNT(soh.SalesOrderID) AS OrderCount,
       SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalSales DESC;
GO


/*****************************************************************************************************************
Q5: The sales manager wants to understand which products generate the most revenue.
    Which products have the highest total sales revenue, and how many units of each
    product were sold? Please include the product name, total quantity sold, and
    total sales revenue.
Original author: Joseph Terkper
Category: Business User question - Increased complexity
******************************************************************************************************************/

-- A5: Calculate total quantity and total sales revenue for each product.
SELECT
       p.ProductID,
       p.Name AS ProductName,
       SUM(sod.OrderQty) AS TotalUnitsSold,
       SUM(sod.LineTotal) AS TotalSalesRevenue
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY
       p.ProductID,
       p.Name
ORDER BY TotalSalesRevenue DESC;
GO


/*****************************************************************************************************************
Q6: The sales manager wants to identify opportunities to improve product
    performance. For products sold during 2012, which five products generated
    the highest total sales? Include the product name, quantity sold, total
    sales amount, and average selling price.
Original author: Kudzanayi Murambwa
Category: Business User question - Increased complexity
******************************************************************************************************************/

-- A6: Find the five products with the highest total sales during 2012.
SELECT TOP (5)
       p.ProductID,
       p.Name AS ProductName,
       SUM(sod.OrderQty) AS TotalUnitsSold,
       SUM(sod.LineTotal) AS TotalSalesAmount,
       AVG(sod.UnitPrice) AS AverageSellingPrice
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
WHERE soh.OrderDate >= '20120101'
  AND soh.OrderDate <  '20130101'
GROUP BY
       p.ProductID,
       p.Name
ORDER BY TotalSalesAmount DESC;
GO


/*****************************************************************************************************************
Q7: How many tables are in the HumanResources schema?
Original author: Mayur Shrirang Uthale
Category: Metadata question
******************************************************************************************************************/

-- A7: Count the base tables in the HumanResources schema.
SELECT
       COUNT(*) AS TableCount
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'HumanResources'
  AND TABLE_TYPE = 'BASE TABLE';
GO


/*****************************************************************************************************************
Q8: Can you list the table names and table types for all tables in the Sales schema?
Original author: Joseph Terkper
Category: Metadata question
******************************************************************************************************************/

-- A8: Use INFORMATION_SCHEMA.TABLES to list objects in the Sales schema.
SELECT
       TABLE_SCHEMA,
       TABLE_NAME,
       TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales'
ORDER BY TABLE_NAME;
GO


/*****************************************************************************************************************
END OF SCRIPT
******************************************************************************************************************/
