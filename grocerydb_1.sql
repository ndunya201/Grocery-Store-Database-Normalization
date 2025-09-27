CREATE DATABASE grocerydb_1;
USE grocerydb_1;

-- INVENTORY1 (same as 0NF since no violations)
CREATE TABLE Inventory1 (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    QuantityOnHand INT
);

INSERT INTO Inventory1 VALUES
('P001','Whole Wheat Bread','BakeWell',65.50,20),
('P002','Milk 1L','DairyPure',48.00,30),
('P003','Eggs 12pc','FarmFresh',12.50,15),
('P004','Rice 2kg','GoldenGrain',120.00,25),
('P005','Sugar 1kg','SweetHome',138.80,10),
('P006','Cooking Oil 1L','OlivePure',125.75,12);


-- VENDORS1 (expand multi-valued attributes into rows + FK to Inventory1)
CREATE TABLE Vendors1 (
    VendorID VARCHAR(10),
    VendorName VARCHAR(100),
    ProductID VARCHAR(10),
    WholesalePrice DECIMAL(10,2),
    PRIMARY KEY (VendorID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES Inventory1(ProductID)
);

INSERT INTO Vendors1 VALUES
('V001','FreshFoods Ltd','P001',65.50),
('V001','FreshFoods Ltd','P003',12.50),
('V002','Dairy Distributors','P002',48.00),
('V003','GrainImporters','P004',120.00),
('V003','GrainImporters','P005',138.80),
('V004','OilSuppliers','P006',125.75),
('V005','Bakers Choice','P001',65.50),
('V006','MarketSupplies','P002',48.00),
('V006','MarketSupplies','P004',120.00),
('V006','MarketSupplies','P006',125.75);


-- CUSTOMERS1 (one email per row, CustomerID still PK + email)
CREATE TABLE Customers1 (
    CustomerID VARCHAR(10),
    CustomerLastName VARCHAR(50),
    CustomerFirstName VARCHAR(50),
    CustomerEmail VARCHAR(100),
    PRIMARY KEY (CustomerID, CustomerEmail)
);

INSERT INTO Customers1 VALUES
('C001','Njuguna','Grace','gracenjuguna@gmail.com'),
('C002','Otieno','Mark','markotieno@gmail.com'),
('C002','Otieno','Mark','mark.personal@gmail.com'),
('C003','Kamau','Alice','alicekamau@gmail.com'),
('C004','Achieng','Beatrice','beatrice@gmail.com'),
('C005','Mwangi','John','john.mwangi@gmail.com'),
('C005','Mwangi','John','john.work@gmail.com'),
('C006','Nduta','Mary','mary.nduta@gmail.com');


-- TRANSACTIONS1 (one product per row + FKs to Inventory1 and Customers1)
CREATE TABLE Transactions1 (
    TransactionID VARCHAR(10),
    CustomerID VARCHAR(10),
    TransactionDate DATE,
    ProductID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers1(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Inventory1(ProductID)
);

INSERT INTO Transactions1 VALUES
('T001','C001','2025-09-01','P001',2),
('T001','C001','2025-09-01','P002',1),
('T002','C002','2025-09-01','P003',1),
('T003','C003','2025-09-02','P002',1),
('T003','C003','2025-09-02','P004',2),
('T003','C003','2025-09-02','P006',1),
('T004','C004','2025-09-03','P005',3),
('T005','C005','2025-09-04','P001',1),
('T005','C005','2025-09-04','P003',6),
('T006','C006','2025-09-05','P006',2);
