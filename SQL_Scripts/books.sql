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
