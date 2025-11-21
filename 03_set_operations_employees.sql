-- Question 3: Set Operations - Employees in One Department but Not Another
-- Write an SQL query to find the names of employees who work in the HR department 
-- but not in the IT department. Use appropriate set operations (e.g., EXCEPT or MINUS) 
-- to produce the result.

-- Table:
-- employee(empid, name, dept)

-- Solution (using EXCEPT - for PostgreSQL, SQL Server):
SELECT name
FROM employee
WHERE dept = 'HR'
EXCEPT
SELECT name
FROM employee
WHERE dept = 'IT';

-- Alternative Solution (using MINUS - for Oracle):
-- SELECT name
-- FROM employee
-- WHERE dept = 'HR'
-- MINUS
-- SELECT name
-- FROM employee
-- WHERE dept = 'IT';

-- Alternative Solution (using NOT IN - works on all databases):
-- SELECT name
-- FROM employee
-- WHERE dept = 'HR'
--   AND name NOT IN (
--     SELECT name
--     FROM employee
--     WHERE dept = 'IT'
--   );
