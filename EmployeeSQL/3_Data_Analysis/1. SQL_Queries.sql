------------------------------------------------------------------------------
-- DATA MANUPILATION - MAKING QUERY (DATA ANALYSIS) 
------------------------------------------------------------------------------
--1. List the employee number, last name, first name, sex, and salary of each\
-- employee.
SELECT employees.emp_no, 
	   employees.last_name,
 	   employees.first_name,
	   employees.sex,
	   salaries.salary
	   
FROM employees
INNER JOIN salaries -- joining on common rows which is based on the same attribute
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

------------------------------------------------------------------------------
--2. List the first name, last name, and hire date for the employees who were\
-- hired in 1986.
SELECT * 
FROM employees
WHERE DATE_PART('year', hire_date) = 1986 -- DATE_PART is a function that extracts\ 
ORDER BY emp_no;									-- a subfield from a date value

------------------------------------------------------------------------------
-- 3. List the manager of each department along with their department number,\ 
-- department name, employee number, last name, and first name.   
SELECT dept_managers.dept_no, 
	   departments.dept_name,
	   dept_managers.emp_no, 
	   employees.last_name,
	   employees.first_name 
	   
FROM dept_managers 
INNER JOIN employees 
ON dept_managers.emp_no = employees.emp_no
INNER JOIN departments 
ON dept_managers.dept_no = departments.dept_no	
ORDER BY emp_no

------------------------------------------------------------------------------
--4.List the department number for each employee along with that employee’s \
-- employee number, last name, first name, and department name
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_emp.dept_no,
	   departments.dept_name
	   
FROM employees 
INNER JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
order by emp_no;

------------------------------------------------------------------------------
-- 5. List first name, last name, and sex of each employee whose first name \
-- is Hercules and whose last name begins with the letter "B"
SELECT * 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%' -- % provides any character\
													   -- that starts with B

------------------------------------------------------------------------------
-- 6. List each employee in the Sales department, including their \
-- employee number, last name, and first name.
SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   dept_emp.dept_no
	   
FROM employees 
INNER JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

------------------------------------------------------------------------------
-- 7. List each employee in the Sales and Development departments, \
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   dept_emp.dept_no
	   
FROM employees 
INNER JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

------------------------------------------------------------------------------
-- 8. List the frequency counts, in descending order, of all the employee\
-- last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency_counts -- COUNT(*) provides no of rows that 
FROM employees
GROUP BY last_name --  grouping by unique value 'last names'
ORDER BY frequency_counts DESC; -- provides last nmaes' count  in descending order
