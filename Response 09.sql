#Which channel helped to bring more gross sales in the fiscal year 2021
 #and the percentage of contribution?  The final output  contains these fields,
 #channel
 #gross_sales_mln
 #percentage 



with CTE1 as (SELECT (sum(f.sold_quantity*p.gross_price)/1000000) as Gross_sales_MM, d.channel 
FROM fact_sales_monthly f
LEFT JOIN dim_customer d
using(customer_code)
LEFT JOIN fact_gross_price p
USING(product_code, fiscal_year)
where f.fiscal_year=2021
GROUP BY channel)

SELECT  Round(Gross_sales_MM,2) as gross_sales_MM1, channel, Round(Gross_sales_MM*100/sum(Gross_sales_MM) OVER(),2) as pct_cont
FROM CTE1
order by pct_cont desc
