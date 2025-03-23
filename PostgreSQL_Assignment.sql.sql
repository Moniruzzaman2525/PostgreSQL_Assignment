-- Active: 1742135091249@@127.0.0.1@5432@bookstore_db
-- Create a "books" table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);


-- Create the "customers" table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);


-- Create an "orders" table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Inserting sample data into the "books" table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('Javascript The Good Parts', 'Moniruzzaman', 40, 10, 2020),
('React js The Complete Guide', 'Ikhtiaj Arif', 35, 5, 2019),
('Postgresql The Definitive Guide', 'Jhankar Mahbub', 30, 8, 2024),
('Typescript The Definitive Guide', 'Abdul Kalam', 50, 3, 2022),
('Redux The Definitive Guide', 'Mir', 20, 0, 2020),
('Next js The Definitive Guide', 'Tonmoy Pervez', 25, 5, 2023),
('Love Story', 'Ikhtiaj Arif', 40, 10, 1999),
('Life Story', 'Hasan Mahbub', 35, 5, 1995);


-- get all books from the "books" table
SELECT * FROM books;


-- inserting sample data into the "customers" table
INSERT INTO customers (name, email, joined_date) VALUES
('Moniruzzaman', 'web.moniruzzaman1@gmail.com', '2025-01-10'),
('Arif', 'arif@email.com', '2025-01-15'),
('Anik', 'anik@email.com', '2025-01-20');


-- get all customers data into the "customers" table
SELECT * FROM customers;


--  inserting sample data into the "orders" table
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 5, 2),
(2, 3, 1),
(3, 1, 3);


-- get all orders data into the "orders" table
SELECT * FROM orders;


-- Find books that are out of stock
SELECT title FROM books WHERE stock = 0;


-- Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1;


-- Find the total number of orders placed by each customer
SELECT customers.name as name, COUNT(orders.id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.quantity > 0
GROUP BY customers.id ORDER BY total_orders DESC;


-- Calculate the total revenue generated from book sales.
SELECT SUM(price * quantity) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;


-- List all customers who have placed more than one order.
SELECT customers.name as name, COUNT(orders.id) AS orders_count
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id, customers.name
HAVING COUNT(orders.id) > 1;


-- Find the average price of books in the store show only 2 decimal places.
SELECT ROUND(AVG(price), 2) as avg_book_price
FROM books;


--Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;


--  Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
