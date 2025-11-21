-- Question 6: Nested Query - Highest Paid Employee
-- Write an SQL query to find the employees who earn the highest salary in the company. 
-- Use a nested subquery to find the maximum salary first and then retrieve 
-- corresponding employee names.

-- Table:
-- employee(empid, name, salary)

-- Solution:
SELECT 
    name,
    salary
FROM 
    employee
WHERE 
    salary = (SELECT MAX(salary) FROM employee);

-- Alternative: Using ORDER BY and LIMIT (works on MySQL, PostgreSQL)
-- SELECT 
--     name,
--     salary
-- FROM 
--     employee
-- ORDER BY 
--     salary DESC
-- LIMIT 1;

-- Alternative: Using TOP (works on SQL Server)
-- SELECT TOP 1
--     name,
--     salary
-- FROM 
--     employee
-- ORDER BY 
--     salary DESC;
