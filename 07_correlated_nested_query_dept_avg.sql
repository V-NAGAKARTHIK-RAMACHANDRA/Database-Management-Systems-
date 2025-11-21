-- Question 7: Correlated Nested Query - Employees Above Department Average
-- Write an SQL query to display the names of employees whose salary is greater 
-- than the average salary of their respective department. Use a correlated subquery 
-- to compare each employee's salary with their department's average.

-- Table:
-- employee(empid, name, deptid, salary)

-- Solution:
SELECT 
    e1.name,
    e1.deptid,
    e1.salary
FROM 
    employee e1
WHERE 
    e1.salary > (
        SELECT AVG(e2.salary)
        FROM employee e2
        WHERE e2.deptid = e1.deptid
    )
ORDER BY 
    e1.deptid, e1.salary DESC;

-- Explanation:
-- The inner query calculates the average salary for each department
-- The correlation happens through e2.deptid = e1.deptid
-- For each row in the outer query, the inner query is executed with that row's deptid
