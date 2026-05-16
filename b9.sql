CREATE TABLE Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName NVARCHAR(255)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName NVARCHAR(255)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    SaleDate DATE,
    StoreID INT,
    CustomerID INT,
    TotalAmount DECIMAL(18,2),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE SalesDetails (
    SaleDetailID INT PRIMARY KEY AUTO_INCREMENT,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(18,2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

SELECT s.StoreName, SUM(sa.TotalAmount) AS TotalRevenue
FROM Stores s
JOIN Sales sa ON s.StoreID = sa.StoreID
WHERE QUARTER(sa.SaleDate) = QUARTER(CURDATE())
  AND YEAR(sa.SaleDate) = YEAR(CURDATE())
GROUP BY s.StoreID, s.StoreName
ORDER BY TotalRevenue DESC
LIMIT 3;

SELECT 
    sd.ProductID,
    SUM(sd.Quantity * sd.UnitPrice) AS ProductRevenue,
    SUM(sa.TotalAmount) AS StoreRevenue,
    ROUND(SUM(sd.Quantity * sd.UnitPrice) / SUM(sa.TotalAmount) * 100, 2) AS ContributionPercent
FROM SalesDetails sd
JOIN Sales sa ON sd.SaleID = sa.SaleID
WHERE sa.StoreID = 5
  AND YEAR(sa.SaleDate) = YEAR(CURDATE()) - 1
GROUP BY sd.ProductID;

SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(sa.SaleID) AS OrderCount,
    SUM(sa.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Sales sa ON c.CustomerID = sa.CustomerID
WHERE YEAR(sa.SaleDate) = 2024
GROUP BY c.CustomerID, c.CustomerName
HAVING SUM(sa.TotalAmount) > 10000
ORDER BY TotalSpent DESC;