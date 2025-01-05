SELECT *
FROM hcm.employees;

SELECT *
FROM oes.products

--Select employees from Seattle or Sydney:
SELECT *
FROM hcm.employees
WHERE city = 'Seattle' OR city = 'Sydney';

-- Select employees who live in any of the following cities, Seattle, Sydney, Ascot, Hillston:
SELECT *
FROM hcm.employees
WHERE city IN ('Seattle', 'Sydney', 'Ascot', 'Hillston');

-- Select employees from Sydney who have a salary greater than $200,000:
SELECT *
FROM hcm.employees
WHERE city = 'Sydney' AND salary > 200000;

-- Select employees who live in either Seattle or Sydney city and were hired on or after January 1st 2019:
SELECT *
FROM hcm.employees
WHERE (city = 'Seattle' OR city = 'Sydney') AND hire_date >= '20190101';



--Select products that are not categories 1, 2 or 5:
SELECT *
FROM oes.products
WHERE category_id NOT IN (1, 2, 5);
