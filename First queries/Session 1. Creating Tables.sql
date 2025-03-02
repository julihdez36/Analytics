-- Before we can start inserting any information, before we can start querying for information, we actually have to create the physical tables inside of our database

-- firs we have to kno the different data types
-- int (whole numbers), decimal (m,n) [decimal numbers, exact value], varchar(100) [string of text of length 1], blob [binary larger object, stores large data], date ['yyyy-mm-dd'], timestamp ['yyyy-mm-dd hh:mm:ss']

CREATE TABLE student ( -- capital letters are optional, an convention
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
); 

-- Eqivalent way to define primary key

CREATE TABLE student ( -- capital letters are optional, an convention
    student_id INT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY(student_id)
); 

DESCRIBE student;

-- Delete and modify tables

DROP TABLE student;

-- add column
ALTER TABLE student ADD gpa DECIMAL(3,2);
-- drop specific columns
ALTER TABLE student DROP COLUMN gpa;

-- inserting data in our database table

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');

-- If we don't wanna include any information, we can specify the attributes 

INSERT INTO student(student_id, name) VALUES(3, 'Claire');

-- To show the information

SELECT * FROM student;

-- Let's complete a basic database table

-- Set up table in order to make ir easier for us ti insert elements 

DROP TABLE student;

CREATE TABLE student ( 
    student_id INT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE,
    PRIMARY KEY(student_id)
); 

INSERT INTO student VALUES(3, NULL, 'Chemistry'); -- It doesn't work, for our set up
INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(4, 'Mike', 'Biology'); -- similar problem

-----------------------------

DROP TABLE student;

CREATE TABLE student ( 
    student_id INT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY(student_id)
); 

INSERT INTO student(student_id, name) VALUES(1,'Jack');


DROP TABLE student;

CREATE TABLE student ( 
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY(student_id)
); 

INSERT INTO student(name, major) VALUES('Jack','Biology');
INSERT INTO student(name, major) VALUES('Kate', 'Sociology');





