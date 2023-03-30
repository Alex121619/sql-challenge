-----------------------------------------------------------------------
-- DATA DEFINITION - SIX TABLES HAS BEEN DEFINED BELOW
-----------------------------------------------------------------------
-- Droping a table called departments if exists
DROP TABLE IF EXISTS departments;

-- 1. Creating a table called "departments"
CREATE TABLE departments (
  			dept_no VARCHAR(10) PRIMARY KEY,
  			dept_name VARCHAR(30)
);

SELECT * 
FROM departments

-----------------------------------------------------------------------
-- Droping a table called employees if exists
DROP TABLE IF EXISTS dept_emp;

-- 2. Creating a table called "dept_emp"
CREATE TABLE dept_emp (
			 emp_no INT NOT NULL,
		 	 dept_no VARCHAR(10) NOT NULL,
			 from_date DATE NOT NULL,
			 to_date DATE NOT NULL,
    		 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
   		 	 FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * 
FROM dept_emp

-----------------------------------------------------------------------
-- Droping a table called dept_managers if exists
DROP TABLE IF EXISTS dept_managers;

-- 3. Creating a table called "dept_managers"
CREATE TABLE dept_managers (
 			 dept_no VARCHAR (10),
 			 emp_no INT,
 			 from_date DATE NOT NULL,
 			 to_date DATE NOT NULL,
 			 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
 			 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM dept_managers

-----------------------------------------------------------------------
-- Droping a table called employees if exists
DROP TABLE IF EXISTS employees;

-- 4. Creating a table called "employees"
CREATE TABLE employees (
			 emp_no INT PRIMARY KEY,
			 birth_date DATE,
			 first_name VARCHAR(20),
			 last_name VARCHAR(20),
			 gender VARCHAR(2),
			 hire_date DATE
);

SELECT * 
FROM employees

-----------------------------------------------------------------------
-- Droping a table called salaries if exists
DROP TABLE IF EXISTS salaries;

-- 5. Creating a table called "salaries"
CREATE TABLE salaries (
			 emp_no BIGINT NOT NULL,
			 salary BIGINT NOT NULL,
			 from_date DATE NOT NULL,
			 to_date DATE NOT NULL,
			FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM salaries

-----------------------------------------------------------------------
-- Droping a table called titles if exists
DROP TABLE IF EXISTS titles;

-- 6. Creating a table called "titles"
CREATE TABLE titles (
			 emp_no INT NOT NULL,
			 title VARCHAR(20) NOT NULL,
			 from_date DATE NOT NULL,
			 to_date DATE NOT NULL,
			 FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM titles

-----------------------------------------------------------------------