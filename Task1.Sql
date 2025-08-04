CREATE DATABASE AttendanceDB;
USE AttendanceDB;
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Student (name, email, department) VALUES
('siva', 'siva@example.com', 'CSE'),
('yoga', 'yoga@example.com', 'ECE'),
('sai', 'sai@example.com', 'IT'),
('sanjee', 'sanjee.reddy@example.com', 'CSE');
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faculty (name, email, department) VALUES
('Dr. Suresh Menon', 'suresh.menon@example.com', 'CSE'),
('Prof. Anjali Rao', 'anjali.rao@example.com', 'ECE'),
('Dr. Neeraj Patel', 'neeraj.patel@example.com', 'EEE');
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Course (course_name, faculty_id) VALUES
('Data Structures', 1),
('Digital Electronics', 2),
('Electrical Machines', 3);
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

SELECT * FROM Student;
SELECT * FROM Attendance;
SELECT date, status 
FROM Attendance 
WHERE student_id = 1;
SELECT COUNT(*) FROM Student;







