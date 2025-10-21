5. 2. Retrieve Data Using an Index (and verify with EXPLAIN) 
Insert some sample rows first: 
INSERT INTO employees (first_name, last_name, dept, salary, hired_date) VALUES 
('Alice','Kumar','R&D',80000,'2020-03-15'), 
('Bob','Sharma','Sales',60000,'2019-08-01'), 
('Carol','Kumar','R&D',85000,'2021-02-10'), 
('Dave','Patel','Marketing',55000,'2018-11-20'), 
('Eve','Sharma','Sales',62000,'2022-01-05'); 
Expected output 
Query OK, 5 rows affected (0.01 sec) 
Records: 5  Duplicates: 0  Warnings: 0 
Now query using an indexed column last_name: 
EXPLAIN SELECT * FROM employees WHERE last_name = 'Sharma'; 
SELECT * FROM employees WHERE last_name = 'Sharma';