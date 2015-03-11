                                             RDBMS-ASSIGNMENT


DATABASE NAME:my_database

TABLE CREATION WITH CONSTRAINTS:10 TABLES


1.MariaDB [my_database]> CREATE TABLE student_details(admission_number integer not null,name varchar(15) not null,fathers_name varchar(15) not null,mothers_name varchar(15) not null,phone_number integer not null,gender varchar(5) not null,blood_group varchar(10) not null,PRIMARY KEY(admission_number));
Query OK, 0 rows affected (0.32 sec)

2.MariaDB [my_database]> CREATE TABLE  student_officialdetails(admission_number integer not null,roll_number varchar(5) not null,class integer not null,section varchar(2) not null,amount integer not null,fees varchar(5) not null,PRIMARY KEY(roll_number),FOREIGN KEY(admission_number) REFERENCES student_details(admission_number));
Query OK, 0 rows affected (0.14 sec)

3.MariaDB [my_database]> CREATE TABLE  student_markdetails(roll_number varchar(5) not null,Tamil integer(3),English integer(3),Maths integer(3),Science integer(3),Socialscience integer(3),physics integer(3),chemistry integer(3),computer_science integer(3),biology integer(3),Total integer(4),Rank integer(3),FOREIGN KEY(roll_number) REFERENCES student_officialdetails(roll_number));
Query OK, 0 rows affected (0.16 sec)

4.MariaDB [my_database]> CREATE TABLE  student_attendencedetails(roll_number varchar(5) not null,total_workingdays integer(3) not null,number_of_days_present integer(3) not null,percentage varchar(5) not null,FOREIGN KEY(roll_number) REFERENCES student_markdetails(roll_number));  
Query OK, 0 rows affected (0.19 sec)

5.MariaDB [my_database]> CREATE TABLE  student_awarddetails(roll_number varchar(5) not null,subject varchar(10) not null,award_type varchar(15) not null,FOREIGN KEY(roll_number) REFERENCES student_markdetails(roll_number));
Query OK, 0 rows affected (0.09 sec)

6.MariaDB [my_database]> CREATE TABLE staff_details(staff_id varchar(5) not null,name varchar(15) not null,father_name varchar(15) not null,mother_name varchar(15) not null,phone_number integer(10) not null,gender varchar(5) not null,blood_group varchar(5) not null,address varchar(15) not null,PRIMARY KEY(staff_id)); 
Query OK, 0 rows affected (0.43 sec)

7.MariaDB [my_database]> CREATE TABLE staff_officialdetails(staff_id varchar(5) not null,salary varchar(10) not null,doj date,qualification varchar(10) not null,FOREIGN KEY(staff_id) REFERENCES staff_details(staff_id));
Query OK, 0 rows affected (0.46 sec)

8.MariaDB [my_database]> CREATE TABLE staff_subject(staff_id varchar(5) not null,subject_handling varchar(25) not null,class varchar(25) not null,FOREIGN KEY(staff_id) REFERENCES staff_officialdetails(staff_id));
Query OK, 0 rows affected (0.15 sec)

9.MariaDB [my_database]> CREATE TABLE library(book_id varchar(5) not null,book_name varchar(15) not null,Available varchar(6) not null,PRIMARY KEY(book_id));
Query OK, 0 rows affected (0.04 sec)

10.MariaDB [my_database]> CREATE TABLE bus_details(bus_no varchar(5) not null,route_name varchar(15) not null,driver_name varchar(15) not null,PRIMARY KEY(bus_no));
Query OK, 0 rows affected (0.11 sec)

QUERIES:

INSERT QUERY:

MariaDB [my_database]> INSERT INTO student_details values('1001','Abi.G','Ganesh.K','Kavi.G','9876453210','female',' o+','pollachi');
Query OK, 1 row affected, 2 warnings (0.04 sec)

SELECT QUERY:

MariaDB [my_database]> SELECT admission_number,name,fathers_name,mothers_name,phone_number,gender,blood_group,address from student_details;
+------------------+----------+--------------+--------------+--------------+--------+-------------+------------+
| admission_number | name     | fathers_name | mothers_name | phone_number | gender | blood_group | address    |
+------------------+----------+--------------+--------------+--------------+--------+-------------+------------+
|             1001 | Abi.G    | Ganesh.K     | Kavi.G       |   2147483647 | femal  |  o+         | pollachi   |
|             1002 | Banu.R   | Ramesh.K     | Kavitha.R    |   9847483647 | femal  |  AB+        | pollachi   |
|             1003 | Chitra.K | Kumar.K      | Rani.K       |   8147483647 | femal  | B+          | coimbatore |
|             1004 | Ajay.R   | Ravi.S       | Ragavi.R     |   9997483647 | male   | AB+         | Pollachi   |
|             1005 | Dharun.P | Pravin.B     | Devi.P       |   7947483647 | male   | AB-         | Tirupur    |
+------------------+----------+--------------+--------------+--------------+--------+-------------+------------+
5 rows in set (0.00 sec)


