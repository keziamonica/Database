#DDL CREATE
CREATE DATABASE `kilo_bakery`;

CREATE TABLE departement(
	DeptID VARCHAR (5) PRIMARY KEY,
	Num_Of_Employee INT
);

CREATE TABLE employee(
	SSN INT PRIMARY KEY,
    Employee_name VARCHAR (45) NOT NULL,
    DeptID VARCHAR (5) NOT NULL,
    Age INT,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT,
    CONSTRAINT Dept_ID FOREIGN KEY (DeptID) REFERENCES departement(DeptID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE customers(
	CustID VARCHAR (5) PRIMARY KEY,
    Cust_name VARCHAR (45) NOT NULL,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT
);


CREATE TABLE adminn(
	SSN INT PRIMARY KEY,
    Admin_name VARCHAR (45) NOT NULL,
    CustID VARCHAR (5) NOT NULL,
    Age INT,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT,
    CONSTRAINT CUSTID FOREIGN KEY (CustID) REFERENCES customers (CustID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE orderr(
	OrderID VARCHAR(5) PRIMARY KEY,
    CustID VARCHAR (5) NOT NULL,
    Item_name VARCHAR (25) NOT NULL,
    Item_Desc VARCHAR (25) NOT NULL,
    Item_ID VARCHAR (5) NOT NULL,
	Price DOUBLE NOT NULL,
    Qty INT NOT NULL,
    CONSTRAINT CID FOREIGN KEY (CustID) REFERENCES customers (CustID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE baker(
	SSN INT PRIMARY KEY,
    Baker_name VARCHAR (45) NOT NULL,
    DeptID VARCHAR (5) NOT NULL,
	OrderID VARCHAR (5) NOT NULL,
    Age INT,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT,
    CONSTRAINT DEPTID FOREIGN KEY (DeptID) REFERENCES departement (DeptID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT Ord_ID FOREIGN KEY (OrderID) REFERENCES orderr(OrderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE manager(
    Manager_name VARCHAR (45) NOT NULL,
    DeptID VARCHAR (5) PRIMARY KEY,
    Age INT,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT,
    CONSTRAINT Dep_ID FOREIGN KEY (DeptID) REFERENCES departement (DeptID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE quality_control(
	SSN INT PRIMARY KEY,
    QC_name VARCHAR (45) NOT NULL,
    Age INT,
    Address VARCHAR (45) NOT NULL,
    Phone_number INT
);

CREATE TABLE payment(
	InvoiceID VARCHAR (5) PRIMARY KEY,
    Transfer VARCHAR(10),
    COD VARCHAR(10)
);

#DDL ALTER
ALTER TABLE employee ADD COLUMN Zodiak CHAR(12);
ALTER TABLE employee MODIFY COLUMN Zodiak VARCHAR(15);
ALTER TABLE departement MODIFY COLUMN Num_Of_Employee INT;
ALTER TABLE employee RENAME COLUMN Zodiak TO Rasi_Bintang;

#DDL DROP
DROP DATABASE `kilo_bakery`;
DROP TABLE payment;

#DML INSERT
INSERT INTO departement VALUES ("BK123",100);
INSERT INTO employee VALUES (123,"Yohanes Richard","BK123",19,"PEDURUNGAN YGY",085758870),
(124,"Kezia Artha","BK123",19,"PLAMONGAN INDAH COY",08909090),
(125,"Martinus Yordan","BK123",19,"SAMPANGAN SETARA",087087087);

#DML UPDATE
UPDATE employee SET address = "Sampangan" WHERE SSN = 125;
UPDATE employee SET Phone_number = 1404510987 WHERE SSN = 124;
UPDATE employee SET Employee_name = "YOHANES RICHARD" WHERE SSN = 123;

#DML DELETE
DELETE FROM employee WHERE SSN IN(124,125);

#VIEW untuk menghitung jumlah karyawan
CREATE VIEW Jumlah_Karyawan AS
SELECT COUNT(SSN) AS Num_Of_Employee FROM departement d
JOIN employee e ON d.DeptID = e.DeptID WHERE e.DeptID = "BK123";



