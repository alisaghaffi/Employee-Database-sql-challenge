 --1- List the following details of each employee: employee number, last name, first name, sex, and salary.
 
 select * from employees
 limit 10
 
 select * from salaries
 limit 10
    
/*SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex , salaries.emp_no ,salaries.salary 
FROM employees
inner JOIN salaries
ON employees.emp_no = salaries.emp_no ;
*/

create view details_of_employee_by_salary AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex , salaries.salary 
FROM employees
inner JOIN salaries
ON employees.emp_no = salaries.emp_no ;


select * from details_of_employee_by_salary
limit 10


-- ----------------------------------------------------------

--2- List first name, last name, and hire date for employees who were hired in 1986.

 
 select * from employees
 limit 10
 
		  
SELECT first_name, last_name, hire_date 
FROM employees
WHERE extract(year from hire_date) = 1986  

-- -----------------------------------------
--3- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no , departments.dept_name
FROM employees
inner JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no 
inner JOIN departments
ON  dept_manager.dept_no = departments.dept_no;

--4- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
inner JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no 
inner JOIN departments
ON  dept_emp.dept_no = departments.dept_no;


--5- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

		  
SELECT first_name, last_name, sex  
FROM employees
WHERE (first_name ='Hercules') and (last_name like 'B%') 


--6- List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- solution1 correct one!
create view List_of_department AS 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
inner JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no 
inner JOIN departments
ON  dept_emp.dept_no = departments.dept_no

 select * from List_of_department
 
select * 
from List_of_department
where dept_name ='Sales'


-- solution2 just for fun! 
SELECT emp_no, first_name, last_name, sex  
FROM employees
WHERE (emp_no IN(
	select emp_no 
    from dept_emp
	where dept_no IN(SELECT dept_no 
	FROM departments
    WHERE dept_name = 'Sales')
	)) or 
	emp_no IN(
	select emp_no 
    from dept_manager
	where dept_no IN(SELECT dept_no 
	FROM departments
    WHERE dept_name = 'Sales'));


--7- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select * 
from List_of_department
where (dept_name ='Sales') or (dept_name ='Development')
-- order by dept_name 

--8- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name Count" DESC;

-- Bonus (Optional)
/*
As you examine the data, you begin to suspect that the dataset is fake.
Maybe your boss gave you spurious data in order to test the data engineering skills of a new employee? 
To confirm your hunch, you decide to create a visualization of the data to present to your boss. Follow these steps:

Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas,
but you are, after all, trying to prove your technical mettle.) This step may require some research.
Feel free to use the following code to get started. 
Be sure to make any necessary modifications for your username, password, host, port, and database name:

from sqlalchemy import create_engine
engine = create_engine('postgresql://localhost:5432/<your_db_name>')

engine = create_engine('postgresql://user:password@localhost/EmployeeSQL')

connection = engine.connect()
Consult the SQLAlchemy documentation for more information.

If you’re using a password, do not upload your password to your GitHub repository.
Review this video and the GitHub website for more information.

1-Create a histogram to visualize the most common salary ranges for employees.

             use    details_of_employee_by_salary view

2-Create a bar chart of average salary by title.

             use below code : List_of_emp_salary_title

Submission
*/

select * from List_of_emp_salary_title

create view List_of_emp_salary_title AS 
SELECT employees.emp_no, salaries.salary, titles.title
FROM employees
inner JOIN salaries
ON employees.emp_no = salaries.emp_no 
inner JOIN titles
ON  employees.emp_title_id = titles.emp_title_id


select * from List_of_emp_salary_title




