# 📚 Bookstore Database Management System

This project is a relational database system designed for managing a bookstore's core business data including books, authors, customers, orders, shipping, and inventory. It was built using MySQL and follows best practices in database design, normalization, and access control.

---

## 📁 Project Structure

- `schema.sql` – SQL script to create the full database schema with tables and relationships.
- `sample_data.sql` – (Optional) Insert statements for testing the schema.
- `roles.sql` – (Optional) SQL script to create user roles and manage permissions.
- `erd.drawio.png` – ERD diagram representing the full relational structure.
- `README.md` – Project documentation and setup guide.

---

## 🏗️ Features

- Manage books, authors, publishers, and languages.
- Handle customer orders, addresses, and order histories.
- Supports shipping methods, order statuses, and delivery tracking.
- Enforces referential integrity with foreign keys.
- Role-based access control for admins and analysts.

---

## 📐 ERD Diagram

![ERD](./erd.drawio.png)

---

## 🧱 Database Schema Overview

### Key Tables:

- `book`, `author`, `publisher` – Core book info and relationships.
- `customer`, `customer_address`, `address`, `country` – Customer data and locations.
- `cust_order`, `order_line`, `order_status`, `order_history` – Order lifecycle.
- `shipping_method`, `address_status` – Support structures.
- `book_language`, `book_author` – Multilingual and multi-author support.

---

## ⚙️ Setup Instructions

1. **Clone or Download the Project**
   ```bash
   git clone https://github.com/your-username/bookstore-db.git
   cd bookstore-db
