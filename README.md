# 📚 Bookstore SQL Project

This project is a hands-on SQL database design and query solution based on a bookstore management system. It involves creating tables, inserting and retrieving data, and solving beginner to advanced-level queries.

## 🔧 Tech Stack
- **Database**: PostgreSQL (but compatible with most SQL engines)
- **Language**: SQL

---

## 📂 Project Structure

- `Query and their sol.sql`: Full SQL script containing:
  - Table creation (`Books`, `Customer`, `Orders`)
  - SQL queries for various business problems
- `Queries to be solved.sql`: Raw list of SQL problems (basic + advanced)

---

## 📌 Features

- 📘 Retrieve books by genre, year, stock, price, etc.
- 📦 Track orders and calculate total revenue.
- 📊 Advanced analytics like:
  - Most frequently ordered book
  - Total quantity sold by author
  - Customers spending the most
  - Stock remaining after fulfilling orders

---

## 🚀 How to Use

1. **Open PostgreSQL** (or any SQL client like DBeaver or pgAdmin).
2. Run the SQL code from `Query and their sol.sql`.
3. Experiment by modifying queries or adding your own!

---

## 🧠 Key Learnings

- SQL Joins (INNER, LEFT)
- Aggregate functions (`SUM`, `COUNT`, `AVG`)
- Filtering using `WHERE`, `HAVING`
- Grouping & ordering results
- Real-world business use case simulation

---

## 📁 Files Included

| File Name                  | Description                             |
|---------------------------|-----------------------------------------|
| `Query and their sol.sql` | Full solution set with table creation   |
| `Queries to be solved.sql`| List of questions to solve using SQL    |

---

## 📌 Sample Query

> 🔍 Find the most frequently ordered book:
```sql
SELECT 
  b.book_id, b.title, COUNT(o.order_id) AS order_count
FROM books AS b
JOIN orders AS o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title
ORDER BY order_count DESC
LIMIT 1;


🤝 Connect
If you found this project helpful or would like to collaborate, feel free to connect:


📧 Email: alamumar258455@gmail.com
SELECT 
  b.book_id, b.title, COUNT(o.order_id) AS order_count
FROM books AS b
JOIN orders AS o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title
ORDER BY order_count DESC
LIMIT 1;


🤝 Connect
If you found this project helpful or would like to collaborate, feel free to connect:


📧 Email: alamumar258455@gmail.com
LinkedIn: www.linkedin.com/in/umar-alam-a1b2c3




