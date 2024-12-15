DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
	primary_key VARCHAR PRIMARY KEY,
	title VARCHAR	
	 
);

DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees(
	emp_no int PRIMARY KEY,
	emp_title VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
 
);

DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
 
);

DROP TABLE IF EXISTS dept_manager CASCADE;

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

DROP TABLE IF EXISTS dept_empo CASCADE;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);


DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	
);

