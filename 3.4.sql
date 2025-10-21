 3.4 Creating and Querying views and Materialized 
views. 
 Description: 
View 
A view is a logical table based on the result set of an SQL Statement. A view contains rows 
and columns, just like a table. The fields in a view are fields from one or more base tables in 
the database. We can apply all DDL and DML statements on views. 
Syntax: 
Create or replace force/noforce view viewname as Select column_list from table_list 
Where condition with read only|check option 
Dropping a view  
syntax:  
Drop view viewname; 
Source Table 
 
ROLLNO NAME MARKS 
501 jyothi 90 
502 sai 95 
504 yamuna 70 
505 padma 60 
503 ravi 80 
Creating View 
create view my_view as select rollno, name from source_table; 
view created 
Display Views and Tables in your login 
select * from tab; 
 
 
 
 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
23 
Inserting a row in view 
insert into myview values(506,'prathisha');  
1 row(s) inserted 
 
Display view 
select * from myview; 
 
ROLLNO NAME 
501 jyothi 
502 sai 
506 prathisha 
504 yamuna 
505 padma 
503 ravi 
 
Displaying Table 
select * from st1; 
 
ROLLNO NAME MARKS 
501 jyothi 90 
502 sai 95 
506 prathisha - 
504 yamuna 70 
505 padma 60 
503 ravi 80 
Deleting a row in a view 
delete from myview where rollno=506; 1 
row(s) deleted 
 
Display view 
select * from myview; 
 
ROLLNO NAME 
501 jyothi 
502 sai 
504 yamuna 
505 padma 
503 ravi 
 
Date:  Roll No. 
Database Management Systems Lab 
          
24 
Displaying Table 
select * from st1; 
 
ROLLNO NAME MARKS 
501 jyothi 90 
502 sai 95 
504 yamuna 70 
505 padma 60 
503 ravi 80 
Change the Structure of the View 
create or replace view myview as select * from st1; view 
created. 
Creating View when base table doesn’t exist 
create or replace force view abc as select * from dummy_table; 
Warning: View created with compilation errors. 
Creating Read only view 
create view myview1 as select * from st1 with read only; 
view created 
Inserting Data in Read only view 
insert into myview1 values(503,'prathisha',80); 
MYSQL-01733: virtual column not allowed here 
update myview1 set name='suma' where 
rollno=505; MYSQL-01733: virtual column not 
allowed here  
Displaying view 
select * from myview1; 
 
ROLLNO NAME MARKS 
501 jyothi 90 
502 sai 95 
504 yamuna 70 
505 padma 60 
503 ravi 80 
 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
25 
Creating View with check option 
create view myview2 as select * from st1 where marks<101 with check option;  
view created. 
Inserting a row into view 
insert into myview2 values(504,'siri',101); 
MYSQL-01402: view WITH CHECK OPTION where-clause violation  
Dropping view 
Drop View myview1;  
View dropped. 
 
Complex view:  
Creating a view from multiple tables 
In this example will create a view named MarksView by taking data from both the table’s student 
details and student marks 
To create a View from multiple tables just simply include multiple tables in the SELECT 
statement 
Table1: 
ROLLNO NAME MARKS 
501 jyothi 90 
502 sai 95 
504 yamuna 70 
505 padma 60 
503 ravi 80 
 
Table2: 
 
 
 
Date:  Roll No. 
Database Management Systems Lab 
          
26 
 
Creating Complex View 
create view myview as select rollno, name, sid, bib from Table1, Table2; view created 
Display Views and Tables in your login 
select * from Table1, Table2; 
Change the Structure of the View 
create or replace view myview as select * from Table1,Table2;  
view created. 
Dropping a view 
syntax: 
Drop view viewname; 
 
Generally, DML operations (INSERT, UPDATE, DELETE) are not allowed on complex 
view.