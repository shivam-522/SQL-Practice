CREATE DATABASE practice;

USE practice;
CREATE TABLE Employees(
	id INT,
    name VARCHAR(50),
    salary DOUBLE
    );
    
    INSERT INTO Employees(id,name,salary)
		VALUES(2,'Aman',70000);
        
SELECT * FROM Employees;

SET SQL_SAFE_UPDATES=0;
UPDATE Employees SET 
	salary=90000 
    WHERE name='Aman';
    
DELETE FROM Employees where id=1;