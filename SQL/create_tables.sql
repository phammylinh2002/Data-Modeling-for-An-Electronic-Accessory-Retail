-- Create a database
CREATE DATABASE HOANG_LAM_STORE;
GO


-- Create tables
USE HOANG_LAM_STORE;
GO

-- SUPPLIERS table
CREATE TABLE SUPPLIERS (
  id CHAR(9) NOT NULL PRIMARY KEY,
  name NVARCHAR(40) NOT NULL,
  email NVARCHAR(50),
  address NVARCHAR(100),
  phone_number CHAR(10)
);
GO

-- CUSTOMERS table
CREATE TABLE CUSTOMERS (
  id CHAR(9) NOT NULL PRIMARY KEY,
  first_name NVARCHAR(20),
  mid_name NVARCHAR(30) NOT NULL,
  last_name NVARCHAR(20) NOT NULL,
  address NVARCHAR(100),
  phone_number CHAR(10),
  gender NVARCHAR(3) NOT NULL CHECK (gender = N'Nam' OR gender = N'Nữ'),
  birthdate DATE
);
GO

-- ACCESSORY_GROUPS table
CREATE TABLE ACCESSORY_GROUPS (
  id CHAR(5) NOT NULL PRIMARY KEY,
  name NVARCHAR(20) NOT NULL,
  description TEXT NOT NULL
);
GO

-- EMPLOYEES table
CREATE TABLE EMPLOYEES (
  id CHAR(4) NOT NULL PRIMARY KEY,
  last_name NVARCHAR(20) NOT NULL,
  mid_name NVARCHAR(20) NOT NULL,
  first_name NVARCHAR(20) NOT NULL,
  position NVARCHAR(20) NOT NULL,
  start_date DATE NOT NULL,
  salary NUMERIC(8,0) NOT NULL CHECK (salary >= 0),
  email NVARCHAR(50),
  phone_number CHAR(10),
  birthdate DATE
);
GO 

-- ACCESSORIES table
CREATE TABLE ACCESSORIES (
  id CHAR(5) NOT NULL PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
  made_in NVARCHAR(20),
  unit NVARCHAR(20) NOT NULL,
  original_price NUMERIC(8,0) NOT NULL CHECK (original_price >= 0),
  selling_price NUMERIC(8,0) NOT NULL CHECK (selling_price >= 0),
  accessory_group_id CHAR(5) NOT NULL
);
GO 

-- IMPORT_INVOICES table
CREATE TABLE IMPORT_INVOICES (
  id CHAR(5) NOT NULL PRIMARY KEY,
  date DATE NOT NULL,
  supplier_id CHAR(9) NOT NULL
);
GO 

-- SALES_INVOICES table
CREATE TABLE SALES_INVOICES (
  id CHAR(9) NOT NULL PRIMARY KEY,
  date DATE NOT NULL,
  customer_id CHAR(9) NOT NULL,
  employee_id CHAR(4) NOT NULL
);
GO 

-- ACCESSORIES_IN_AN_IMPORT_INVOICE table
CREATE TABLE ACCESSORIES_IN_AN_IMPORT_INVOICE (
  import_invoice_id CHAR(5) NOT NULL,
  accessory_id CHAR(5) NOT NULL,
  quantity Int NOT NULL CHECK (quantity >= 0),
  PRIMARY KEY (import_invoice_id, accessory_id)
);
GO 

-- ACCESSORIES_IN_A_SALES_INVOICE table
CREATE TABLE ACCESSORIES_IN_A_SALES_INVOICE (
  sales_invoice_id CHAR(9) NOT NULL,
  accessory_id CHAR(5) NOT NULL,
  quantity Int NOT NULL CHECK (quantity >= 0),
  PRIMARY KEY (sales_invoice_id, accessory_id)
);
GO