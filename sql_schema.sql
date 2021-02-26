CREATE TABLE IF NOT EXISTS Departments  (
dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Titles (
title_id VARCHAR(30) NOT NULL PRIMARY KEY,
title VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees(
emp_no INT NOT NULL PRIMARY KEY,
emp_title VARCHAR(30) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(30) NOT NULL,
hire_date DATE NOT NULL,
FOREIGN KEY(emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE IF NOT EXISTS Dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no)REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no)REFERENCES Departments(dept_no)
);

CREATE TABLE IF NOT EXISTS Salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE IF NOT EXISTS Dept_manager(
dept_no VARCHAR(30) NOT NULL,
emp_no INT NOT NULL,
FOREIGN KEY (dept_no)REFERENCES Departments(dept_no),
FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);