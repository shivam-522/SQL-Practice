USE practice;

INSERT INTO employees(id,name,salary,department,age)
	VALUES
		(1,'Ramesh' ,10000,'BPO',   28  ),
		(2,   'Mahesh' ,5000,'HR',   29  ),
		(3,   'Umesh' ,20000,'BPO',   38  ),
		(4,   'Nahesh' ,30000,'SALES',   46  ),
		(5,   'Shivam' ,130000,'IT',   28  ),
		(6,   'Amit' ,70000,'HR',   75  ),
		(7,   'Aparana' ,100000,'HR',   49  ),
		(8,'Krishna',120000,'IT',27),
		(9,'Satyam',180000,'IT',35),
		(10,'Annanya',100000,'FINANCE',27),
		(11,'Ashutosh',80000,'FINANCE',29),
		(12,'Krishna',450000,'SALES',32),
		(13,'Vikash',750000,'BPO',30);
        
TRUNCATE TABLE employees;
#Show all employee details sorted by salary in ascending ordeR
SELECT * FROM employees
	ORDER BY salary ASC; 
    
#Show all employee details sorted by name in descending order.
SELECT * FROM employees
	ORDER BY name DESC;
    
#List top 3 highest paid employees.
SELECT * FROM employees
	ORDER BY salary DESC 
    LIMIT 3;
    
#List bottom 2 lowest paid employees.
SELECT * FROM employees
	ORDER BY salary ASC
    LIMIT 2;
    
#Show the youngest employee.
SELECT * FROM employees 
	ORDER BY age ASC
	LIMIT 1;
    
#Show the oldest employee.
SELECT * FROM employees
	ORDER BY age DESC
    LIMIT 1;

#Show the top 2 highest paid employees in IT department.
SELECT * FROM employees WHERE department='IT'
	ORDER BY salary DESC
    LIMIT 2;

#Show the employee(s) having 2nd highest salary.
SELECT * FROM employees
	WHERE salary=(
    SELECT DISTINCT salary 
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
    );
    
#Show the employee(s) having 2nd lowest salary.
SELECT * FROM employees
	WHERE salary=(
	SELECT DISTINCT salary FROM employees
    ORDER BY salary ASC
    LIMIT 1 OFFSET 1
	);    

#Show all employees sorted by department ascending and then by salary descending (within department).
SELECT * FROM employees
ORDER BY department ASC, salary DESC;

#Display names of top 3 youngest employees from Sales department.
SELECT name 
FROM employees
WHERE department = 'SALES'
ORDER BY age ASC
LIMIT 3;

#Display names of top 3 youngest employees from Sales department.
SELECT name 
FROM employees
WHERE department = 'SALES'
ORDER BY age ASC
LIMIT 3;

#Display details of employees excluding the highest paid employee.
SELECT * 
FROM employees
WHERE salary < (
    SELECT MAX(salary) FROM employees
);
