-- 1. Create Tables. 
-- 2. Create Drop Tables if Existing. Use Cascade to include the alterations. 
-- 3. Copy the Data Over to the tables. 

DROP TABLE IF EXISTS employees CASCADE; 
DROP TABLE IF EXISTS departments CASCADE; 
DROP TABLE IF EXISTS dept_emp CASCADE; 
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;


-- Step 1 - Make Tables for Each  
-- Step 2 - Remember data types, primary keys, foreign keys, and constraints.
-- Step 3 - Import each CSV file into the corresponding SQL table.

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
   CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
	"birth_date" DATE NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" INT NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL--,
    --CONSTRAINT "pk_titles" PRIMARY KEY (
        --"emp_no"
     --)
);


----Copying Data into the Tables----
copy employees
FROM '/Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\employees.csv'
CSV HEADER; 
SELECT * FROM employees

COPY departments FROM '/Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\departments.csv'
CSV HEADER; 
SELECT * FROM departments; 

copy dept_emp
FROM '/Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\dept_emp.csv'
CSV HEADER; 
SELECT * FROM dept_emp;

copy dept_manager
FROM '/Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\dept_manager.csv'
CSV HEADER; 
SELECT * FROM dept_manager


copy salaries
FROM '/Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\salaries.csv'
CSV HEADER; 
SELECT * FROM salaries


copy titles
FROM '\Users\Melissa_2\Schoolwork UCB\sql-challenge\EmployeeSQL\data\titles.csv'
CSV HEADER; 
SELECT * FROM titles 

--List the details of each employee 
SELECT * FROM employees




ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
