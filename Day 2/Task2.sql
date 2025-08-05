CREATE DATABASE AttendanceDB;
USE AttendanceDB;
CREATE TABLE Stud (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Stud (name, email, department) VALUES
('sai', 'sai@example.com', 'CSE'),
('dhinesh', 'dhinesh@example.com', 'ECE'),
('meena', 'meena@example.com', 'IT'),
('gayu', 'gayu@example.com', 'CSE');
CREATE TABLE Faclty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faclty (name, email, department) VALUES
('kumaran', 'kumaran@example.com', 'CSE'),
('devi', 'devi@example.com', 'ECE'),
('sankari', 'sankari@example.com', 'EEE');
CREATE TABLE Coures (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Coures (course_name, faculty_id) VALUES
('Database', 1),
('Electronics', 2),
('Electrical Machines', 3);
CREATE TABLE studentAttendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
INSERT INTO studentAttendance  (student_id, course_id, date, status) VALUES
(1, 1, '2025-08-01', 'Present'),
(2, 2, '2025-08-01', 'Absent'),
(3, 1, '2025-08-01', 'Present'),
(4, 1, '2025-08-01', 'Absent'),

(1, 1, '2025-08-02', 'Present'),
(2, 2, '2025-08-02', 'Present'),
(3, 1, '2025-08-02', 'Absent'),
(4, 1, '2025-08-02', 'Present');
SELECT * FROM Stud;
SELECT * FROM faclty;
SELECT * FROM Coures;
SELECT * FROM studentAttendance;
UPDATE Faclty
SET email = 'devi_new@example.com'
WHERE faculty_id = 2;
SELECT * FROM Faclty;
UPDATE Student
SET department = 'AIML'
WHERE student_id = 3;
SELECT * FROM Student WHERE name = 'meena';
UPDATE studentAttendance
SET status = 'Present'
WHERE student_id = 2 AND date = '2025-08-01';
SELECT * FROM studentAttendance;
DELETE FROM Stud
WHERE student_id = 4;
DELETE FROM studentAttendance
WHERE attendance_id = 2;
SELECT * FROM studentAttendance;
DELETE FROM Coures
WHERE course_id = 2;
SELECT * FROM Coures;







