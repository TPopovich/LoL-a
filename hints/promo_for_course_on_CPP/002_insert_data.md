## sql code to insert sample data

```
--insert into departments
INSERT INTO departments (dept_name) VALUES
('Engineering'), ('HR'), ('Marketing');

-- Insert into employees
INSERT INTO employees (emp_name, dept_id) VALUES
('Alice', 1),  -- Engineering
('Bob', 1),
('Carol', 2), -- HR
('Dave', NULL); -- No department

-- Insert into projects
INSERT INTO projects (proj_name, emp_id) VALUES
('Project Apollo', 1), -- Alice
('Project Zeus', 2),   -- Bob
('Project Hera', 3),   -- Carol
('Project Thor', NULL); -- No employee

```
