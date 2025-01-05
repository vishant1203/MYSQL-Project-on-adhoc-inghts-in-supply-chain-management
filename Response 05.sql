#Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
 #product_code
 #product
 #manufacturing_cost 



SELECT f.product_code, d.product, f.manufacturing_cost 
FROM fact_manufacturing_cost f
LEFT JOIN dim_product d 
using(product_code)
WHERE manufacturing_cost in
((SELECT max(manufacturing_cost) FROM fact_manufacturing_cost),
(SELECT min(manufacturing_cost) FROM fact_manufacturing_cost))