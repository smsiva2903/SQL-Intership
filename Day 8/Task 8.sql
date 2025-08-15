CREATE DATABASE IF NOT EXISTS AttendanceDB;
USE AttendanceDB;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Student;
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Student (name, email, department) VALUES
('janani', 'janani@example.com', 'CSE'),
('sanjee', 'sanjee@example.com', 'ECE'),
('ramya', 'ramya@example.com', 'IT'),
('mathi', 'mathi@example.com', 'CSE');
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faculty (name, email, department) VALUES
('surya', 'surya@example.com', 'CSE'),
('hari', 'hari@example.com', 'ECE'),
('prabhu', 'prabhu@example.com', 'EEE');
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Course (course_name, faculty_id) VALUES
('python', 1),
('Electronics', 2),
('software engineering', 3);
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
INSERT INTO Attendance (student_id, course_id, date, status) VALUES
(1, 1, '2025-08-01', 'Present'),
(2, 2, '2025-08-01', 'Absent'),
(3, 1, '2025-08-01', 'Present'),
(4, 1, '2025-08-01', 'Absent'),
(1, 1, '2025-08-02', 'Present'),
(2, 2, '2025-08-02', 'Present'),
(3, 1, '2025-08-02', 'Absent'),
(4, 1, '2025-08-02', 'Present');
CREATE OR REPLACE VIEW View_AttendanceByStudent AS
SELECT s.name AS student_name, c.course_name, a.date, a.status
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Course c ON a.course_id = c.course_id;
SELECT * FROM View_AttendanceByStudent 
WHERE student_name = 'janani';
CREATE OR REPLACE VIEW View_StudentPresentCount AS
SELECT student_id, COUNT(*) AS total_present
FROM Attendance
WHERE status = 'Present'
GROUP BY student_id;
SELECT * FROM View_StudentPresentCount WHERE student_id = 1;
CREATE OR REPLACE VIEW View_AttendancePercentage AS
SELECT student_id,
       ROUND((SUM(status = 'Present') / COUNT(*)) * 100, 2) AS attendance_percentage
FROM Attendance
GROUP BY student_id;
SELECT * FROM View_AttendancePercentage;
CREATE OR REPLACE VIEW View_StudentFaculty AS
SELECT DISTINCT s.student_id, s.name AS student_name, f.name AS faculty_name
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Course c ON a.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;
SELECT * FROM View_StudentFaculty WHERE student_id = 1;






