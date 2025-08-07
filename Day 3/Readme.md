## SQL Developer Internship – Task 3: Basic SELECT Queries

##  Objective

This task demonstrates the use of basic SELECT queries on an Attendance Management System database. It focuses on:

- Retrieving all or specific columns
- Applying filters using WHERE, AND, OR, LIKE, BETWEEN
- Sorting data using ORDER BY

---

##  Tools Used

- MySQL Workbench
- SQL (DDL & DML)

---

##  Tables Used

- Student
- Faculty
- Course
- Attendance

These tables are linked through foreign key constraints and used for running select queries.

---

##  Queries Demonstrated

###  Select All and Specific Columns

```sql
SELECT * FROM Student;
SELECT name, department FROM Student;

###  WHERE, AND, OR, LIKE, BETWEEN

SELECT * FROM Attendance WHERE status = 'Absent';
SELECT * FROM Student WHERE department = 'CSE' AND name LIKE '%i';
SELECT * FROM Student WHERE department = 'CSE' OR department = 'ECE';
SELECT * FROM Student WHERE name LIKE 'r%';
SELECT * FROM Attendance WHERE date BETWEEN '2025-08-01' AND '2025-08-03';

###  ORDER BY
SELECT * FROM Student ORDER BY name ASC;
SELECT * FROM Attendance ORDER BY date DESC;