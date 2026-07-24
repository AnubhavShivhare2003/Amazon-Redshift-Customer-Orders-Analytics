-- ==========================================================
-- Project : Amazon Redshift Customer Orders Analytics
-- File    : 03_data_quality_checks.sql
-- Purpose : Identify data quality issues in staging tables
-- ==========================================================

------------------------------------------------------------
-- 1. Find Duplicate Customer Records
------------------------------------------------------------

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM stg_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

------------------------------------------------------------
-- 2. Find Duplicate Order Records
------------------------------------------------------------

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

------------------------------------------------------------
-- 3. Find Customers with Missing Email
------------------------------------------------------------

SELECT *
FROM stg_customers
WHERE email IS NULL
   OR TRIM(email) = '';

------------------------------------------------------------
-- 4. Find Customers with Missing State
------------------------------------------------------------

SELECT *
FROM stg_customers
WHERE state IS NULL
   OR TRIM(state) = '';

------------------------------------------------------------
-- 5. Find Orders with Missing Order Amount
------------------------------------------------------------

SELECT *
FROM stg_orders
WHERE order_amount IS NULL;
