CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID DECIMAL(10,1),
    Country VARCHAR(50),
    TotalPrice DECIMAL(12,2),
    YearMonth VARCHAR(10),
    DayOfWeek VARCHAR(15),
    Hour INT
);
ALTER TABLE sales
MODIFY COLUMN CustomerID DECIMAL(10,1);
DESCRIBE sales;
USE ecommerce_analysis;

SELECT COUNT(*) AS total_rows
FROM sales;
TRUNCATE TABLE sales;
SELECT COUNT(*) AS total_rows
FROM sales;
SELECT VERSION();
CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID DECIMAL(10,1),
    Country VARCHAR(50),
    TotalPrice DECIMAL(12,2),
    YearMonth VARCHAR(10),
    DayOfWeek VARCHAR(15),
    Hour INT
);
ALTER TABLE sales
MODIFY COLUMN CustomerID DECIMAL(10,1);
DESCRIBE sales;
USE ecommerce_analysis;

SELECT COUNT(*) AS total_rows
FROM sales;
TRUNCATE TABLE sales;
SELECT COUNT(*) AS total_rows
FROM sales;
SELECT VERSION();
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
USE ecommerce_analysis;
SELECT COUNT(*) AS total_rows FROM sales;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
USE ecommerce_analysis;

SELECT *
FROM sales
LIMIT 10;
SELECT
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales;
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales;
SELECT
    ROUND(SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
FROM sales;
SELECT
    Description,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT
    Country,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT
    YearMonth,
    ROUND(SUM(TotalPrice), 2) AS Monthly_Revenue
FROM sales
GROUP BY YearMonth
ORDER BY YearMonth;
SELECT
    CustomerID,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;
SELECT
    DayOfWeek,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY DayOfWeek
ORDER BY Total_Revenue DESC;
SELECT
    Hour,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Hour
ORDER BY Total_Revenue DESC;
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 10;
SELECT
    CASE
        WHEN Customer_Revenue <= 500 THEN 'Low Value'
        WHEN Customer_Revenue <= 2000 THEN 'Medium Value'
        ELSE 'High Value'
    END AS Customer_Segment,
    COUNT(*) AS Total_Customers
FROM (
    SELECT
        CustomerID,
        SUM(TotalPrice) AS Customer_Revenue
    FROM sales
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
) AS customer_spending
GROUP BY Customer_Segment
ORDER BY Total_Customers DESC;
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Cancelled_Orders
FROM sales
WHERE InvoiceNo LIKE 'C%';
USE ecommerce_analysis;

CREATE TABLE all_transactions (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID DECIMAL(10,1),
    Country VARCHAR(50)
);
SHOW TABLES;
ALTER TABLE all_transactions
ADD COLUMN TotalPrice DECIMAL(12,2);
SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Cancelled_Orders
FROM all_transactions
WHERE InvoiceNo LIKE 'C%';
SELECT
    COUNT(DISTINCT CASE
        WHEN InvoiceNo LIKE 'C%' THEN InvoiceNo
    END) AS Cancelled_Orders,
    COUNT(DISTINCT InvoiceNo) AS Total_Invoices,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN InvoiceNo LIKE 'C%' THEN InvoiceNo
        END) * 100.0 /
        COUNT(DISTINCT InvoiceNo), 2
    ) AS Cancellation_Rate
FROM all_transactions;
SELECT
    COUNT(*) AS Total_Return_Records,
    SUM(ABS(Quantity)) AS Total_Returned_Quantity
FROM all_transactions
WHERE Quantity < 0;
SELECT
    ROUND(ABS(SUM(Quantity * UnitPrice)), 2) AS Returned_Value
FROM all_transactions
WHERE Quantity < 0;
SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Net_Transaction_Revenue
FROM all_transactions;