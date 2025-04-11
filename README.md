🗃️ Database Schema & Data Types
This section outlines the schema and data types for the Bookstore Management Database. The database is designed to store and manage data related to books, authors, customers, orders, shipping, and more. Each table is carefully structured to ensure data integrity and enable efficient queries across relationships.

## The tables
## 1. 📚 book
A list of all books available in the store.

book_id         INT PRIMARY KEY
title           VARCHAR(255)
language_id     INT (FK → book_language)
publisher_id    INT (FK → publisher)
price           DECIMAL(10,2)
publication_year YEAR

## 2. 🔗 book_author
A table to manage the many-to-many relationship between books and authors.

book_id         INT (FK → book)
author_id       INT (FK → author)
PRIMARY KEY(book_id, author_id)

## 3. ✍️ author
Contains the list of all authors.

author_id       INT PRIMARY KEY
name            VARCHAR(100)

## 4. 🌐 book_language
Lists the possible languages books can be written in.

language_id     INT PRIMARY KEY
language_name   VARCHAR(50)

## 5. 🏢 publisher
A list of publishers for books.

publisher_id    INT PRIMARY KEY
name            VARCHAR(100)
contact_email   VARCHAR(100)

## 6. 👤 customer
A list of the bookstore's customers.

customer_id     INT PRIMARY KEY
first_name      VARCHAR(50)
last_name       VARCHAR(50)
email           VARCHAR(100)
phone           VARCHAR(15)

## 7. 🧍 customer_address
A list of addresses for customers. Each customer can have multiple addresses.

customer_address_id INT PRIMARY KEY
customer_id     INT (FK → customer)
address_id      INT (FK → address)
status_id       INT (FK → address_status)

## 8. 🔖 address_status
Defines the status of an address (e.g., current, old).

status_id       INT PRIMARY KEY
status_name     VARCHAR(50)

## 9. 🏠 address
A list of all addresses in the system.

address_id      INT PRIMARY KEY
postal_code     VARCHAR(20)
city            VARCHAR(100)
country_name     VARCHAR(100) (FK → country)

## 10. 🌍 country 
A list of countries where the addresses are located.

country_id      INT PRIMARY KEY
country_name    VARCHAR(100)

## 11. 📦 cust_order
A list of orders placed by customers.

order_id        INT PRIMARY KEY
customer_id     INT (FK → customer)
order_date      DATETIME
status_id       INT (FK → order_status)
shipping_method_id INT (FK → shipping_method)

## 12. 🧾 order_line
A list of books that are part of each order.

order_line_id   INT PRIMARY KEY
order_id        INT (FK → cust_order)
book_id         INT (FK → book)
quantity        INT
price_each      DECIMAL(10,2)

## 13. 🧭 shipping_method
A list of possible shipping methods for an order.

method_id       INT PRIMARY KEY
method_name     VARCHAR(100)
cost            DECIMAL(10,2)

## 14. 📜 order_history
A record of the history of an order (e.g., ordered, cancelled, delivered).

history_id      INT PRIMARY KEY
order_id        INT (FK → cust_order)
status_id       INT (FK → order_status)
updated_at      DATETIME

## 15. 📄 order_status
A list of possible statuses for an order (e.g., pending, shipped, delivered). 

status_id       INT PRIMARY KEY
status_name     VARCHAR(50) -- e.g. pending, shipped


## 📌 Notes

## 🔤 Acronyms Explained
## PK = Primary Key
A unique identifier for each record in a table. No duplicates allowed.

## FK = Foreign Key
A reference to a primary key in another table, used to establish relationships between tables.