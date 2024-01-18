
-- welcome to my game shop :D
-- create customer table
.mode box
CREATE TABLE customer (
    customer_id int primary key,
    customer_name varchar(50),
    birthdate date,
    email varchar(255)
);

-- insert data into customer table
.mode box
INSERT INTO customer 
VALUES
    (1, 'teay', '1996-04-07', 'teay@gmail.com'),
    (2, 'gip', '1996-05-10', 'gip@gmail.com'),
    (3, 'ging', '2006-04-14', 'ging@gmail.com'),
    (4, 'gam', '1996-07-08', 'gam@gmail.com')
  ;


-- create product table for my game shop
.mode box
CREATE TABLE product (  
      product_id int primary key,
      product_name varchar(255),
      product_type varchar(50),
      product_price int
  );

-- insert data into product table
.mode box

INSERT INTO product 
values
    (1, "monster_hunter", "pc", 990),
    (2, "stardew_valley", "pc", 500),
    (3, "pokemon","console", 1890),
    (4, "mario_kart", "console", 1900),
    (5, "elder_ring", "pc", 1990)
  ;

-- create orders in jan 2023 table
.mode box
CREATE TABLE orders (
    order_id int primary key,
    customer_id int,
    product_id int,
    order_date date,
    qty int
) 
;

-- insert data into orders table
.mode box
INSERT INTO orders 
VALUES
    (1, 2, 1, "2023-01-20", 1),
    (2, 2, 2, "2023-01-20", 3),
    (3, 1, 1, "2023-01-21", 2),
    (4, 4, 2,"2023-01-23", 1),
    (5, 1, 3, "2023-01-24", 2),
    (6, 2, 4, "2023-01-26", 2),
    (7, 3, 5, "2023-01-26", 1),
    (8, 2, 1, "2023-01-27", 1),
    (9, 1, 2, "2023-01-29", 2),
    (10, 2, 3, "2023-01-29", 3)
;

-- crate cost table 
CREATE TABLE cost (
    cost_id int primary key,
    product_id int,
    cost_price int
);

-- insert data into cost table
.mode box
INSERT INTO cost 
VALUES
    (1, 1, 700),
    (2, 2, 300),
    (3, 3, 1200),
    (4, 4, 1250),
    (5, 5, 1350)
;


SELECT * FROM customer ;
SELECT * FROM product ;
SELECT * FROM orders ; 
SELECT * FROM cost ;


-- Query 1 who is the top spender PC product in january sale

SELECT 
    customer.customer_name,
    SUM(product.product_price * orders.qty) AS totalspend
FROM orders
JOIN product 
ON orders.product_id = product.product_id
JOIN customer
ON orders.customer_id = customer.customer_id
WHERE product.product_type = "pc"
GROUP BY customer.customer_name
ORDER BY totalspend DESC;

-- Query 2  Obtain the email address of the youngest customer in the January sale.
WITH customer_age AS (
  SELECT 
    customer_name,
    email,
    strftime('%Y', 'now') - strftime('%Y', birthdate) AS age
  FROM customer
)

SELECT 
  customer_name,
  email,
  age
FROM customer_age
WHERE age = (SELECT MIN(age) FROM customer_age);

-- Query 3 how much the profit of the shop in january 2023
SELECT 
    SUM(product.product_price * orders.qty) AS total_sale,
    SUM(cost.cost_price * orders.qty) AS total_cost,
    SUM(product.product_price * orders.qty - cost.cost_price * orders.qty) AS profit
FROM orders
JOIN product 
  ON orders.product_id = product.product_id
JOIN cost 
  ON orders.product_id = cost.product_id
WHERE strftime('%Y-%m', orders.order_date) = '2023-01';


-- query 4 who is top spender of the shop in january 2023
SELECT 
    customer.customer_name,
    SUM(product.product_price * orders.qty) AS totalspend
FROM orders
JOIN product 
ON orders.product_id = product.product_id
JOIN customer
ON orders.customer_id = customer.customer_id
GROUP BY customer.customer_name
ORDER BY totalspend DESC
LIMIT 1;

-- Query 5 what item that Gip buy in january 2023
SELECT 
    customer.customer_name,
    product.product_name,
    SUM(orders.qty) AS qty,
    SUM(product.product_price * orders.qty) AS price
FROM orders 
JOIN customer ON customer.customer_id = orders.customer_id
JOIN product ON product.product_id = orders.product_id
WHERE customer.customer_id = 2 
GROUP BY customer.customer_name,product.product_name
ORDER BY product.product_name;




  

