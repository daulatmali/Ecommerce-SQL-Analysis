-- Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset: 
-- 1. Data type of all columns in the "customers" table. 
-- 2. Get the time range between which the orders were placed.

select * from `TARGET_SQL.customers`
LIMIT 10;

SELECT * 
FROM `TARGET_SQL.geolocation`
LIMIT 5;

-- 2. Get the time range between which the orders were placed.

SELECT 
min(order_purchase_timestamp) AS start_time,
max(order_purchase_timestamp) AS end_time 
FROM `target-project-472806.TARGET_SQL.orders`;

--3. Count the cities & States of customers who ordered during the given period 

SELECT
c.customer_city,c.customer_state
FROM `TARGET_SQL.orders` AS o
JOIN `TARGET_SQL.customers` AS c 
ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR from o.order_purchase_timestamp) = 2018
AND EXTRACT(MONTH FROM order_purchase_timestamp) BETWEEN 1 AND 3; 

-- 2. In-depth Exploration:

-- 1. Is there a growing trend in the no. of orders placed over the past years?

SELECT
EXTRACT (month from order_purchase_timestamp) as month,
count(order_id) as order_num
FROM `TARGET_SQL.orders`
GROUP BY EXTRACT(month from order_purchase_timestamp)
ORDER BY order_num DESC;

-- 3.During what time of the day, do the Brazilian customers mostly place
-- their orders? (Dawn, Morning, Afternoon or Night)
-- 0-6 hrs: Dawn
-- 7-12 hrs: Mornings
-- 13-18 hrs: Afternoon
-- 19-23 hrs: Night

SELECT
EXTRACT (hour from order_purchase_timestamp) as time,
count(order_id) as order_num
FROM `TARGET_SQL.orders`
GROUP BY EXTRACT(hour from order_purchase_timestamp)
ORDER BY order_num DESC;
