# E-Commerce Sales Data Analysis

## Project Overview
This project focuses on analyzing e-commerce sales data to identify sales trends, top-performing products, customer purchasing behavior, and revenue patterns.

The analysis uses Python and SQL to clean, process, and explore retail transaction data. Data visualizations are created to present meaningful business insights.

## Tools & Technologies
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- MySQL
- Jupyter Notebook

## Dataset
- Dataset: Online Retail Dataset
- Source: UCI Machine Learning Repository
- Records: 541,909 transactions
- Columns: 8

## Project Structure
```text
E-Commerce Sales Data Analysis/
│
├── data/
│   ├── online_retail.xlsx..xlsx
│   
│   
│
├── notebooks/
│   └── ECommerce_Sales_Analysis.ipynb
│
├── sql/
│   └── ecommerce_sales_analysis.sql
│  └── ecommerce_analysis.sql
│
│
└── README.md
```

## Data Cleaning
- Removed duplicate records.
- Handled missing product descriptions.
- Identified cancelled transactions.
- Separated completed sales from returns and cancelled transactions.
- Created a TotalPrice column.

## Python Analysis
- Total revenue analysis
- Monthly revenue trends
- Top products by revenue and quantity
- Country-wise sales analysis
- Customer purchase frequency
- Customer spending segmentation
- Order cancellation analysis
- Product returns analysis

## SQL Analysis
Performed 17 SQL queries, including:
- Total sales revenue
- Average order value
- Top products and customers
- Monthly revenue
- Revenue by country
- Customer segmentation
- Order cancellation rate
- Product returns analysis

## Data Visualizations
Created six visualizations:
1. Top 10 Products by Revenue
2. Monthly Revenue Trend
3. Top 10 Countries by Revenue
4. Revenue by Day of Week
5. Customer Spending Segmentation
6. Revenue by Hour of the Day

## Key Findings
- Completed sales revenue: £10,642,110.80
- Total completed orders: 19,960
- Average order value: £533.17
- November 2011 recorded the highest monthly revenue.
- The United Kingdom generated the highest revenue.
- Thursday recorded the highest revenue by day of the week.
- 3,836 unique orders were cancelled.

## Conclusion
This project demonstrates practical skills in data cleaning, exploratory data analysis, SQL querying, and data visualization. The findings provide insights into sales performance, customer behavior, and business trends.


The cleaned datasets are generated during the notebook execution and are not included in this repository because of their large file sizes.