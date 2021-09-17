--Create tables for PH-EmployeesDB-Challenge
--departments table
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

--Employee Table
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

--Dept Manager Table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--Salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

-- Create titles table
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title varchar NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);

-- Create dept_emp table 
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);

--Query the table
Select * From departments;


--Deliverable 1 - Retirement Titles
--Create a table with emp_no, first_name, last_name, title, to and from dates
Select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
	Into retirement_titles
	From employees as e
	Inner Join titles as t
	On (e.emp_no = t.emp_no)
	Where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	Order By e.emp_no Asc;

--check the table
Select * From retirement_titles;

--remove duplicate titles from table
Select Distinct On (rt.emp_no) rt.emp_no, 
	rt.first_name,
	rt.last_name,
	rt.title 
Into unique_titles
From retirement_titles as rt
Order By rt.emp_no Asc, rt.to_date Desc;

--check table
Select * From unique_titles;

--retrieve employees in most recent job about to retire
Select Count(ut.title), ut.title
Into retiring_titles
From unique_titles AS ut
Group By ut.title
Order By Count (ut.title) Desc;

--check table 
Select * From retiring_titles;

--Deliverable 2 Mentorship Eligibility
Select Distinct On (e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
	Into mentorship_eligibilty
	From employees as e
	Inner Join dept_emp as de
		On (e.emp_no = de.emp_no)
	Inner Join titles as t
		On (e.emp_no = t.emp_no)
	Where (birth_date Between '1965-01-01' And '1965-12-31')
	And (t.to_date = '9999-01-01')
	And (de.to_date = '9999-01-01')
	Order By e.emp_no Asc, de.from_date Desc;

--check table
Select * From mentorship_eligibilty;

--Deliverable 3 - additional queries
--mentee list by title
SELECT COUNT(me.emp_no), me.title
	Into mentees_by_title
	FROM mentorship_eligibilty AS me
	GROUP BY me.title
	ORDER BY COUNT(me.emp_no);

Select * From mentees_by_title;

--mentee list by department
Select Distinct On (e.emp_no) e.emp_no, 
		e.first_name, 
		e.last_name, 
		e.birth_date,
		de.from_date, 
		de.to_date, 
		t.title, 
		d.dept_name
	Into dept_mentees
	From employees as e
	Inner Join dept_emp as de
		On (e.emp_no = de.emp_no)
	Inner Join titles as t
		On (e.emp_no = t.emp_no)
	Inner Join departments as d
		On (de.dept_no = d.dept_no)
	Where (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
	Order By e.emp_no;

Select Count (md.emp_no), md.dept_name
	Into mentees_count
	From dept_mentees AS md
	Group By md.dept_name
	Order By Count (md.emp_no);

Select * From mentees_count;

--current eligible mentors 
Select Distinct On (e.emp_no)e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
Into unique_potential_mentors
From employees as e
Inner Join titles as t
On (e.emp_no = t.emp_no)
Where (e.birth_date Between '1957-01-01' And '1960-12-31')
And (t.from_date Between '1985-01-01' And '1985-12-31')
Order by e.emp_no Asc, t.from_date Desc;

Select * From unique_potential_mentors; 

--current eligible mentors by title
Select Count (upm.title), upm.title
	Into unique_potential_mentors_title
	From unique_potential_mentors As upm
	Group By upm.title
	Order By Count(upm.title) Desc;
	
Select * From unique_potential_mentors_title