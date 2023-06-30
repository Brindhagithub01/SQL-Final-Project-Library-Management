create database library;

use library;

#Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);

Desc Branch;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
  (1, 101, 'Bank ColonyA', '96234567'),
  (2, 102, 'Bank ColonyB', '70203045'),
  (3, 103, 'Tripliane', '9633829'),
  (4, 104, 'Dilshad Garden', '948812076'),
  (5, 105, 'Cedar Road', '93457381');

Select * from Branch;


#Employee Table

CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(255),
  Salary DECIMAL(10, 2)
);


Desc Employee;

Alter table Employee add column Branch_no int;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES 
  (101, 'Lidiya Raju', 'Manager', 65000),
  (102, 'Parvathy', 'Sales Associate', 42000),
  (103, 'Johnson', 'Customer Service Representative', 52500),
  (104, 'David Raj', 'Accountant', 38000),
  (105, 'Sethu Lakshmi', 'IT Specialist', 60500);
  
  INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary,Branch_no)
VALUES 
(106,'Rithika','IT Specialist',65000,1),
(107,'Sidtharth','Accountant',45000,1),
(108,'Raju','Sales Associate',49000,1);

Select * from Employee;

update Employee set Branch_no=1 where Emp_Id=101;
update Employee set Branch_no=1 where Emp_Id=102;
update Employee set Branch_no=3 where Emp_Id=103;
update Employee set Branch_no=1 where Emp_Id=104;
update Employee set Branch_no=1 where Emp_Id=105;


#Customer Table

CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE
);

DESC  Customer;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
  (1, 'Xavier', 'North Villa,Chni', '2022-01-01'),
  (2, 'Sathyan', 'South Villa,Chni', '2020-02-28'),
  (3, 'Michael', 'Sannathi House,Coim', '2021-03-10'),
  (4, 'Shalini', 'Rajas Nagar,Ngl', '2023-04-05'),
  (5, 'Priya', 'Sagar Road,Del', '2023-05-20');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(6,'Aline','SouthWay St,Mum','2020-10-01'),
(7,'Jerome','NorthhWay St,Chni','2020-09-15');
Select * from Customer;

#Books Table

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);


DESC Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
  ('1234567890', 'Absalom', 'History', 450.99, 'Yes', 'William', 'Rupa Publisher'),
  ('0987654321', 'House of Mirth', 'Novel', 312.50, 'No', 'Whartson', 'Penquin Publisher'),
  ('9876543210', 'The Guide', 'Novel',187.50, 'Yes', 'R.K.Narayan', 'Roll books'),
  ('0123456789', 'Malgudi Days', 'Short Stories', 300.99, 'Yes', 'R.K.Narayan','HillBooks'),
  ('5432109876', 'Godan','Fiction', 545.70, 'No', 'Munshi','Penquin Publisher');


INSERT INTO Books(ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
  ('32076895', 'Pirates', 'Short Stories',412.00,'Yes','William','HillBooks' ),
  ('5320897', 'The Ship', 'Novel',350.15,'No','Wordsworth','Roll books' );
Select * from Books;
   
#IssueStatus Table

CREATE TABLE IssueStatus (
    issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);


DESC ISSueStatus;

INSERT INTO IssueStatus(issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
  (201, 1, 'Malgudi Days', '2023-06-15', '0123456789'),
  (202, 3, 'Godan', '2023-06-20', '5432109876'),
  (203, 2, 'Malgudi Days', '2023-04-12', '0123456789'),
  (204, 1, 'The Guide', '2023-03-12', '9876543210'),
  (205, 5, 'Absalom', '2023-05-18', '1234567890');
  
  INSERT INTO IssueStatus(issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
  (206, 4, 'Pirates', '2022-06-01', '32076895'),
  (207, 2, 'The Ship', '2022-06-02', '5320897');
  INSERT INTO IssueStatus(issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES  (208, 7, 'The Ship', '2020-11-20', '5320897');
  
Select * From IssueStatus;

#ReturnStatus Table

CREATE TABLE ReturnStatus(
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


DESC ReturnStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
  (61, 1, 'Malgudi Days', '2023-08-30', '0123456789'),
  (62, 3, 'Godan', '2023-07-29', '5432109876'),
  (63, 2, 'Malgudi Days', '2023-08-28', '0123456789'),
  (64, 1, 'The Guide', '2023-05-27', '9876543210'),
  (65, 5, 'Absalom', '2023-07-26', '1234567890');


Select * from ReturnStatus;
  
  #1 Retrieve the book title, category, and rental price of all available books.
  
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';


#2 List the employee names and their respective salaries in descending  order of salary

SELECT Emp_name, Salary FROM Employee ORDER BY salary DESC;


#3 Retrieve the book titles and the corresponding customers who have issued those books. 

SELECT Book_title, Customer_name
FROM Books INNER JOIN IssueStatus ON ISBN = Isbn_book INNER JOIN Customer ON Issued_cust = Customer_Id;


#4 Display the total count of books in each category. 

SELECT Category, COUNT(*) AS TotalCount FROM Books GROUP BY Category;


#5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name, Position FROM Employee WHERE salary > 50000;

#6 List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer.Customer_name,Customer.Reg_date FROM Customer LEFT JOIN IssueStatus ON 
Customer.Customer_Id = IssueStatus.Issued_cust WHERE Customer.Reg_date <'2022-01-01' 
AND IssueStatus.Issued_cust IS NULL;


#7 Display the branch numbers and the total count of employees in each  branch. 

SELECT Branch_no, COUNT(*) AS total_employees
FROM Employee
GROUP BY Branch_no;


#8 Display the names of customers who have issued books in the month of June 2023. 

SELECT Customer_name,Issue_date
FROM Customer INNER JOIN IssueStatus  ON Customer_Id = Issued_cust
WHERE Issue_date >= '2023-06-01' AND Issue_date <= '2023-06-30';

#9 Retrieve book_title from book table containing history.

SELECT Book_title,Category
FROM Books
WHERE Category Like'%History%';

#10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, COUNT(*) AS Employee_count FROM Employee
GROUP BY Branch_no HAVING COUNT(*) > 5;
