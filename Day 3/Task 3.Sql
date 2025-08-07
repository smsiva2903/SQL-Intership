CREATE DATABASE IF NOT EXISTS AttendanceDB;
USE AttendanceDB;
DROP TABLE IF EXISTS Student;
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Student (name, email, department) VALUES
('meena', 'meena@example.com', 'CSE'),
('raji', 'raji@example.com', 'ECE'),
('kalai', 'kalai@example.com', 'IT'),
('moni', 'moni@example.com', 'CSE');
DROP TABLE Faculty;
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faculty (name, email, department) VALUES
('pooja', 'pooja@example.com', 'CSE'),
('ramu', 'ramu@example.com', 'ECE'),
('hari', 'hari@example.com', 'EEE');
DROP TABLE Course;
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
SELECT * FROM Attendance WHERE status = 'Absent';
SELECT * FROM Student WHERE department = 'CSE' AND name LIKE '%i';
SELECT * FROM Student WHERE department = 'CSE' OR department = 'ECE';
SELECT * FROM Student WHERE name LIKE 'r%';
SELECT * FROM Attendance WHERE date BETWEEN '2025-08-01' AND '2025-08-03';
SELECT * FROM Student ORDER BY name ASC;
SELECT * FROM Attendance ORDER BY date DESC;
SELECT name, department FROM Student;




