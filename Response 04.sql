# adhoc request 4- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,  segment, product_count_2020, product_count_2021, difference

WITH T1 as 
(SELECT d.segment, count(distinct(s.product_code)) as product_qty20 FROM fact_sales_monthly s
LEFT JOIN dim_product d
using(product_code)
WHERE fiscal_year=2020 
GROUP BY segment),

T2 as (SELECT d.segment, count(distinct(s.product_code)) as product_qty21 FROM fact_sales_monthly s
LEFT JOIN dim_product d
using(product_code)
WHERE fiscal_year=2021
GROUP BY segment)

SELECT T1.segment, T1.product_qty20, T2.product_qty21, 
round((T2.product_qty21-T1.product_qty20)*100/(T1.product_qty20),2) as pct_chg
FROM T1
LEFT JOIN T2
USING(segment)
ORDER BY pct_chg






