## sql code to create sample tables

```
-- Table 1: departments
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Table 2: employees
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT REFERENCES departments(dept_id)
);

-- Table 3: projects
CREATE TABLE projects (
    proj_id SERIAL PRIMARY KEY,
    proj_name VARCHAR(100),
    emp_id INT REFERENCES employees(emp_id)
);

-- This will allow departments x employees x projects query
-- The one table has a FK (foreign key) emp_id will point back to table employees
-- so data inserts need to make sure there is an employee with the given emp_id
```
