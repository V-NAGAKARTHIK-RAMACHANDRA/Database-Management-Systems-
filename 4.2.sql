4.2 (A)Implementation of Data Control Language     
          commands – grant and revoke.   
     (B)Implementation of Transaction Control Language  
          commands - commit, save point, and rollback. 
 
(A)    DCL mainly has GRANT and REVOKE, which are used to control access rights and 
permissions on database objects. 
 
Data Control Language (DCL) in Oracle 
DCL commands in Oracle are used to control access to data and database objects. 
The two main commands are: 
• GRANT – To provide access rights. 
• REVOKE – To withdraw access rights. 
Step 1: DBA creates a user 
CREATE USER student_user IDENTIFIED BY password; 
GRANT CREATE SESSION TO student_user; 
 
Step 2: DBA grants object privileges 
GRANT SELECT, INSERT ON Students TO student_user; 
 
Step 3: student_user accesses Students table 
SELECT * FROM Students; 
INSERT INTO Students VALUES (101, 'John', 'CSE'); 
 
Step 4: DBA revokes privilege 
REVOKE INSERT ON Students FROM student_user; 
Now student_user can still SELECT, but cannot INSERT into Students. 
 
Date: Roll No. 
32 Database Management Systems Lab 

(B)Implementation of Transaction Control Language commands - commit, save point,  and 
rollback. 
 
Transaction Control Language (TCL) 
• TCL commands are used to manage transactions in a database. 
• A transaction is a sequence of SQL operations performed as a single logical unit of work. 
• TCL commands ensure data integrity and consistency. 
1. COMMIT 
• Commits (saves) all the changes made by a transaction permanently to the database. 
• After COMMIT, changes cannot be undone. 
Syntax: 
COMMIT; 
 
Example: 
INSERT INTO Students VALUES (101, 'Ravi', 'CSE'); 
 
INSERT INTO Students VALUES (102, 'Anita', 'ECE'); 
COMMIT;  -- permanently saves the above two insertions 
 
2. SAVEPOINT 
• Creates a checkpoint (marker) within a transaction. 
• Allows partial rollback to that point without affecting the entire transaction. 
• Multiple savepoints can be created in a single transaction. 
Syntax: 
SAVEPOINT savepoint_name; 
 
Example: 
INSERT INTO Students VALUES (103, 'Mahesh', 'IT'); 
SAVEPOINT sp1; 
 
INSERT INTO Students VALUES (104, 'Sita', 'EEE'); 
SAVEPOINT sp2; 
 
DELETE FROM Students WHERE StudentID = 101; 
Here, we created two savepoints (sp1 and sp2) that allow us to roll back specific parts of the transaction. 
 
3. ROLLBACK 
• Rolls back (undoes) all changes made in the current transaction (if no COMMIT has been issued). 
• Can also rollback partially to a specific SAVEPOINT. 
Syntax: 
ROLLBACK;     -- Undo all uncommitted changes 
ROLLBACK TO savepoint_name; -- Undo changes after the specified savepoint 
 
Example: 
ROLLBACK TO sp1;   -- undo operations done after savepoint sp1