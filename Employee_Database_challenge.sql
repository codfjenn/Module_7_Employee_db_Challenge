-- Deliverable 1: Query to create Retirement Titles table
Select employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
Into retirement_data
from employees
inner join titles
on titles.emp_no = employees.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by employees.emp_no

-- Deliverable 1: Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO Unique_titles
FROM retirement_data
-- Deliverable 1: Dataset provided in course documentation included dates "9999-01-01" and the formating defaulted to "1999-01-01"
WHERE to_date = ('1999-01-01')
ORDER BY emp_no, from_date DESC;

-- Deliverable 1: Employees by role about to retire
Select count(emp_no), title
Into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc;

--Deliverable 2 Mentorship Eligibilty 
Select distinct on (employees.emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date, dept_emp.from_date, dept_emp.to_date, titles.title
Into mentorship_eligibilty
from employees
inner join dept_emp
on dept_emp.emp_no = employees.emp_no
inner join titles
on titles.emp_no = employees.emp_no

WHERE dept_emp.to_date = ('1999-01-01')
and (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no ASC;
