INSERT INTO employees (first_name, last_name, dept, salary, hired_date) 
VALUES ('Frank','Kumar','R&D',78000,'2024-07-01'); 
Expected output 
Query OK, 1 row affected (0.01 sec) 
What happens under the hood 
• The row is inserted into the clustered table (InnoDB) according to emp_id (PRIMARY KEY). 
• Secondary index entries (idx_lastname, idx_dept_salary) are also inserted/updated 
automatically to include pointers to the new row. 
• Index maintenance is automatic — no manual rebuild required for normal inserts. 
Expected rows: Alice, Carol, Frank. 
 
(B) How UPDATE Affects Indexes 
Case A: Updating a non-indexed column (e.g., salary when salary is not indexed alone) — index 
impact is minimal. 
UPDATE employees SET salary = salary + 2000 WHERE last_name = 'Sharma'; 
Expected output 
Query OK, 2 rows affected (0.01 sec) 
Rows matched: 2  Changed: 2  Warnings: 0 
• Only the table rows change; secondary index entries remain unchanged if indexed columns are 
not modified. 
Case B: Updating an indexed column (e.g., last_name) — index entries must be updated. 
UPDATE employees SET last_name = 'Sharma-Old' WHERE emp_id = 2; 
Expected output 
Query OK, 1 row affected (0.01 sec) 
Rows matched: 1  Changed: 1  Warnings: 0 
• The DB locates the row (via primary key / clustered index), updates the row, deletes the old 
secondary index entry for last_name='Sharma' and inserts a new index entry for 
last_name='Sharma-Old'. 
• This causes more I/O than updating a non-indexed column.