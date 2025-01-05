 #In which quarter of 2020, got the maximum total_sold_quantity? The final
 #output contains these fields sorted by the total_sold_quantity,
 #Quarter
 #total_sold_quantity 

SELECT concat(date_format(date, "%M"),"-", Year(date)) as Month,
CASE
WHEN MONTH(s.date) in (9,10,11) THEN "Q1"
WHEN MONTH(s.date) in (12,1,2) THEN "Q2"
WHEN MONTH(s.date) in (3,4,5) THEN "Q3"
WHEN MONTH(s.date) in (6,7,8) THEN "Q4"
END as QTR,
round(sum(s.sold_quantity)/1000000,2) as Total_sold_qty
FROM fact_sales_monthly s
WHERE s.fiscal_year="2020"
GROUP BY Month, QTR, fiscal_year
ORDER BY fiscal_year;


