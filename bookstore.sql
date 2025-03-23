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
('Next js The Definitive Guide', 'Tonmoy Pervez', 25, 5, 2023);
