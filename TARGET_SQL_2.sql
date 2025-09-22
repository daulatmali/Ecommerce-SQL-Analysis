-- 3. Evolution of E-commerce orders in the Brazil region:
-- 1. Get the month on month no. of orders placed in each state.

SELECT 
EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
EXTRACT(YEAR FROM order_purchase_timestamp) AS year, 
COUNT (*) as num_orders
FROM `TARGET_SQL.orders`
GROUP BY year, month
ORDER BY year ,month;

#2. Distribution of customers across the Brazil?

SELECT customer_city, customer_state,
COUNT(DISTINCT customer_id) AS customer_count
FROM `TARGET_SQL.customers`
GROUP BY customer_city,customer_state
ORDER BY customer_count DESC;

-- STEP 1 & STEP 2: CALCULATE TOTAL PAYMENT PER YEAR AND COMPARE WITH PREVIOUS YEAR
WITH yearly_totals AS (
    SELECT  
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
        SUM(p.payment_value) AS total_payment
    FROM `TARGET_SQL.payments` AS p
    JOIN `TARGET_SQL.orders` AS o
        ON p.order_id = o.order_id
    WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) IN (2017, 2018)
      AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 8
    GROUP BY EXTRACT(YEAR FROM o.order_purchase_timestamp)
),

yearly_comparisons AS (
    SELECT
        year,
        total_payment,
        LAG(total_payment) OVER (ORDER BY year ASC) AS prev_year_payment
    FROM yearly_totals
)

-- STEP 3: CALCULATE % INCREASE
SELECT
    year,
    total_payment,
    prev_year_payment,
    ROUND(((total_payment - prev_year_payment) / prev_year_payment) * 100, 2) AS pct_increase
FROM yearly_comparisons
WHERE year = 2018;  -- Only show 2018 compared to 2017

#2. Calculate the Total & Average value of order price for each state.

SELECT*
FROM `TARGET_SQL.orders` as o
JOIN `TARGET_SQL.order_items` as oi
ON o.order_id = oi.order_id
JOIN `TARGET_SQL.customers` as c
ON o.customer_id = c.customer_id
