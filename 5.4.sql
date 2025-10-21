(A)  How DELETE Affects Indexes 
 
DELETE FROM employees WHERE emp_id = 4; -- delete Dave 
Expected output 
Query OK, 1 row affected (0.01 sec) 
What happens 
• The row is removed from the clustered storage (PRIMARY index). 
• All secondary index entries that referenced that row are also removed automatically. 
• Indexes remain present, but their cardinality/statistics change.

(B). Dropping and Rebuilding Indexes 
 -- Drop a secondary index 
DROP INDEX idx_lastname ON employees; 
 -- Recreate if needed 
CREATE INDEX idx_lastname ON employees(last_name); 
Expected output 
Query OK, 0 rows affected (0.01 sec) 
Query OK, 0 rows affected (0.01 sec) 
If you need to rebuild all indexes on a MySQL table: 
ALTER TABLE employees ENGINE=InnoDB; -- forces rebuild