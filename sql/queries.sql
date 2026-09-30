


-- =========================================
-- 1. TOP 5 HIGHEST SELLING PRODUCTS
-- =========================================

SELECT 
    product_id,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 5;


-- =========================================
-- 2. MONTHLY REVENUE TREND
-- =========================================

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================
-- 3. AVERAGE ORDER VALUE (AOV) PER CUSTOMER
-- =========================================

SELECT 
    customer_id,
    AVG(total_amount) AS average_order_value
FROM sales
GROUP BY customer_id
ORDER BY average_order_value DESC;


-- =========================================
-- 4. BEST PERFORMING PRODUCT CATEGORIES
-- =========================================

SELECT 
    category,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;


-- =========================================
-- 5. REPEAT CUSTOMERS & CONTRIBUTION
-- =========================================

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_contribution
FROM sales
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_contribution DESC;


-- =========================================
-- 6. PEAK ORDER DAYS
-- =========================================

SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY order_day
ORDER BY total_orders DESC;


-- =========================================
-- 7. PRODUCT RANKING BY SALES
-- =========================================

SELECT 
    product_id,
    SUM(total_amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(total_amount) DESC
    ) AS sales_rank
FROM sales
GROUP BY product_id;


-- =========================================
-- 8. TOTAL REVENUE
-- =========================================

SELECT 
    SUM(total_amount) AS total_revenue
FROM sales;


-- =========================================
-- 9. TOTAL ORDERS
-- =========================================

SELECT 
    COUNT(order_id) AS total_orders
FROM sales;


-- =========================================
-- 10. RETURNED ORDERS ANALYSIS
-- =========================================

SELECT 
    returned,
    COUNT(*) AS total_orders
FROM sales
GROUP BY returned;


-- =========================================
-- 11. PAYMENT METHOD ANALYSIS
-- =========================================

SELECT 
    payment_method,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY payment_method
ORDER BY total_sales DESC;


-- =========================================
-- 12. REGION-WISE SALES
-- =========================================

SELECT 
    region,
    SUM(total_amount) AS regional_sales
FROM sales
GROUP BY region
ORDER BY regional_sales DESC;


-- =========================================
-- 13. CUSTOMER GENDER ANALYSIS
-- =========================================

SELECT 
    customer_gender,
    COUNT(customer_id) AS total_customers,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY customer_gender;


-- =========================================
-- 14. AVERAGE DELIVERY TIME
-- =========================================

SELECT 
    AVG(delivery_time_days) AS avg_delivery_days
FROM sales;


-- =========================================
-- 15. PROFIT ANALYSIS
-- =========================================

SELECT 
    category,
    SUM(profit_margin) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
