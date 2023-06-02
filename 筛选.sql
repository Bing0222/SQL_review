-- 在 sql_store 数据库（有顾客表、订单表、订单项目表等）中，找出在 'VA' 州且消费总额超过100美元的顾客（这是一个面试级的问题，还很常见）


USE sql_store;

SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c 
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE state = 'VA'
GrOUP BY 
	c.customer_id,
    c.first_name,
    c.last_name
HAVING total_sales > 100