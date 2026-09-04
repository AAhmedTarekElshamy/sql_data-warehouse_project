/*
===============================================================================
Quality Checks: Gold Layer (Star Schema Validation)
===============================================================================
Script Purpose:
    This script performs quality checks on the Gold Layer views to ensure:
    1. Uniqueness of Primary/Surrogate Keys in Dimension Views.
    2. Referential Integrity between Fact and Dimension views (No Orphan Keys).
    3. Data consistency for BI reporting.
===============================================================================
*/

-- ====================================================================
-- 1. Check Uniqueness of Surrogate Keys in gold.dim_customers
-- ====================================================================
-- Expected Result: Empty Result (No Duplicates)
SELECT 
    customer_key, 
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Check Uniqueness of Natural Customer ID
SELECT 
    customer_id, 
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- ====================================================================
-- 2. Check Uniqueness of Surrogate Keys in gold.dim_products
-- ====================================================================
-- Expected Result: Empty Result (No Duplicates)
SELECT 
    product_key, 
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Check Uniqueness of Natural Product Number
SELECT 
    product_number, 
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_number
HAVING COUNT(*) > 1;


-- ====================================================================
-- 3. Check Referential Integrity in gold.fact_sales
-- ====================================================================
-- Verify that all sales records successfully link to a Product Key
-- Expected Result: Empty Result (No NULL product_keys)
SELECT *
FROM gold.fact_sales f
WHERE f.product_key IS NULL;

-- Verify that all sales records successfully link to a Customer Key
-- Expected Result: Empty Result (No NULL customer_keys)
SELECT *
FROM gold.fact_sales f
WHERE f.customer_key IS NULL;


-- ====================================================================
-- 4. Check Data Relationships (Foreign Key Validation)
-- ====================================================================
-- Ensure no orphan records exist between Fact and Customer Dimension
SELECT f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
WHERE c.customer_key IS NULL;

-- Ensure no orphan records exist between Fact and Product Dimension
SELECT f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
WHERE p.product_key IS NULL;
