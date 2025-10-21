
AIM:3.3 Implementation of Correlated sub-queries and 
Nested queries  
Description: 
Nested Queries 
A query within another SQL query and embedded within the WHERE clause.In Nested Query, 
Inner query runs first, and only once. Outer query is executed with result from Inner query. 
 
1) IN and NOT IN 
It tests whether a value is in a given set of elements  
Syntax:- 
Select column_names from table_name Where column_name IN/NOT IN (Select column_name 
from table_name Where condition); 
 
2) ALL and ANY 
It is used to compare a value to a list. It is preceded by comparison operator and followed by a 
list.  
Syntax:- 
Select column_name from table_name Where column_name comparison operator 
ALL/ANY(subquery); 
 
Correlated Sub query 
In Correlated sub query, a query is nested inside another query and an inner query uses values 
from the outer query. 
Syntax:- 
SELECT column_names FROM table_name WHERE EXISTS/NOT EXISTS (SELECT 
column_name FROM table_name WHERE condition); 
Find the names of sailors who have reserved boat no 103. 
select s.sname from sailors s where s.sid IN( select r.sid from reserves r where r.bid=103); 
 
SNAME 
Dustin 
Lubber 
Ravi 
Find the names of sailors who have not reserved boat no 103. 
select s.sname from sailors s where s.sid NOT IN( select r.sid from reserves r where r.bid=103); 
 
 
 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
21 
 
 
 
 
 
 
 
 
Find the sailor id with the highest rating 
select s.sid from sailors s where s.rating>=all(select s1.rating from sailors s1); 
 
SID 
71 
58 
Find the sailor id whose rating is better than some sailor called andy. 
select s.sid from sailors s where s.rating>ANY(select  
s1.rating from sailors s1 where s1.sname='Andy'); 
 
Correlated Sub query 
Find the names of sailors who have reserved boat no 103 
select s.sname from sailors s where EXISTS(select * from reserves r where s.sid=r.sid and 
r.bid=103); 
 
 
 
Find the names of sailors who have not reserved boat no 103 
select s.sname from sailors s where NOT EXISTS(select * from reserves r where s.sid=r.sid and 
r.bid=103); 