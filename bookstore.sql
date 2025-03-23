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

-- 

-- Create the "customers" table

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);
