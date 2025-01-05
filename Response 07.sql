 #Get the complete report of the Gross sales amount for the customer  “Atliq
 #Exclusive”  for each month  .  This analysis helps to  get an idea of low and
 #high-performing months and take strategic decisions.
 #The final report contains these columns:
 #Month
 #Year
 #Gross sales Amount 


SELECT concat(date_format(date, "%M"),"-", Year(date)) as Month,s.fiscal_year,  
round(sum(s.sold_quantity*p.gross_price),2) as gross_sales
FROM fact_sales_monthly s
LEFT JOIN dim_customer d
USING (customer_code)
LEFT JOIN fact_gross_price p
USING (product_code, fiscal_year)
WHERE d.customer="Atliq Exclusive"
GROUP BY Month, s.fiscal_year
ORDER BY fiscal_year;


