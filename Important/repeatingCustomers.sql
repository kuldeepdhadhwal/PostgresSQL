WITH customer_first_order  AS (Select customer_id, min(order_date)  as first_order from customer_orders group by customer_id),

 new_customers AS ( Select cust.order_date, count(cust.order_date) as cust_orders from customer_orders cust

left join customer_first_order cf

  on cust.customer_id = cf.customer_id
where cust.order_date = cf.first_order
Group by cust.order_date),



 total_customer_each_day AS (Select order_date, count(1) as total_count from customer_orders group by order_date)

Select n.order_date, n.cust_orders as new_customers, (e.total_count - n.cust_orders) as repeat_customers from new_customers as n
inner join total_customer_each_day e
on n.order_date = e.order_date;


+------------+----------------+---------------------+
| order_date | new_cust_count | returning_customers |
+------------+----------------+---------------------+
| 2022-01-01 |              3 |                   0 |
| 2022-01-02 |              2 |                   1 |
| 2022-01-03 |              1 |                   2 |
+------------+----------------+---------------------+
