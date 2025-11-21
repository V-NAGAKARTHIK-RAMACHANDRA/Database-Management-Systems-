-- Question 4: Views - High Salary Employees View
-- Create a view named highsalary that contains the names and salaries of employees 
-- earning more than 4000. Then, write a query to display all records from this view.

-- Table:
-- employee(empid, name, salary)

-- Solution:
-- Step 1: Create the view
CREATE VIEW highsalary AS
SELECT 
    name,
    salary
FROM 
    employee
WHERE 
    salary > 4000;

-- Step 2: Query the view to display all records
SELECT * FROM highsalary;

-- Optional: To drop the view if needed
-- DROP VIEW highsalary;
