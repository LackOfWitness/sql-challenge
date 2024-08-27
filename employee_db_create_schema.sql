-------------------------------------------------
-- Drop all the TABLES

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

-------------------------------------------------

-- Drop table if needed 
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(50),
    PRIMARY KEY (title_id)
);

-- Run query to check import of data
SELECT * FROM titles LIMIT 10;

-------------------------------------------------

-- Drop table if needed 
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40),
    PRIMARY KEY (dept_no)
);

-- Run query to check import of data
SELECT * FROM departments LIMIT 10;

-------------------------------------------------

-- Drop table if needed
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    hire_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) ON DELETE CASCADE
);

-- Run query to check import of data
SELECT * FROM employees LIMIT 10;

-------------------------------------------------

-- Drop table if needed
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Run query to check import of data
SELECT * FROM salaries LIMIT 10;

-------------------------------------------------

-- Drop table if needed
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE 
);

-- Run query to check import of data
SELECT * FROM dept_manager LIMIT 10;

-------------------------------------------------

-- Drop table if needed
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Run query to check import of data
SELECT * FROM dept_emp LIMIT 10;

