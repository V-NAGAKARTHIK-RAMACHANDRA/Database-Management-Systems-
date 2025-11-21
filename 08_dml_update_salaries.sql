-- Question 8: DML - Updating Employee Salaries
-- Write SQL commands to increase the salary of all employees working in the IT 
-- department by 10%. After updating, write a query to display all employee details 
-- to verify the change.

-- Table:
-- employee(empid, name, dept, salary)

-- Solution:
-- Step 1: View current salaries in IT department (before update)
SELECT * FROM employee WHERE dept = 'IT';

-- Step 2: Update salaries in IT department by 10%
UPDATE employee
SET salary = salary * 1.10
WHERE dept = 'IT';

-- Step 3: Display all employee details to verify the change
SELECT * FROM employee;

-- Step 4: Display only IT department employees after update
SELECT * FROM employee WHERE dept = 'IT';

-- Alternative: Using CASE statement for conditional update
-- UPDATE employee
-- SET salary = CASE
--     WHEN dept = 'IT' THEN salary * 1.10
--     ELSE salary
-- END;
