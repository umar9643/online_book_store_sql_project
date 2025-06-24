DROP TABLE IF EXISTS Books;
create table Books
(
Book_ID serial primary key,
Title	varchar(100),
Author varchar(100),
Genre varchar(50),
Published_Year	int,
Price	float,
Stock int
);



create table Customer
(
Customer_ID serial primary key,
Name varchar(100),
Email varchar(50),
Phone int,
City varchar(50),
Country varchar(70)

);



create table Orders
(
Order_ID serial primary key,
Customer_ID	 int references Customer(Customer_ID),
Book_ID serial references Books(Book_ID),
Order_Date date,
Quantity int,
Total_Amount float
);


-- 1) Retrieve all books in the "Fiction" genre:
select * from Books
where genre='Fiction';



-- 2) Find books published after the year 1950:
select title from Books
where published_year>'1950';



-- 3) List all customers from the Canada:
select name from Customer
where country = 'Canada'



-- 4) Show orders placed in November 2023:
select * from orders
where order_date >= '2023-11-1' and order_date < '2023-12-1';



-- 5) Retrieve the total stock of books available:
select sum(stock) as total_stock from Books;



-- 6) Find the details of the most expensive book:
select * from Books
order by price desc
limit 1




-- 7) Show all customers who ordered more than 1 quantity of a book:
select 
c.name,
o.quantity
from Customer as c
join 
orders as o
on c.customer_id=o.customer_id
where quantity >'1';

--SELECT * FROM Orders 
--WHERE quantity>1;




-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where total_amount>20;






-- 9) List all genres available in the Books table:
select distinct(genre) from books;





-- 10) Find the book with the lowest stock:
select title,stock from books
order by stock asc
limit 1;






-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as revenue from orders


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select 
(b.genre),
sum(o.quantity) as total_book_sold
from books as b
join 
orders as o
on b.book_id=o.book_id
group by b.genre;







-- 2) Find the average price of books in the "Fantasy" genre:
select 
avg(price)
from books
where genre='Fantasy'




-- 3) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customer c
ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;




-- 4) Find the most frequently ordered book:
select 
 b.book_id,
 b.title,
 count(order_id) as order_count
from books as b
join orders  as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by  order_count desc
limit 1;




-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books
where genre='Fantasy'
order by price desc
limit 3;



-- 6) Retrieve the total quantity of books sold by each author:
select 
      b.author,
      sum(quantity) as total_book_sold
from books as b
join orders as o
on b.book_id=o.book_id
group by author;




-- 7) List the cities where customers who spent over $30 are located:
select 
      distinct(c.city),
	  o.total_amount
from orders as o
join customer as c
on o.customer_id=c.customer_id
where o.total_amount>30;



-- 8) Find the customer who spent the most on orders:
select
      c.customer_id,
	  c.name,
	  sum(o.total_amount) as amt_spent
from customer  as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by amt_spent desc
limit 1;



--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;









select * from Orders
select * from Books
select * from Customer