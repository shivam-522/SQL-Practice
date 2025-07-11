SELECT * FROM practice.employees;

USE practice;

ALTER TABLE employees
ADD (department VARCHAR(100),age INT);

INSERT INTO employees(id,name,salary,department,age)
	VALUES(1,'Ramesh' ,10000,'BPO',   28  ),
    (2,   'Mahesh' ,5000,'HR',   29  ),
    (3,   'Umesh' ,20000,'BPO',   38  ),
    (4,   'Nahesh' ,30000,'SALES',   46  ),
    (5,   'Shivam' ,130000,'IT',   28  ),
    (6,   'Amit' ,70000,'HR',   75  ),
    (7,   'Aparana' ,100000,'HR',   49  );

SELECT * FROM employees;
TRUNCATE TABLE employees;

#Get all the employees that are in IT Department
SELECT * FROM employees WHERE department='IT';

# Show employees from HR department AND whose salary is more than 35000.
SELECT * FROM employees WHERE (department='HR' AND salary>35000);

#Show employees who are in HR OR age is less than 30.
SELECT * FROM employees WHERE department='HR' OR age<30;

SET SQL_SAFE_UPDATES=0;
UPDATE employees 
	SET department='FINANCE' WHERE id=3;
    
#Show all employees whose department is either HR or Finance.
SELECT * FROM employees WHERE department IN('HR','FINANCE');

# Show employees whose age is between 28 and 35.
SELECT * FROM employees WHERE age BETWEEN 22 AND 28;

#Show employees whose name starts with 'S'.
SELECT * FROM employees WHERE name LIKE 's%';

#Show employees whose name ends with 'a'.
SELECT * FROM employees WHERE name LIKE '%a';

# Show employees whose name contains ‘ee’ anywhere.
SELECT * FROM employees WHERE name LIKE '%ee%';



