SELECT *
FROM hcm.employees;

SELECT *
FROM oes.inventories;

SELECT *
FROM bird.antarctic_populations;

--Write query to give the total number of employees in each department as given by the department_id column in the hcm.employees table.
SELECT department_id,
	   COUNT(employee_id)
FROM hcm.employees
GROUP BY department_id;

--Write a query to give the average salary in each department as given by the department_id column in the hcm.employees table. Order the query result by average salary from highest to lowest.
SELECT department_id,
	   ROUND(AVG(salary),0) AS avg_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY avg_salary DESC;
--Write a query to give the total number of products on hand at each warehouse as given by the warehouse_id column in the oes.inventories table. Also, limit the result to only warehouses which have greater than 5,000 product items on hand.
SELECT warehouse_id,
	   SUM(quantity_on_hand) AS total_products_on_hand
FROM oes.inventories
GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000;

--What is the date of the most recent population count at each locality in the bird.antarctic_populations table?
SELECT locality, 
	   MAX(date_of_count) AS date_of_recent_pop_count
FROM bird.antarctic_populations
GROUP BY locality;

--What is the date of the most recent population count for each species at each locality in the bird.antarctic_populations table?
SELECT locality, 
	   species_id,
	   MAX(date_of_count) AS date_of_recent_pop_count
FROM bird.antarctic_populations
GROUP BY locality, species_id;