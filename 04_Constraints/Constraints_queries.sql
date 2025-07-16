USE practice;

/*Q1. Composite Primary Key
Question:
Create a StudentCourse table that stores student enrollments. Ensure that a student can enroll in a course only once. Use a composite primary key.

Expected:

Table should have: student_id, course_id, enroll_date

A student can't enroll in the same course twice.*/

CREATE TABLE StudentCourse(
student_id INT,
course_id INT,
enroll_date INT,
PRIMARY KEY (student_id,course_id)
);


/*
Q2. FOREIGN KEY Constraint Violation
Question:
Given:
sql
Copy
Edit
CREATE TABLE Departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);
Now, write an insert query for the Employees table where the dept_id violates the foreign key constraint.
*/
CREATE TABLE Departments(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
    );
DROP TABLE Employees;
CREATE TABLE Employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(5),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
   );
    
INSERT INTO Employees VALUES (1, 'John', 999);

/*
🔹 Q3. DEFAULT + CHECK Combo
Question:
Create a Payments table with:

payment_id (Primary key)

amount (must be greater than 0)

status with default value "Pending"

Write the create table SQL and insert a row where you don’t give status.
*/
CREATE TABLE Payments(
	payment_id INT PRIMARY KEY,
    amount INT CHECK (amount>0),
    status VARCHAR(50) DEFAULT 'pending'
    );
    
INSERT INTO Payments (payment_id,amount) VALUES(102,2000);
SELECT * FROM Payments;

/*
Q4. UNIQUE Violation
Question:
Create a Users table with a unique email column. Try inserting two users with the same email.
Show the queries and the error.
*/
CREATE TABLE Student(
	roll_no INT,
    email VARCHAR (50) UNIQUE
    );
    INSERT INTO Student (roll_no,email)
		VALUES(1,'shivam@email.com'),
			   (2,'shivam@email.com');
               
/*
 Q5. FOREIGN KEY with ON DELETE CASCADE
Question:
Create a Customer and Orders table, where if a customer is deleted, all their orders should also get deleted.

Hint: Use FOREIGN KEY ... ON DELETE CASCADE
If we delete customer order associated to it will automatically deleted
*/

CREATE TABLE Customer (
		customer_id INT PRIMARY KEY,
        customer_name VARCHAR(50)
        );
        
CREATE TABLE Orderss(
		order_id INT PRIMARY KEY,
        order_date DATE,
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
        );
        
INSERT INTO Customer (customer_id,customer_name)
		VALUES(101,'Shivam'),
				(102,'Amit');
INSERT INTO Orderss(order_id,order_date,customer_id)
		VALUES(201,'2025-07-07',101),
			   (202,'2025-06-25',102);
DELETE FROM Customer WHERE customer_id=102;
SELECT * FROM Customer;
SELECT * FROM Orderss;

/*
Q6. Violating NOT NULL Constraint
Question:
Create a table Employees where emp_name is NOT NULL. Try inserting a row with emp_name = NULL.
What happens?
*/

CREATE TABLE employees(
		emp_id INT,
        emp_name VARCHAR(50) NOT NULL
        );
INSERT INTO employees
		VALUES(102);
        
/*
 Q7. CHECK Constraint Logical Use
Question:
Create a Voting table:
voter_id, age
Age must be >= 18 AND <= 120
Now try inserting age = 14 and age = 130.
*/
CREATE TABLE Voting (
    voter_id INT PRIMARY KEY,
    age INT CHECK (age >= 18 AND age <= 120)
);
INSERT INTO Voting (voter_id, age)
VALUES (1, 30); 

INSERT INTO Voting (voter_id, age)
VALUES (2, 14);  

/*
 Q8. Primary Key Auto Increment with DEFAULT column
Question:
Create a Feedback table:
id should auto-increment
rating should default to 5 if not provided
Show insert without rating
*/
CREATE TABLE Feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating INT DEFAULT 5
);
INSERT INTO Feedback () VALUES ();
INSERT INTO Feedback (rating) values(6);
SELECT * FROM Feedback;

/*
9. Combination of Multiple Constraints
Question:
Create a BankAccounts table with following rules:
acc_no: primary key
email: unique
balance: must be > 500
account_type: default is "Savings"
name: not null
Insert a valid and an invalid record for testing.
*/
CREATE TABLE BankAccounts (
    acc_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    balance DECIMAL(10,2) CHECK (balance > 500),
    account_type VARCHAR(20) DEFAULT 'Savings'
);
INSERT INTO BankAccounts (acc_no, name, email, balance)
VALUES (1001, 'Alice', 'alice@example.com', 1000.00);

INSERT INTO BankAccounts (acc_no, name, email, balance)
VALUES (1002, NULL, 'bob@example.com', 400.00);

SELECT * FROM BankAccounts;
        