#Generate a report which contains the top 5 customers who received an
 #average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the
 #Indian  market. The final output contains these fields,
 #customer_code
 #customer
 #average_discount_percentage




SELECT pre.customer_code,d.customer, round(avg(pre.pre_invoice_discount_pct),4) as avg_dis_pct 
FROM fact_pre_invoice_deductions pre
LEFT JOIN dim_customer d
USING(customer_code)
WHERE fiscal_year="2021" and market="india"
GROUP BY customer_code, customer
ORDER BY avg_dis_pct desc
limit 5
