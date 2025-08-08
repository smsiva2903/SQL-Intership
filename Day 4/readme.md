#  Attendance Management System (SQL Project)

This project demonstrates a simple **Attendance Management System** using **MySQL**. It includes database creation, table design, data insertion, and practical SQL queries with `SUM()`, `COUNT()`, `AVG()`, `GROUP BY`, and `HAVING` clauses.

---

##  Database Name

---

##  Tables

1. **Student**
2. **Faculty**
3. **Course**
4. **Attendance**

---

##  Table Structure

###  `Student`
| Column       | Data Type     | Description         |
|--------------|---------------|---------------------|
| student_id   | INT (PK)      | Auto Increment ID   |
| name         | VARCHAR(100)  | Student Name        |
| email        | VARCHAR(100)  | Student Email       |
| department   | VARCHAR(50)   | Department Name     |

---

###  `Faculty`
| Column       | Data Type     | Description         |
|--------------|---------------|---------------------|
| faculty_id   | INT (PK)      | Auto Increment ID   |
| name         | VARCHAR(100)  | Faculty Name        |
| email        | VARCHAR(100)  | Faculty Email       |
| department   | VARCHAR(50)   | Department Name     |

---

###  `Course`
| Column       | Data Type     | Description           |
|--------------|---------------|-----------------------|
| course_id    | INT (PK)      | Auto Increment ID     |
| course_name  | VARCHAR(100)  | Course Title          |
| faculty_id   | INT (FK)      | Linked to `Faculty`   |

---

###  `Attendance`
| Column         | Data Type         | Description               |
|----------------|-------------------|---------------------------|
| attendance_id  | INT (PK)          | Auto Increment ID         |
| student_id     | INT (FK)          | Linked to `Student`       |
| course_id      | INT (FK)          | Linked to `Course`        |
| date           | DATE              | Attendance Date           |
| status         | ENUM('Present','Absent') | Attendance Status |

---

##  Sample Data Inserted

- 4 students
- 3 faculty members
- 3 courses
- 8 attendance records across 2 dates

---

##  Sample Queries Used

###  Aggregate Queries
```sql
SELECT COUNT(*) AS total_attendance_records FROM Attendance;
SELECT SUM(status = 'Present') AS total_present_days FROM Attendance;
SELECT AVG(student_id) AS average_student_id FROM Attendance;

###  Grouping Queries
SELECT student_id, COUNT(*) AS total_classes FROM Attendance GROUP BY student_id;
SELECT student_id, SUM(status = 'Present') AS total_present FROM Attendance GROUP BY student_id;
SELECT student_id, AVG(status = 'Present') * 100 AS avg_attendance_percent FROM Attendance GROUP BY student_id;

###   Group Filtering with HAVING
SELECT student_id, SUM(status = 'Present') AS total_present 
FROM Attendance 
GROUP BY student_id 
HAVING total_present > 1;

SELECT student_id, AVG(status = 'Present') * 100 AS avg_attendance 
FROM Attendance 
GROUP BY student_id 
HAVING avg_attendance < 75;

SELECT date, COUNT(*) AS present_count 
FROM Attendance 
WHERE status = 'Present' 
GROUP BY date 
HAVING present_count > 2;




