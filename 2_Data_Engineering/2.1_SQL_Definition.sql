-----------------------------------------------------------------------
-- DATA DEFINITION - SIX TABLES HAS BEEN DEFINED BELOW
-----------------------------------------------------------------------
-- Droping a table called titles if exists
DROP TABLE IF EXISTS titles;

-- 1. Creating a table called "titles"
CREATE TABLE titles (
			 title_id VARCHAR(10) PRIMARY KEY NOT NULL,
			 title VARCHAR(30) NOT NULL			 
);

SELECT * 
FROM titles

-----------------------------------------------------------------------
-- Droping a table called employees if exists
DROP TABLE IF EXISTS employees;

-- 2. Creating a table called "employees"
CREATE TABLE employees (
			 emp_no INT PRIMARY KEY NOT NULL,
			 emp_title_id VARCHAR(10) NOT NULL,
			 birth_date DATE  NOT NULL,
	    	 first_name VARCHAR(30) NOT NULL,
			 last_name VARCHAR(30) NOT NULL,
			 sex VARCHAR(1) NOT NULL,
			 hire_date DATE NOT NULL,
			 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * 
FROM employees
SET datestyle = mdy;
show datestyle


-----------------------------------------------------------------------
-- Droping a table called departments if exists
DROP TABLE IF EXISTS departments;

-- 3. Creating a table called "departments"
CREATE TABLE departments (
  			 dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
  			 dept_name VARCHAR(30) NOT NULL
);

SELECT * 
FROM departments

-----------------------------------------------------------------------
-- Droping a table called dept_managers if exists
DROP TABLE IF EXISTS dept_managers;

-- 4. Creating a table called "dept_managers"
CREATE TABLE dept_managers (
 			 dept_no VARCHAR (10) NOT NULL,
 			 emp_no INT NOT NULL,
			 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
			 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM dept_managers

-----------------------------------------------------------------------
-- Droping a table called employees if exists
DROP TABLE IF EXISTS dept_emp;

-- 3. Creating a table called "dept_emp"
CREATE TABLE dept_emp (
			 emp_no INT NOT NULL, 
		 	 dept_no VARCHAR(10) NOT NULL,
			 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    		 FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * 
FROM dept_emp

-----------------------------------------------------------------------
-- Droping a table called salaries if exists
DROP TABLE IF EXISTS salaries;

-- 5. Creating a table called "salaries"
CREATE TABLE salaries (
			 emp_no INT NOT NULL,
			 salary INT NOT NULL,
			 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM salaries

-----------------------------------------------------------------------



