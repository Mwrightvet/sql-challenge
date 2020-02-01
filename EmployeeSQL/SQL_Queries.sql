-- Drop Tables if Existing

-- Step 1 - Make Searches with the objective in mind. Use the ERD to guide the Joins. 
-- Step 2 - Remember to include all requests in the select, and then join the tables needed
-- Step 3 - Remember to work foreward, backwards and foreward again. (Look at the plan and work backwards).

--1. List for each employee:  emp_no, last_name, first_name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries 
ON (employees.emp_no = salaries.emp_no);
	
--2. List employees who were hired in 1986.	

SELECT emp_no, first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN ('1986-01-01') AND ('1987-01-01');

--3. List the manager of each department with : dep_no, dep_name, emp_no, last_name, first_name, from_date and to_date.
-- do the joins first 
-- go backwards from dept_manager

SELECT employees.first_name, employees.last_name, dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, dept_manager.from_date, dept_manager.to_date 
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no 
JOIN employees ON employees.emp_no = dept_manager.emp_no 
ORDER BY dept_manager.from_date, departments.dept_name ASC;

--4. List employee with the following information: emp_no, last_name, first_name, and dep_name.
-- find  employees and then join the dept_emp and then join to the departments

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no

--5. List all employees WHERE first_name: "Hercules" and last_name begin with "B."
 
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6. List all emp in the Sales department:  emp_no, last_name, first_name, and dep_name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY departments.dept_name DESC

--8. **In descending order, list the frequency count of employee last_name, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name
FROM employees 
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


--9. ** BONUS 

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name, employees.hire_date
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no =  499942;