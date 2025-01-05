# adhoc insight 1-Provide the list of markets in which customer  "Atliq  Exclusive"  operates its business in the  APAC  region.

SELECT distinct(market) FROM gdb023.dim_customer WHERE region="APAC" and customer="Atliq exclusive";