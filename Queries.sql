--1 EMPLOYEE INFORMATION
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e INNER JOIN salaries s
ON e.emp_no = s.emp_no;

--2 SPECIFIC HIRE YEAR
-- Extract function taken from https://www.sqltutorial.org/sql-date-functions/how-to-extract-year-from-date-in-sql/
select first_name, last_name, EXTRACT(YEAR FROM hire_date) "Hire Year"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3  DEPARMENT MANAGER INFORMATION
select DM.dept_no,D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM Dept_manager as DM
	INNER JOIN Departments as D on DM.dept_no = D.dept_no
	INNER JOIN Employees as E on DM.emp_no = E.emp_no;


--4	EMPLOYEES DEPARTMENT
select DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp as DE
	INNER JOIN Employees as E on DE.emp_no = E.emp_no
	INNER JOIN Departments as D on DE.dept_no = D.dept_no;

--5  SPECIFIC NAME
select first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--6 SALES DEPARTMENT
select E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees as E
	INNER JOIN Dept_emp as DE on E.emp_no = DE.emp_no
	INNER JOIN Departments as D on DE.dept_no = D.dept_no
	WHERE D.dept_name = 'Sales';

--7 SAKES OR DEVELOPMENT
select E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees as E
	INNER JOIN Dept_emp as DE on E.emp_no = DE.emp_no
	INNER JOIN Departments as D on DE.dept_no = D.dept_no
	WHERE D.dept_name = 'Sales' or D.dept_name = 'Development';
	
--8	LAST NAME COUNT
select last_name, count(last_name) as name_count
FROM Employees
GROUP BY last_name
ORDER BY name_count DESC;