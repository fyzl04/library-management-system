CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
##Branch
INSERT INTO Branch VALUES (1, 101, 'calicut', '555-1234');
INSERT INTO Branch VALUES (2, 102, 'kochi', '555-5678');

##employee
INSERT INTO Employee VALUES (201, 'john', 'Manager', 60000.00, 1);
INSERT INTO Employee VALUES (202, 'faisal', 'Assistant', 45000.00, 1);
INSERT INTO Employee VALUES (203, 'bijoy', 'Manager', 55000.00, 2);

##book
INSERT INTO Books VALUES ('123-4567891234', 'Macbeth', 'Literature', 30.00, 'yes', 'William Shakespeare', 'Penguin');
INSERT INTO Books VALUES ('987-6543210987', 'Rich Dad Poor Dad', 'Finance', 25.00, 'no', 'Robert Kiyosaki', 'Warner Books');
INSERT INTO Books VALUES ('999-0001112223', 'Patham Onnu: Oru Vilapam', 'History', 30.00, 'yes', 'Sara Joseph', 'DC Books');
INSERT INTO Books VALUES ('000-1112223334', 'dakkuzhal', 'Literature', 25.00, 'no', 'G. Sankara Kurup', 'Sahitya Akademi');
INSERT INTO Books VALUES ('111-2223334445', 'kurutholikal', 'Poetry', 20.00, 'yes', 'Vyloppilli Sreedhara Menon', 'Current Books');


##Customer Data
INSERT INTO Customer VALUES (301, 'Alice Johnson', '789 Maple St', '2020-11-15');
INSERT INTO Customer VALUES (302, 'Bob Williams', '101 Pine St', '2021-05-20');

## IssueStatus Data
INSERT INTO IssueStatus VALUES (401, 301, 'The History of Time', '2023-06-15', '123-4567891234');

##ReturnStatus Data
INSERT INTO ReturnStatus VALUES (501, 301, 'The History of Time', '2023-07-01', '123-4567891234');

#1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;
#4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

#8. Display the names of customers who have issued book in the month 0f june 2023
SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9. Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresse
SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Employee.Position = 'Manager';

#12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;































