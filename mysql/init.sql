-- init.sql

CREATE DATABASE inventorydb;

USE inventorydb;

CREATE TABLE products(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT
);

INSERT INTO products(product_name,quantity)
VALUES
('Laptop',10),
('Mouse',50),
('Keyboard',25);