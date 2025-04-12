-- customers.sql: Creates the "customers" table with core customer information.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique customer identifier.
    name VARCHAR(255) NOT NULL,                   -- Customer’s full name.
    email VARCHAR(255) UNIQUE NOT NULL,           -- Email address, must be unique.
    phone VARCHAR(20)                            -- Contact phone number.
    -- Additional fields (optional): e.g., address, registration_date, etc.
);
