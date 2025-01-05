# Q3- Provide a report with all the unique product counts for each  segment  and  sort them in descending order of product counts. The final output contains  2 fields,  segment, product_count 




WITH CTE1 as (SELECT (SELECT count(distinct(product_code)) FROM fact_sales_monthly WHERE fiscal_year =2020) as unique_product_20, 
(SELECT count(distinct(product_code)) FROM fact_sales_monthly WHERE fiscal_year =2021) as unique_product_21
FROM fact_sales_monthly 
limit 1)

SELECT unique_product_20, unique_product_21, (unique_product_21-unique_product_20)*100/unique_product_20 as pct_chg
FROM CTE1 