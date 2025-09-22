# 📘 Project Description: Ecommerce SQL Analysis

## 🔹 Introduction
This project focuses on analyzing the **Brazilian E-commerce Public Dataset** using SQL.  
The dataset contains information about customer orders, order items, payments, freight, and delivery timelines.  

The goal is to explore **business insights** such as customer distribution, payment preferences, freight costs, delivery performance, and year-over-year growth.

---

## 🔹 Objectives
The project addresses the following key business questions:

1. **Evolution of Orders**
   - How many orders are placed month-on-month?
   - Which states contribute the most to order growth?

2. **Customer Distribution**
   - How are customers spread across different cities and states?

3. **Payment Trends**
   - What are the different payment types?
   - How does the number of orders vary month-on-month by payment type?

4. **Revenue Growth**
   - What is the total payment value in 2017 vs 2018?
   - What is the percentage increase in revenue from Jan–Aug 2017 to Jan–Aug 2018?

5. **Freight and Delivery**
   - What is the average freight cost per state?
   - How long does it take (on average) for an order to be delivered in each state?

---

## 🔹 Files in Repository
- **`sql_scripts/TARGET_SQL_PROJECT.sql`**  
  Contains main analysis queries covering order trends, customer distribution, payment types, freight value, and delivery times.

- **`sql_scripts/TARGET_SQL_2.sql`**  
  Additional queries including order evolution, state-level aggregation, and year-over-year revenue comparison.

- **`README.md`**  
  High-level project overview and instructions.

- **`PROJECT_DESCRIPTION.md`**  
  (This file) Detailed explanation of objectives, approach, and insights.

---

## 🔹 Methodology
1. **Dataset Import**  
   - Data tables: `orders`, `order_items`, `payments`, `customers`.  
   - Platform: Google BigQuery (can be adapted to other SQL engines).

2. **Data Exploration**  
   - Extracted time-based features (Year, Month) using `EXTRACT()`.  
   - Calculated aggregate metrics such as `COUNT(DISTINCT order_id)`, `AVG(freight_value)`, and `SUM(payment_value)`.

3. **Business Analysis**  
   - Delivery performance measured as difference between `order_purchase_timestamp` and `order_delivered_customer_date`.  
   - Revenue growth calculated using **window functions (`LAG()`)** for year-to-year comparison.  
   - Payment type analysis grouped by month.

---

## 🔹 Sample Insights
- 📈 **Order Growth**: Strong growth in 2018 compared to 2017.  
- 🛒 **Customer Spread**: Major customer clusters found in São Paulo and Rio de Janeiro.  
- 💳 **Payment Preferences**: Credit card dominates as the most used payment method, followed by boleto.  
- 🚚 **Freight Costs**: Northern states tend
