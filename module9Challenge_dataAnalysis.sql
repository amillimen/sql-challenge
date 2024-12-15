--This script contains the query code to answer the questions in the module 9 challenge under 
--the Data analysis section




--Use join to List:
--the employee number(employees), last name(employees), first name(employees), sex(employees), and salary(salaries) of each employee (2 points)
--must join salaries and employees

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
Join salaries s
ON (e.emp_no = s.emp_no)


--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date between '1986/01/01' AND '1986/12/31/'




--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name

SELECT e.emp_no, e.emp_title, e.first_name, e.last_name, dm.dept_no, d.dept_name
FROM dept_manager as dm
INNER JOIN employees as e ON
dm.emp_no = e.emp_no
INNER JOIN departments as d ON
dm.dept_no = d.dept_no


--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name 
SELECT e.emp_no, e.emp_title, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no


--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'


--List each employee in the Sales department, including 
--their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'


--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) Use a select last_name and 
--count last names, then group by and order by the count
SELECT last_name, COUNT(emp_no) 
FROM employees
GROUP BY last_name 
ORDER by COUNT DESC;