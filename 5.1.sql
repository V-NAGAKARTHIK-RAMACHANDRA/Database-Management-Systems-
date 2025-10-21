
5.1. (A) Setup: Create database and sample table 
 
CREATE TABLE employees ( 
  emp_id INT, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50), 
  dept VARCHAR(50), 
  salary INT, 
  hired_date DATE, 
  PRIMARY KEY (emp_id) -- creates a primary index on emp_id 
) ENGINE=InnoDB; 
Expected output 
Query OK, 1 row affected (0.01 sec) 
Database changed 
Query OK, 0 rows affected (0.02 sec) 
Note: PRIMARY KEY (emp_id) creates a clustered primary index (InnoDB) on emp_id. 
 
(B). Creating a Secondary Index 
A secondary index is useful for fast lookups on non-primary-key columns. -- Create a non-unique (secondary) index on last_name 
 
CREATE INDEX idx_lastname ON employees(last_name); 
 -- Create a composite secondary index on (dept, salary) 
 
CREATE INDEX idx_dept_salary ON employees(dept, salary); 
Expected output 
Query OK, 0 rows affected (0.01 sec) 
Query OK, 0 rows affected (0.01 sec) 
To list indexes on a table: 
SHOW INDEX FROM employees; 