-- Format the datestyle for the database to Month/Day/Year
ALTER DATABASE "Pewlett Hackard (sql-challenge)" SET datestyle TO "ISO, MDY";

-- Create the tables starting with tables that have primary keys used as foreign keys in other tables:

-- Create the Titles table first (otherwise an error occurs)
CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255)
);

-- Create the Employees table second (otherwise an error occurs)
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title VARCHAR(255) REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex VARCHAR(1),
    hire_date DATE
);

-- Create the Departments table
CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(255)
);

-- Create the Salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
    salary INT
);

-- Create the Department Employees table
CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(50) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Create the Department Managers table
CREATE TABLE dept_manager (
    dept_no VARCHAR(50) REFERENCES departments(dept_no),
    emp_no INT REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);