ALTER QUERY:ADD

ALTER TABLE student_details ADD address varchar(15);
Query OK, 0 rows affected (0.36 sec) 

ALTER QUERY:MODIFY

MariaDB [my_database]> ALTER TABLE student_officialdetails MODIFY class varchar(5);
Query OK, 0 rows affected (0.13 sec)               
Records: 0  Duplicates: 0  Warnings: 0


UPDATE QUERY:

MariaDB [my_database]> UPDATE student_attendencedetails SET year='2014-2015';
Query OK, 5 rows affected (0.04 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [my_database]> SELECT roll_number,total_workingdays,number_of_days_present,percentage,year from student_attendencedetails;
+-------------+-------------------+------------------------+------------+-----------+
| roll_number | total_workingdays | number_of_days_present | percentage | year      |
+-------------+-------------------+------------------------+------------+-----------+
| I01         |               250 |                    220 | 80%        | 2014-2015 |
| III08       |               250 |                    249 | 99%        | 2014-2015 |
| X19         |               250 |                    245 | 97%        | 2014-2015 |
| XI10        |               250 |                    240 | 92%        | 2014-2015 |
| XII09       |               250 |                    250 | 100%       | 2014-2015 |
+-------------+-------------------+------------------------+------------+-----------+
5 rows in set (0.00 sec)

DESC QUERY:

MariaDB [my_database]> DESC student_markdetails;
+------------------+------------+------+-----+---------+-------+
| Field            | Type       | Null | Key | Default | Extra |
+------------------+------------+------+-----+---------+-------+
| roll_number      | varchar(5) | NO   | MUL | NULL    |       |
| Tamil            | int(3)     | YES  |     | NULL    |       |
| English          | int(3)     | YES  |     | NULL    |       |
| Maths            | int(3)     | YES  |     | NULL    |       |
| Science          | int(3)     | YES  |     | NULL    |       |
| Socialscience    | int(3)     | YES  |     | NULL    |       |
| physics          | int(3)     | YES  |     | NULL    |       |
| chemistry        | int(3)     | YES  |     | NULL    |       |
| computer_science | int(3)     | YES  |     | NULL    |       |
| biology          | int(3)     | YES  |     | NULL    |       |
| Total            | int(4)     | YES  |     | NULL    |       |
| Rank             | int(3)     | YES  |     | NULL    |       |
+------------------+------------+------+-----+---------+-------+
12 rows in set (0.00 sec)

DROP QUERY:

MariaDB [my_database]>  DROP table  library;
Query OK, 0 rows affected (0.03 sec)

DROP QUERY:FOR COLUMN

MariaDB [my_database]> ALTER TABLE staff_details DROP COLUMN phone_number;
Query OK, 5 rows affected (0.36 sec)               
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [my_database]> SELECT * from staff_details;
+----------+------------+-------------+-------------+--------+-------------+------------+------------+
| staff_id | name       | father_name | mother_name | gender | blood_group | address    | dob        |
+----------+------------+-------------+-------------+--------+-------------+------------+------------+
| s01      | kavitha.G  | Ganesh.k    | Lavaniya.G  | female | O+          | pollachi   | 1987-02-03 |
| s02      | Surya.K    | Kumar.k     | Lakshmi.K   | female | O-          | coimbatore | 1987-02-03 |
| s03      | Suganaya.S | Suresh.L    | Vani.S      | female | O-          | coimbatore | 1982-04-06 |
| s04      | Bala.B     | Muthu.B     | Kani.B      | male   | AB+         | Madurai    | 1981-02-04 |
| s05      | Tamilan.K  | Kalai.T     | Kaviya.K    | male   | O+          | Dindukal   | 1988-01-05 |
+----------+------------+-------------+-------------+--------+-------------+------------+------------+
5 rows in set (0.00 sec)


VIEW QUERY:

MariaDB [my_database]> CREATE VIEW mark1 AS SELECT Total from student_markdetails where Total<500;
Query OK, 0 rows affected (0.13 sec)

DISTINCT QUERY:

MariaDB [my_database]> SELECT DISTINCT book_id from library where Available='yes';
+---------+
| book_id |
+---------+
| b01     |
| b02     |
| b05     |
+---------+
3 rows in set (0.02 sec)

AND OPERATOR:

MariaDB [my_database]> SELECT bus_no from bus_details where route_name='pollachi' AND driver_name='suresh';
+--------+
| bus_no |
+--------+
| 4      |
+--------+
1 row in set (0.00 sec)

BETWEEN QUERY:

MariaDB [my_database]> SELECT driver_name from bus_details where bus_no BETWEEN 2 AND 4;
+-------------+
| driver_name |
+-------------+
| ravi        |
| ramesh      |
| suresh      |
+-------------+
3 rows in set (0.00 sec)

MAX:

MariaDB [my_database]> SELECT max(staff_id) from staff_details;
+---------------+
| max(staff_id) |
+---------------+
| s05           |
+---------------+
1 row in set (0.00 sec)

COUNT:

MariaDB [my_database]> SELECT COUNT(book_name) from library;
+------------------+
| COUNT(book_name) |
+------------------+
|                5 |
+------------------+
1 row in set (0.00 sec)


GROUP BY AND HAVING QUERY:

MariaDB [my_database]> SELECT staff_id,salary from staff_officialdetails GROUP BY staff_id HAVING  salary < 15000; 
+----------+--------+
| staff_id | salary |
+----------+--------+
| s01      | 10000  |
| s02      | 11000  |
| s03      | 11000  |
+----------+--------+
3 rows in set (0.06 sec)


JOINS:

MariaDB [my_database]> SELECT student_details.admission_number,student_details.name,student_details.address,student_officialdetails.roll_number,student_officialdetails.class FROM student_details INNER JOIN student_officialdetails ON student_details.admission_number=student_officialdetails.admission_number;
+------------------+----------+------------+-------------+-------------+
| admission_number | name     | address    | roll_number | class       |
+------------------+----------+------------+-------------+-------------+
|             1001 | Abi.G    | pollachi   | I01         | 1-standard  |
|             1003 | Chitra.K | coimbatore | III08       | 3-standard  |
|             1005 | Dharun.P | Tirupur    | X19         | 10-standard |
|             1002 | Banu.R   | pollachi   | XI10        | 11-standard |
|             1004 | Ajay.R   | Pollachi   | XII09       | 12-standard |
+------------------+----------+------------+-------------+-------------+
5 rows in set (0.00 sec)


TRIGGER:

MariaDB [my_database]> CREATE TRIGGER marks BEFORE UPDATE ON student_markdetails FOR EACH ROW SET @avg=(NEW.Tamil+NEW.English+NEW.Maths+NEW.Science+NEW.Socialscience)/5;
Query OK, 0 rows affected (0.02 sec)

MariaDB [my_database]> UPDATE  student_markdetails SET Maths=100 where roll_number='I01';
Query OK, 0 rows affected (0.10 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [my_database]> SELECT * from student_markdetails;
+-------------+-------+---------+-------+---------+---------------+---------+-----------+------------------+---------+-------+------+
| roll_number | Tamil | English | Maths | Science | Socialscience | physics | chemistry | computer_science | biology | Total | Rank |
+-------------+-------+---------+-------+---------+---------------+---------+-----------+------------------+---------+-------+------+
| I01         |    90 |      85 |   100 |      80 |            85 |       0 |         0 |                0 |       0 |   440 |    3 |
| III08       |    90 |      85 |   100 |      80 |           100 |       0 |         0 |                0 |       0 |   455 |    1 |
| x19         |    90 |      65 |    72 |      80 |            78 |       0 |         0 |                0 |       0 |   385 |    8 |
| xI10        |   171 |     172 |   172 |       0 |             0 |     180 |       165 |              163 |       0 |  1023 |   12 |
| xII09       |   175 |     179 |   182 |       0 |             0 |     180 |       183 |              193 |       0 |  1092 |    2 |
+-------------+-------+---------+-------+---------+---------------+---------+-----------+------------------+---------+-------+------+
5 rows in set (0.00 sec)

MariaDB [my_database]> select @avg as marks;
+--------------+
| marks        |
+--------------+
| 88.000000000 |
+--------------+
1 row in set (0.00 sec)


