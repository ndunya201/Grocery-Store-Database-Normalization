-- CREATE DATABASE GroceryDB;
USE GroceryDB;

-- Inventory0
CREATE TABLE Inventory0 (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    QuantityOnHand INT
);

INSERT INTO Inventory0 VALUES
('P001','Whole Wheat Bread','BakeWell',65.50,20),
('P002','Milk 1L','DairyPure',48.00,30),
('P003','Eggs 12pc','FarmFresh',12.50,15),
('P004','Rice 2kg','GoldenGrain',120.00,25),
('P005','Sugar 1kg','SweetHome',138.80,10),
('P006','Cooking Oil 1L','OlivePure',125.75,12);

-- Vendors0 (Multi-valued attributes/ Non-atomic attributes)
CREATE TABLE Vendors0 (
    VendorID VARCHAR(10) PRIMARY KEY,
    VendorName VARCHAR(100),
    ProductIDs VARCHAR(100),      -- comma separated values
    WholesalePrices VARCHAR(100)  -- comma separated values
);

INSERT INTO Vendors0 VALUES
('V001','FreshFoods Ltd','P001,P003','65.50,12.50'),
('V002','Dairy Distributors','P002','48.00'),
('V003','GrainImporters','P004,P005','120.00,138.80'),
('V004','OilSuppliers','P006','125.75'),
('V005','Bakers Choice','P001','138.80'),
('V006','MarketSupplies','P002,P004,P006','48.00,120.00,127.75');

-- Customers0 (Multiple emails in one field)
CREATE TABLE Customers0 (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerLastName VARCHAR(50),
    CustomerFirstName VARCHAR(50),
    CustomerEmails VARCHAR(200) -- multiple values separated by ;
);

INSERT INTO Customers0 VALUES
('C001','Njuguna','Grace','gracenjuguna@gmail.com'),
('C002','Otieno','Mark','markotieno@gmail.com;mark.personal@gmail.com'),
('C003','Kamau','Alice','alicekamau@gmail.com'),
('C004','Achieng','Beatrice','beatrice@gmail.com'),
('C005','Mwangi','John','john.mwangi@gmail.com;john.work@gmail.com'),
('C006','Nduta','Mary','mary.nduta@gmail.com');

-- Transactions0 (Multi-valued Products and Quantities)
CREATE TABLE Transactions0 (
    TransactionID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    TransactionDate DATE,
    ProductIDs VARCHAR(100),  -- semicolon separated values
    Quantities VARCHAR(100)   -- semicolon separated values
);

INSERT INTO Transactions0 VALUES
('T001','C001','2025-09-01','P001;P002','2;1'),
('T002','C002','2025-09-01','P003','1'),
('T003','C003','2025-09-02','P002;P004;P006','1;2;1'),
('T004','C004','2025-09-03','P005','3'),
('T005','C005','2025-09-04','P001;P003','1;6'),
('T006','C006','2025-09-05','P006','2');

