-- 在 payments 表中，按日期和支付方式分组统计总付款额

USE sql_invoicing;

SELECT
	date,
    pm.name AS payment_method,
    SUM(amount) AS total_payment
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY date, payment_method
ORDER BY date