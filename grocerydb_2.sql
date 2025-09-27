create database grocerydb_2;
use grocerydb_2;

-- INVENTORY2 (same as Inventory1, no partial dependencies)
CREATE TABLE Inventory2 (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    QuantityOnHand INT
);

INSERT INTO Inventory2 VALUES
('P001','Whole Wheat Bread','BakeWell',65.50,20),
('P002','Milk 1L','DairyPure',48.00,30),
('P003','Eggs 12pc','FarmFresh',12.50,15),
('P004','Rice 2kg','GoldenGrain',120.00,25),
('P005','Sugar 1kg','SweetHome',138.80,10),
('P006','Cooking Oil 1L','OlivePure',125.75,12);


-- CUSTOMERS2 (same as Customers1, no partial dependencies)
CREATE TABLE Customers2 (
    CustomerID VARCHAR(10),
    CustomerLastName VARCHAR(50),
    CustomerFirstName VARCHAR(50),
    CustomerEmail VARCHAR(100),
    PRIMARY KEY (CustomerID, CustomerEmail)
);

INSERT INTO Customers2 VALUES
('C001','Njuguna','Grace','gracenjuguna@gmail.com'),
('C002','Otieno','Mark','markotieno@gmail.com'),
('C002','Otieno','Mark','mark.personal@gmail.com'),
('C003','Kamau','Alice','alicekamau@gmail.com'),
('C004','Achieng','Beatrice','beatrice@gmail.com'),
('C005','Mwangi','John','john.mwangi@gmail.com'),
('C005','Mwangi','John','john.work@gmail.com'),
('C006','Nduta','Mary','mary.nduta@gmail.com');


-- TRANSACTIONS2 (same as Transactions1, no partial dependencies)
CREATE TABLE Transactions2 (
    TransactionID VARCHAR(10),
    CustomerID VARCHAR(10),
    TransactionDate DATE,
    ProductID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers2(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Inventory2(ProductID)
);

INSERT INTO Transactions2 VALUES
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


-- VENDORS2 (separate table for vendor info)
CREATE TABLE Vendors2 (
    VendorID VARCHAR(10) PRIMARY KEY,
    VendorName VARCHAR(100)
);

INSERT INTO Vendors2 VALUES
('V001','FreshFoods Ltd'),
('V002','Dairy Distributors'),
('V003','GrainImporters'),
('V004','OilSuppliers'),
('V005','Bakers Choice'),
('V006','MarketSupplies');


-- VENDORPRODUCTS2 (resolves partial dependency)
CREATE TABLE VendorProducts2 (
    VendorID VARCHAR(10),
    ProductID VARCHAR(10),
    WholesalePrice DECIMAL(10,2),
    PRIMARY KEY (VendorID, ProductID),
    FOREIGN KEY (VendorID) REFERENCES Vendors2(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Inventory2(ProductID)
);

INSERT INTO VendorProducts2 VALUES
('V001','P001',65.50),
('V001','P003',12.50),
('V002','P002',48.00),
('V003','P004',120.00),
('V003','P005',138.80),
('V004','P006',125.75),
('V005','P001',65.50),
('V006','P002',48.00),
('V006','P004',120.00),
('V006','P006',125.75);
