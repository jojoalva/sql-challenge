-- Create Departments table with primary key dept_no:

CREATE TABLE Departments (
    dept_no varchar(50)   NOT NULL,
    dept_name text   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

-- Create Departments and its Employees table:
CREATE TABLE Department_Employees (
    emp_no integer   NOT NULL,
    dept_no varchar(50)   NOT NULL
);

-- Create Departments and its Managers table:
CREATE TABLE Department_Managers (
    dept_no varchar(50)   NOT NULL,
    emp_no integer   NOT NULL
);

-- Create Employees table with primary key emp_no:
CREATE TABLE Employees (
    emp_no integer   NOT NULL,
    emp_title varchar(50)   NOT NULL,
    birth_date varchar(50) NOT NULL,
   	first_name text  NOT NULL,
    last_name text   NOT NULL,
    sex text   NOT NULL,
    hire_date varchar(50)   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

-- Create Salaries table:
CREATE TABLE Salaries (
    emp_no integer   NOT NULL,
    salary integer   NOT NULL
);

-- Create Titles table with primary key title_id:

CREATE TABLE Titles (
    title_id varchar(50)   NOT NULL,
    title text   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

-- Link foreign keys to their primary keys:

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title FOREIGN KEY(emp_title)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);