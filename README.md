
# MySQL Comprehensive Assessment
# librarary managment system

## Project Overview

This repository contains a MySQL script designed for a comprehensive assessment task. The script creates a `library` database and defines several related tables, including `Branch`, `Employee`, and `Books`. The goal of this project is to demonstrate the ability to design and implement a relational database structure using MySQL.

## Database Schema

### Database: `library`

The database contains the following tables:

- **Branch**
  - `Branch_no`: INT, Primary Key
  - `Manager_Id`: INT
  - `Branch_address`: VARCHAR(255)
  - `Contact_no`: VARCHAR(15)

- **Employee**
  - `Emp_Id`: INT, Primary Key
  - `Emp_name`: VARCHAR(100)
  - `Position`: VARCHAR(100)
  - `Salary`: DECIMAL(10, 2)
  - `Branch_no`: INT, Foreign Key references `Branch(Branch_no)`

- **Books**
  - `ISBN`: VARCHAR(20), Primary Key
  - `Book_title`: VARCHAR(255)
  - `Category`: VARCHAR(100)
  - `Author`: VARCHAR(100)
  - `Publisher`: VARCHAR(100)
  - `Publication_year`: YEAR
  - `Copies_available`: INT

### Relationships

- The `Employee` table is linked to the `Branch` table through the `Branch_no` foreign key, indicating which branch each employee works at.

## Getting Started

### Prerequisites

To run this script, ensure you have the following installed:

- MySQL Server
- MySQL Workbench or any MySQL-compatible client

### Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/fyzl04/mysql-comprehensive-assessment.git
   ```

2. Navigate to the project directory:
   ```bash
   cd mysql-comprehensive-assessment
   ```

3. Open the `MySQL Comprehensive Assessment.sql` file in your MySQL client.

4. Run the script to create the `library` database and its associated tables.

### Usage

Once the database and tables are created, you can perform various SQL operations such as:

- Inserting data into the tables
- Querying the database for specific information
- Updating or deleting records as required

### Contributing

Contributions are welcome! If you have suggestions for improvements or additional features, feel free to submit a pull request.

### Attachments
- 1.sql code
- 2. data set
- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.


