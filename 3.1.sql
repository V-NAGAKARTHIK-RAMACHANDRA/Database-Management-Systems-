ows of the right table and null for the remaining left table's columns. 
 
Syntax: 
SELECT column-name-list FROM table-name1 RIGHT OUTER JOIN table-name2 ON table
name1.column-name = table-name2.column-name; 
 
Natural join 
It is based on column having same name and same datatype present in both the tables to be joined.  
 
Syntax: 
SELECT * FROM table-name1 NATURAL JOIN table-name2; 
 
Date:  Roll No. 
Database Management Systems Lab 
          
14 
 
Cross join 
It will return a table which consists of records which combines each row from the first table 
with each row of the second table. 
Syntax:  select * from tablename1,tablename2; 
 
Self Join 
A self join is a join in which a table is joined with itself. 
 
EQUI Join 
An Equi Join in SQL is a type of join that combines rows from two or more tables based on a 
common column or set of columns, using only the equality operator (=) to compare the values 
in those columns. 
 
Syntax 
 
SELECT column-name-list FROM table1, table2.... WHERE table1.column_name 
=table2.column_name; 
Source Tables 
select *from tb1; 
RNO NAME MARKS 
503 Suma 40 
504 Raju 70 
505 Ramu 45 
501 Abhi 50 
502 Ravi 60 
select * from tb2; 
RNO FEE 
501 15000 
502 5000 
503 10000 
504 25000 
 
Inner Join 
select *from tb1 inner join tb2 on tb1.rno=tb2.rno; 
Or use the below query also 
select *from tb1 join tb2 on tb1.rno=tb2.rno; 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
15 
 
 
 
 
 
Left Outer Join 
 select * from tb1 left outer join tb2 on tb1.rno=tb2.rno; 
 
RNO NAME MARKS RNO FEE 
501 Abhi 50 501 15000 
502 Ravi 60 502 5000 
503 Suma 40 503 10000 
504 Raju 70 504 25000 
505 Ramu 45 - - 
 
 
Right outer join 
select * from tb1 right outer join tb2 on tb1.rno=tb2.rno; 
 
RNO NAME MARKS RNO FEE 
503 Suma 40 503 10000 
504 Raju 70 504 25000 
501 Abhi 50 501 15000 
502 Ravi 60 502 5000 
Natural join 
select *from tb1 natural join tb2; 
 
RNO NAME MARKS FEE 
503 Suma 40 10000 
504 Raju 70 25000 
501 Abhi 50 15000 
502 Ravi 60 5000 
 
Cross join 
select *from tb1 cross join tb2;         
or use the below query 
select * from tb1,tb2;  
RNO NAME MARKS RNO FEE 
503 Suma 40 503 10000 
504 Raju 70 504 25000 
501 Abhi 50 501 15000 
502 Ravi 60 502 5000 
 
Date:  Roll No. 
Database Management Systems Lab 
          
16 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
Self Join: 
select t1.rno, t2.name from tb1 t1,tb1 t2 where t1.rno=t2.rno; 
 
RNO NAME 
503 Suma 
504 Raju 
505 Ramu 
501 Abhi 
502 Ravi 
EQUI Join: 
select * from tb1,tb2 where tb1.rno=tb2.rno;