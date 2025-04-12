CREATE DATABASE bookstore;
use bookstore;
-- A list of all books available in the store.
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    language_id INT,
    publisher_id INT,
    price DECIMAL(10,2),
    publication_year YEAR,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);


-- A table to manage the many-to-many relationship between books and authors.

CREATE TABLE book_author(

book_id INT ,
author_id INT,

FOREIGN KEY (book_id) REFERENCES book (book_id),

FOREIGN KEY (author_id) REFERENCES author (author_id)


);

-- Contains the list of all authors.
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
 
);


-- Lists the possible languages books can be written in.
CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50)
);


-- A list of publishers for books.
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100),
    contact_email VARCHAR(100)
);


-- A list of the bookstore's customers.
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- A list of addresses for customers. Each customer can have multiple addresses.
CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY,
    customer_id int,
    address_id int,
    status_id int,
    FOREIGN KEY (customer_id)REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
    )
    ;


-- Defines the status of an address (e.g., current, old).
CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);


-- A list of addresses.
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    country_name varchar(100),
    FOREIGN KEY(country_name) REFERENCES country(country_name), 
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20)
);

-- list of all countries where the addresses are located.
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) unique
);


-- A list of orders placed by customers.
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id int,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    order_date DATETIME,
    status_id int,
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    method_id int,
    FOREIGN KEY (method_id) REFERENCES shipping_method(method_id)
);


-- A list of books that are part of each order.
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY,
    order_id int,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    book_id int,
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    quantity INT,
    price_each DECIMAL(10,2)
);

-- A list of possible shipping methods for an order.
CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

-- A record of the history of an order (e.g., ordered, cancelled, delivered).
CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id int,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    status_id int,
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    updated_at DATETIME
);

-- A list of possible statuses for an order (e.g., pending, shipped, delivered).
CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

show tables;


