-- Question 1: Department Average Salary
-- Write an SQL query to display each department's name along with the average salary 
-- of employees working in that department. Round the average salary to the nearest 
-- integer and sort the result by the department name in ascending order.

-- Tables:
-- employee(empid, name, deptid, salary)
-- department(deptid, deptname)

-- Solution:
SELECT 
    d.deptname,
    ROUND(AVG(e.salary)) AS avg_salary
FROM 
    department d
INNER JOIN 
    employee e ON d.deptid = e.deptid
GROUP BY 
    d.deptname
ORDER BY 
    d.deptname ASC;
