-- books.sql: Creates the "books" table with appropriate fields and constraints.
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each book; auto-increments automatically.
    title VARCHAR(255) NOT NULL,               -- The title of the book; cannot be null.
    price DECIMAL(10,2) NOT NULL,              -- Price of the book; 10 digits total, 2 after the decimal.
    publication_date DATE,                     -- Publication date of the book.
    publisher_id INT,                          -- Optional: can be used later to link to a publisher table.
    CONSTRAINT chk_price CHECK (price >= 0)    -- Ensures the price is not a negative value.
);
-- ALTER TABLE books ADD CONSTRAINT fk_publisher
-- FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id);
-- customers.sql: Creates the "customers" table with core customer information.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique customer identifier.
    name VARCHAR(255) NOT NULL,                   -- Customer’s full name.
    email VARCHAR(255) UNIQUE NOT NULL,           -- Email address, must be unique.
    phone VARCHAR(20)                            -- Contact phone number.
    -- Additional fields (optional): e.g., address, registration_date, etc.
);
-- ========================================
-- Bookstore Database Schema by Member 3
-- ========================================

-- 1. Table: country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    iso_code VARCHAR(5)
);

-- 2. Table: address_status
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- 3. Table: address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20),
    country_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- 4. Table: author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Table: book_language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL,
    iso_code VARCHAR(10)
);

-- 6. Table: publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Table: shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    estimated_days INT
);

-- 8. Table: order_status
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    description TEXT
);

-- 9. Table: customer_address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- 10. Table: book_author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    contribution VARCHAR(100),
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 11. Table: cust_order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    shipping_method_id INT,
    order_status_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- 12. Table: order_line
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 13. Table: order_history
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    status_change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    remarks TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);
