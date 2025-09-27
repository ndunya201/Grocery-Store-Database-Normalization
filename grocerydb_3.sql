create database grocerydb_3;
use grocerydb_3;
-- INVENTORY3 (same as Inventory2, no transitive dependencies)
CREATE TABLE Inventory3 (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    QuantityOnHand INT
);

INSERT INTO Inventory3 VALUES
('P001','Whole Wheat Bread','BakeWell',65.50,20),
('P002','Milk 1L','DairyPure',48.00,30),
('P003','Eggs 12pc','FarmFresh',12.50,15),
('P004','Rice 2kg','GoldenGrain',120.00,25),
('P005','Sugar 1kg','SweetHome',138.80,10),
('P006','Cooking Oil 1L','OlivePure',125.75,12);


-- CUSTOMERS3 (remove transitive dependency of CustomerEmail)
-- Emails get their own table, instead of being tied to customer details
CREATE TABLE Customers3 (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerLastName VARCHAR(50),
    CustomerFirstName VARCHAR(50)
);

INSERT INTO Customers3 VALUES
('C001','Njuguna','Grace'),
('C002','Otieno','Mark'),
('C003','Kamau','Alice'),
('C004','Achieng','Beatrice'),
('C005','Mwangi','John'),
('C006','Nduta','Mary');

CREATE TABLE CustomerEmails3 (
    CustomerID VARCHAR(10),
    CustomerEmail VARCHAR(100),
    PRIMARY KEY (CustomerID, CustomerEmail),
    FOREIGN KEY (CustomerID) REFERENCES Customers3(CustomerID)
);

INSERT INTO CustomerEmails3 VALUES
('C001','gracenjuguna@gmail.com'),
('C002','markotieno@gmail.com'),
('C002','mark.personal@gmail.com'),
('C003','alicekamau@gmail.com'),
('C004','beatrice@gmail.com'),
('C005','john.mwangi@gmail.com'),
('C005','john.work@gmail.com'),
('C006','mary.nduta@gmail.com');


-- TRANSACTIONS3 (same as Transactions2, but now references Customers3 instead of Customers2)
CREATE TABLE Transactions3 (
    TransactionID VARCHAR(10),
    CustomerID VARCHAR(10),
    TransactionDate DATE,
    ProductID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers3(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Inventory3(ProductID)
);

INSERT INTO Transactions3 VALUES
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


-- VENDORS3 (same as Vendors2, no transitive dependencies)
CREATE TABLE Vendors3 (
    VendorID VARCHAR(10) PRIMARY KEY,
    VendorName VARCHAR(100)
);

INSERT INTO Vendors3 VALUES
('V001','FreshFoods Ltd'),
('V002','Dairy Distributors'),
('V003','GrainImporters'),
('V004','OilSuppliers'),
('V005','Bakers Choice'),
('V006','MarketSupplies');


-- VENDORPRODUCTS3 (same as VendorProducts2, no changes for 3NF)
CREATE TABLE VendorProducts3 (
    VendorID VARCHAR(10),
    ProductID VARCHAR(10),
    WholesalePrice DECIMAL(10,2),
    PRIMARY KEY (VendorID, ProductID),
    FOREIGN KEY (VendorID) REFERENCES Vendors3(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Inventory3(ProductID)
);

INSERT INTO VendorProducts3 VALUES
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