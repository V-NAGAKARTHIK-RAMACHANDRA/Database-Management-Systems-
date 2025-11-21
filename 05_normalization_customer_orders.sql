-- Question 5: Normalization - Customer Orders
-- You are given a non-normalized table ordersraw(orderid, customername, customerphone, 
-- product, quantity) containing customer details and purchased products. Normalize the 
-- table structure up to Third Normal Form (3NF) by designing appropriate relational 
-- tables and identifying primary and foreign keys.

-- Original Table (Un-normalized):
-- ordersraw(orderid, customername, customerphone, product, quantity)

-- Problems with the original table:
-- 1. Data redundancy: Customer information repeated for each order
-- 2. Update anomalies: Changing customer phone requires updating multiple records
-- 3. Insert anomalies: Cannot add a customer without an order
-- 4. Delete anomalies: Deleting an order may lose customer information

-- Solution: Normalize to 3NF

-- Table 1: customers (1NF, 2NF, 3NF)
CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    customername VARCHAR(100) NOT NULL,
    customerphone VARCHAR(15)
);

-- Table 2: products (1NF, 2NF, 3NF)
CREATE TABLE products (
    productid INT PRIMARY KEY,
    productname VARCHAR(100) NOT NULL
);

-- Table 3: orders (1NF, 2NF, 3NF)
CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    customerid INT NOT NULL,
    orderdate DATE,
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- Table 4: orderdetails (1NF, 2NF, 3NF)
CREATE TABLE orderdetails (
    orderdetailid INT PRIMARY KEY,
    orderid INT NOT NULL,
    productid INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (orderid) REFERENCES orders(orderid),
    FOREIGN KEY (productid) REFERENCES products(productid)
);

-- Benefits of normalization:
-- 1. No data redundancy
-- 2. Easy to maintain and update
-- 3. Better data integrity
-- 4. Flexible structure for queries
