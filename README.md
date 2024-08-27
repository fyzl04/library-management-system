# MySQL Comprehensive Assessment: Library Management System

## Overview

This repository contains a MySQL script for creating a `library` database with related tables like `Branch`, `Employee`, and `Books`. The project demonstrates relational database design using MySQL.

## Database Schema

### `library` Database

- **Branch**: Contains branch details.
  - `Branch_no` (Primary Key)
  - `Manager_Id`
  - `Branch_address`
  - `Contact_no`

- **Employee**: Employee data linked to branches.
  - `Emp_Id` (Primary Key)
  - `Emp_name`
  - `Position`
  - `Salary`
  - `Branch_no` (Foreign Key referencing `Branch_no`)

- **Books**: Details of books in the library.
  - `ISBN` (Primary Key)
  - `Book_title`
  - `Category`
  - `Author`
  - `Publisher`
  - `Publication_year`
  - `Copies_available`

### Relationships

- **Employee ↔ Branch**: Each employee is associated with a branch through `Branch_no`.

## Getting Started

### Prerequisites

Ensure you have:
- MySQL Server
- MySQL Workbench or another MySQL client

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/fyzl04/library-management-system.git
