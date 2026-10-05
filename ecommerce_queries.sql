
-- Task 3: SQL for Data Analysis
-- E-commerce Sales Analysis

-- 1. SELECT
SELECT *
FROM ecommerce
LIMIT 20;

-- 2. WHERE
SELECT order_id, category, qty, amount, status
FROM ecommerce
WHERE amount > 1000
LIMIT 20;

-- 3. ORDER BY
SELECT order_id, category, qty, amount, revenue
FROM ecommerce
ORDER BY revenue DESC
LIMIT 10;

-- 4. GROUP BY
SELECT category,
       SUM(revenue) AS total_revenue
FROM ecommerce
GROUP BY category
ORDER BY total_revenue DESC;

-- 5. Aggregate Functions
SELECT
    COUNT(*) AS total_records,
    SUM(revenue) AS total_revenue,
    AVG(revenue) AS average_revenue,
    MAX(revenue) AS maximum_revenue,
    MIN(revenue) AS minimum_revenue
FROM ecommerce;

-- 6. Average Revenue by Category
SELECT category,
       AVG(revenue) AS average_revenue
FROM ecommerce
GROUP BY category
ORDER BY average_revenue DESC;

-- 7. Count Orders by Status
SELECT status,
       COUNT(*) AS total_orders
FROM ecommerce
GROUP BY status
ORDER BY total_orders DESC;

-- 8. Subquery
SELECT order_id,
       category,
       revenue
FROM ecommerce
WHERE revenue > (
    SELECT AVG(revenue)
    FROM ecommerce
)
ORDER BY revenue DESC
LIMIT 20;

-- 9. Create View
CREATE VIEW category_revenue AS
SELECT category,
       SUM(revenue) AS total_revenue,
       AVG(revenue) AS average_revenue,
       COUNT(*) AS total_orders
FROM ecommerce
GROUP BY category;

-- 10. Use View
SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;

-- 11. Create Index
CREATE INDEX idx_order_id
ON ecommerce(order_id);

-- 12. INNER JOIN
SELECT e.order_id,
       e.category,
       e.revenue,
       c."ship-city",
       c."ship-state"
FROM ecommerce e
INNER JOIN customers c
ON e.order_id = c.order_id
LIMIT 20;

-- 13. LEFT JOIN
SELECT e.order_id,
       e.category,
       e.revenue,
       c."ship-city",
       c."ship-state"
FROM ecommerce e
LEFT JOIN customers c
ON e.order_id = c.order_id
LIMIT 20;
