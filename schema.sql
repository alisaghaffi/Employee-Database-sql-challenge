--DROP TABLE IF EXISTS TABLENAME;

CREATE TABLE titles (
    emp_title_id character varying PRIMARY KEY,
    title character varying(250)
  );
  
  select * from titles  
  
CREATE TABLE employees (
      emp_no int PRIMARY KEY,
	  emp_title_id character varying ,
	  birth_date date,
	  first_name character varying(50), 
	  last_name character varying(50),
	  sex character varying(1),
	  hire_date date,
	  foreign key (emp_title_id) REFERENCES titles(emp_title_id)
  );
  
  select * from employees

CREATE TABLE salaries (
    emp_no int,
    salary int,
	foreign key (emp_no) REFERENCES employees(emp_no)
  );

  select * from salaries 
 

CREATE TABLE departments
(
    dept_no character varying PRIMARY KEY,
    dept_name character varying(50)
  
);

  select * from departments

CREATE TABLE dept_emp (
	emp_no int ,
    dept_no character varying,
	foreign key (emp_no) REFERENCES employees(emp_no),
	foreign key (dept_no) REFERENCES departments(dept_no)
  );

  select * from dept_emp

 CREATE TABLE dept_manager (
    dept_no character varying,
    emp_no int ,
 	foreign key (emp_no) REFERENCES employees(emp_no),
	foreign key (dept_no) REFERENCES departments(dept_no)
  );
  
  select * from dept_manager 
  
 

  

  
   

  
  
  
  