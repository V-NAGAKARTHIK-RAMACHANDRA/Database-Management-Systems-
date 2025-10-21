AIM: 3.2 Perform Set Operations-Union, Intersection, Set 
Difference Description: 
Set Operators 
1) UNION is used to combine the results of two or more SELECT statements. 
It will -eliminate duplicate rows from its resultset. 
Syntax:- 
SELECT column_name FROM table1 
UNION 
SELECT column_name FROM table2; 
 
2) UNION ALL This is similar to Union. But it also shows the duplicate rows.  
Syntax:- 
SELECT column_name FROM table1 
UNION ALL 
SELECT column_name FROM table2; 
 
3) Intersect operation is used to combine two SELECT statements, but it only retuns 
the records which are common from both SELECT statements. 
Syntax:- 
SELECT column_name FROM table1 
INTERSECT 
SELECT column_name FROM table2; 
 
4) The Minus operation combines results of two SELECT statements and return 
only those in the final result, which belongs to the first set of the result. 
Syntax:- 
SELECT column_name FROM table1  
MINUS 
SELECT column_name FROM table2; 
 
INTERSECT and EXCEPT are not natively supported in MySQL but can be implemented 
using JOIN or NOT EXISTS techniques. 
 
Intersect operation in mysql 
SELECT column1, column2 FROM table1 INNER JOIN table2 USING (column1, column2); 
 
Minus operation in mysql 
SELECT column1, column2 FROM table1 LEFT JOIN table2 USING (column1, column2) 
WHERE table2.column1 IS NULL; 
 
 
 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
18 
Source Tables  
Sailors Table 
 
 
 
 
 
 
 
 
 
Boats Table 
 
Reserves Table 
 
 
 
 
 
 
 
 
Find the names of sailors who have reserved a red or a green boat 
select s.sname from sailors s, reserves r,boats b where s.sid=r.sid and b.bid=r.bid and 
b.bcolor='Red'  
UNION  
select s1.sname from sailors s1,reserves r1,boats b1 where s1.sid=r1.sid and r1.bid=b1.bid and 
b1.bcolor='Green'; 