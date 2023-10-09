-- List the employee number, last name, first name, sex, and salary of each employee:

	-- Check data import:
SELECT * FROM Employees;

SELECT * FROM Salaries;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
	
	-- check data type:
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'employees';
	
	-- change data type to correct formats:
	
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-DD-YYYY');

ALTER TABLE employees ALTER COLUMN birth_date TYPE DATE 
using to_date(birth_date, 'MM-DD-YYYY');

ALTER TABLE employees ALTER COLUMN sex TYPE Boolean
USING CASE WHEN sex = 'F' THEN TRUE ELSE FALSE END;

	-- check data type:
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'employees';

SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT department_managers.emp_no, employees.first_name, employees.last_name, departments.dept_no, departments.dept_name
FROM
    department_managers
INNER JOIN
    employees 
ON department_managers.emp_no = employees.emp_no
INNER JOIN
    departments 
ON department_managers.dept_no = departments.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no, departments.dept_name, employees.first_name, employees.last_name, employees.emp_no
FROM
    departments
INNER JOIN
    department_employees
ON departments.dept_no = department_employees.dept_no
INNER JOIN
    employees
ON department_employees.emp_no = employees.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name LIKE 'B%' OR first_name = 'Hercules';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM 
	employees
INNER JOIN
	department_employees
ON employees.emp_no = department_employees.emp_no
INNER JOIN 
	departments
ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM 
	employees
INNER JOIN
	department_employees
ON employees.emp_no = department_employees.emp_no
INNER JOIN 
	departments
ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(emp_no) AS frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;
