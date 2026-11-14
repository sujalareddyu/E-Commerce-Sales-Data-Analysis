-- ============================================
-- E-COMMERCE SALES DATA ANALYSIS
-- Database: ecommerce_analysis
-- Dataset: UCI Online Retail
-- ============================================

USE ecommerce_analysis;


-- ============================================
-- 1. TOTAL SALES REVENUE
-- ============================================

SELECT
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales;


-- ============================================
-- 2. TOTAL ORDERS
-- ============================================

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales;


-- ============================================
-- 3. AVERAGE ORDER VALUE
-- ============================================

SELECT
    ROUND(SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
FROM sales;
-- ============================================
-- 4. TOP 10 PRODUCTS BY REVENUE
-- ============================================

SELECT
    Description,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ============================================
-- 5. TOP 10 COUNTRIES BY REVENUE
-- ============================================

SELECT
    Country,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ============================================
-- 6. MONTHLY REVENUE
-- ============================================

SELECT
    YearMonth,
    ROUND(SUM(TotalPrice), 2) AS Monthly_Revenue
FROM sales
GROUP BY YearMonth
ORDER BY YearMonth;
-- ============================================
-- 7. TOP 10 CUSTOMERS BY REVENUE
-- ============================================

SELECT
    CustomerID,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ============================================
-- 8. TOP 10 PRODUCTS BY QUANTITY SOLD
-- ============================================

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;


-- ============================================
-- 9. REVENUE BY DAY OF THE WEEK
-- ============================================

SELECT
    DayOfWeek,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY DayOfWeek
ORDER BY Total_Revenue DESC;
-- ============================================
-- 10. REVENUE BY HOUR
-- ============================================

SELECT
    Hour,
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM sales
GROUP BY Hour
ORDER BY Total_Revenue DESC;


-- ============================================
-- 11. CUSTOMER ORDER FREQUENCY
-- ============================================

SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 10;


-- ============================================
-- 12. CUSTOMER SPENDING SEGMENTATION
-- ============================================

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
-- ============================================
-- 13. TOTAL CANCELLED ORDERS
-- ============================================

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Cancelled_Orders
FROM all_transactions
WHERE InvoiceNo LIKE 'C%';


-- ============================================
-- 14. ORDER CANCELLATION RATE
-- ============================================

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


-- ============================================
-- 15. PRODUCT RETURNS ANALYSIS
-- ============================================

SELECT
    COUNT(*) AS Total_Return_Records,
    SUM(ABS(Quantity)) AS Total_Returned_Quantity
FROM all_transactions
WHERE Quantity < 0;


-- ============================================
-- 16. RETURNED TRANSACTION VALUE
-- ============================================

SELECT
    ROUND(ABS(SUM(Quantity * UnitPrice)), 2) AS Returned_Value
FROM all_transactions
WHERE Quantity < 0;
-- ============================================
-- 17. NET TRANSACTION REVENUE
-- ============================================

SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Net_Transaction_Revenue
FROM all_transactions;