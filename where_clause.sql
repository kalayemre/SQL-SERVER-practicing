SELECT *
FROM oes.products

SELECT *
FROM oes.orders

--Select products from the oes.products table which havea price greater than $100.
SELECT *
FROM oes.products
WHERE list_price > 100;

--Select all orders from the oes.orders table which have not yet been shipped.
SELECT *
FROM oes.orders
WHERE shipped_date  IS NULL
ORDER BY order_date;

--Select all orders from the oes.orders table which were placed on the 26th of February 2020.
SELECT *
FROM oes.orders
WHERE order_date = '20200226';

--Select all orders from the oes.orders table which were placed on or after the 1st of January 2020.
SELECT *
FROM oes.orders
WHERE order_date > '20200101';