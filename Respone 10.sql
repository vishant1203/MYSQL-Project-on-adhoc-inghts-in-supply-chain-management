 #Get the Top 3 products in each division that have a high
 #total_sold_quantity in the fiscal_year 2021? The final output contains these 
 #fields,
 #division
 #product_code
#product
#total_sold_quantity
 #rank_order





WITH CTE1 AS (SELECT f.product_code, p.product, sum(f.sold_quantity) as total_qty, p.division
FROM fact_sales_monthly f
LEFT JOIN dim_product p
USING (product_code)
WHERE f.fiscal_year=2021
GROUP BY product_code, product, p.division
ORDER BY sum(f.sold_quantity) desc
),
CTE2 as (SELECT  *, Dense_rank() over(partition by division order by total_qty desc) as rnk 
FROM CTE1 )

SELECT * FROM CTE2 WHERE rnk<=3


