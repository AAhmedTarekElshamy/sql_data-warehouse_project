 # Data Dictionary for Gold Layer

## Overview
The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact tables** for specific business metrics.

---

### 1. gold.dim_customers

* **Purpose:** Stores customer details enriched with demographic and geographic data.
* **Columns:**

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `customer_key` | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| `customer_id` | INT | Unique numerical identifier assigned to each customer. |
| `customer_number` | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| `first_name` | NVARCHAR(50) | The customer's first name, as recorded in the system. |
| `last_name` | NVARCHAR(50) | The customer's last name or family name. |
| `country` | NVARCHAR(50) | The country of residence for the customer (e.g., 'Australia'). |
| `marital_status` | NVARCHAR(50) | The marital status of the customer (e.g., 'Married', 'Single'). |
| `gender` | NVARCHAR(50) | Gender identity of the customer (e.g., 'Male', 'Female', 'n/a'). |
| `birthdate` | DATE | The birth date of the customer. |
| `create_date` | DATE | Date when the customer record was created in the system. |

---

### 2. gold.dim_products

* **Purpose:** Stores product details including category hierarchies and lifecycle specifications.
* **Columns:**

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `product_key` | INT | Surrogate key uniquely identifying each product record. |
| `product_id` | INT | Unique numerical identifier assigned to each product. |
| `product_number` | NVARCHAR(50) | Alphanumeric product code used for tracking. |
| `product_name` | NVARCHAR(50) | Descriptive name of the product. |
| `category_id` | NVARCHAR(50) | Identifier referencing the product category. |
| `category` | NVARCHAR(50) | High-level product category classification. |
| `subcategory` | NVARCHAR(50) | Detailed sub-classification of the product. |
| `maintenance` | NVARCHAR(50) | Indicates whether maintenance is required for the product. |
| `cost` | INT | Manufacturing or procurement cost of the product. |
| `product_line` | NVARCHAR(50) | Product line classification (e.g., 'Road', 'Mountain'). |
| `start_date` | DATE | Start date from which the product became active. |

---

### 3. gold.fact_sales

* **Purpose:** Stores sales transactions and key measures linked to customer and product dimensions.
* **Columns:**

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `order_number` | NVARCHAR(50) | Unique identifier for each sales transaction or invoice. |
| `product_key` | INT | Foreign key referencing `gold.dim_products(product_key)`. |
| `customer_key` | INT | Foreign key referencing `gold.dim_customers(customer_key)`. |
| `order_date` | DATE | Date when the order was placed by the customer. |
| `shipping_date` | DATE | Date when the order was shipped. |
| `due_date` | DATE | Due date for payment or order fulfillment. |
| `sales_amount` | INT | Total revenue generated from the sale. |
| `quantity` | INT | Number of items purchased in the transaction. |
| `price` | INT | Unit price of the product at the time of sale. |
