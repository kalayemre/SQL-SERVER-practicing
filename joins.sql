SELECT *
FROM hcm.employees;

SELECT *
FROM oes.products

SELECT *
FROM oes.warehouses;

SELECT *
FROM hcm.countries

SELECT *
FROM hcm.departments

SELECT *
FROM oes.products

SELECT *
FROM oes.product_categories

SELECT *
FROM oes.order_items






--Return employee details for all employees. Include the first and last name of each employee's manager in the query result.
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.manager_id,
	m.first_name as manager_first_name,
	m.last_name as manager_last_name
FROM hcm.employees e
LEFT JOIN hcm.employees m
ON e.manager_id = m.employee_id;


--Return all products at each warehouse:
SELECT 
	p.product_id,
	p.product_name,
	w.warehouse_id,
	w.warehouse_name,
	i.quantity_on_hand
FROM oes.products p
INNER JOIN oes.inventories i
ON p.product_id = i.product_id
INNER JOIN oes.warehouses w
ON w.warehouse_id = i.warehouse_id;


--Return employee details including department name and job title for all employees from Australia:
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name,
	j.job_title,
	e.state_province
FROM hcm.employees e
LEFT JOIN hcm.departments d
ON e.department_id = d.department_id
LEFT JOIN hcm.jobs j
ON e.job_id = j.job_id
LEFT JOIN hcm.countries c
ON e.country_id = c.country_id
WHERE c.country_name = 'Australia';




--Return the total quantity ordered of each product in each category. Order the results first by category name from A to Z and then by product_name from A to Z:
SELECT 
	pc.category_name,
	p.product_name,
	SUM(oi.quantity) as total_quantity_ordered
FROM oes.products p
JOIN oes.order_items oi
ON p.product_id = oi.product_id
JOIN oes.product_categories pc
ON pc.category_id = p.category_id
GROUP BY pc.category_name, p.product_name
ORDER BY pc.category_name, p.product_name;



--Return the total quantity ordered of each product in each category. Include products which have never been ordered. Set these to a total quantity ordered of 0. Order the results first by category name from A to Z and then by product_name from A to Z:
SELECT 
	pc.category_name,
	p.product_name,
	COALESCE(SUM(oi.quantity), 0) as total_quantity_ordered
FROM oes.products p
LEFT JOIN oes.order_items oi
ON p.product_id = oi.product_id
JOIN oes.product_categories pc
ON pc.category_id = p.category_id
GROUP BY pc.category_name, p.product_name
ORDER BY pc.category_name, p.product_name;


