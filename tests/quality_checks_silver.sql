/*
===============================================================================
Quality Checks: Silver Layer
===============================================================================
Script Purpose:
    This script performs quality checks to validate data integrity, consistency, 
    and cleanliness in the 'silver' layer after running ETL processes.

Checks included:
    - Null or Invalid Primary Keys
    - Unwanted Spaces in String Columns
    - Data Standardization & Consistency
    - Invalid Date Sequences & Out-of-Range Dates
    - Business Logic Consistency (e.g., Sales = Quantity * Price)
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================================

-- 1. Check for Primary Key Duplicates or Nulls
-- Expectation: No Results
SELECT 
    cst_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- 2. Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    cst_firstname,
    cst_lastname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) 
   OR cst_lastname != TRIM(cst_lastname);

-- 3. Data Standardization & Consistency
SELECT DISTINCT cst_marital_status FROM silver.crm_cust_info;
SELECT DISTINCT cst_gndr FROM silver.crm_cust_info;


-- ====================================================================
-- Checking 'silver.crm_prd_info'
-- ====================================================================

-- 1. Check for Duplicate Product Keys
-- Expectation: No Results
SELECT 
    prd_key,
    COUNT(*) AS duplicate_count
FROM silver.crm_prd_info
GROUP BY prd_key
HAVING COUNT(*) > 1 OR prd_key IS NULL;

-- 2. Check for Invalid Date Orders (End Date before Start Date)
-- Expectation: No Results
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- 3. Data Standardization & Consistency
SELECT DISTINCT prd_line FROM silver.crm_prd_info;


-- ====================================================================
-- Checking 'silver.crm_sales_details'
-- ====================================================================

-- 1. Check for Invalid Dates or Null Order Dates
-- Expectation: No Results
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt IS NULL 
   OR sls_ship_dt < sls_order_dt 
   OR sls_due_dt < sls_order_dt;

-- 2. Check Business Logic Rules (Sales = Quantity * Price)
-- Expectation: No Results
SELECT 
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
   OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0;


-- ====================================================================
-- Checking 'silver.erp_cust_az12'
-- ====================================================================

-- 1. Out-of-Range Birthdates
-- Expectation: No Results
SELECT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate > GETDATE() OR bdate < '1900-01-01';

-- 2. Data Standardization & Consistency
SELECT DISTINCT gen FROM silver.erp_cust_az12;


-- ====================================================================
-- Checking 'silver.erp_loc_a101'
-- ====================================================================

-- 1. Data Standardization & Consistency
SELECT DISTINCT cntry FROM silver.erp_loc_a101 ORDER BY cntry;


-- ====================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ====================================================================

-- 1. Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
   OR subcat != TRIM(subcat)
   OR maintenance != TRIM(maintenance);

-- 2. Data Standardization & Consistency
SELECT DISTINCT cat FROM silver.erp_px_cat_g1v2;
SELECT DISTINCT subcat FROM silver.erp_px_cat_g1v2;
SELECT DISTINCT maintenance FROM silver.erp_px_cat_g1v2;
