 # Data Warehouse Project
 
Welcome to my **Data Warehouse Project** repository!  

This project demonstrates a comprehensive end-to-end Data Engineering solution, focusing on building a modern Data Warehouse using the Medallion Architecture (Bronze, Silver, Gold), implementing data quality checks, and modeling data into a Star Schema optimized for analytics.

---

## 🏗️ Data Architecture

The data architecture for this project follows the Medallion Architecture (Bronze, Silver, and Gold layers):

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV files into a SQL Server database.
2. **Silver Layer**: Includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a modern data warehouse using the Medallion Architecture (Bronze, Silver, Gold layers).
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting (Upcoming Phase)**: Preparing the data model for advanced SQL analytical queries and BI dashboards.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Upcoming Phase)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- Customer Behavior
- Product Performance
- Sales Trends

These insights will empower stakeholders with key business metrics, enabling strategic decision-making.

For more details on data definitions, refer to [docs/data_catalog.md](docs/data_catalog.md).

---

## 📂 Repository Structure
data-warehouse-project/
│
├── datasets/                            # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                                # Project documentation and architecture details
│   ├── etl.drawio                       # Draw.io file showing ETL techniques and methods
│   ├── data_architecture.drawio         # Draw.io file showing the project's architecture
│   ├── data_catalog.md                  # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                 # Draw.io file for the data flow diagram
│   ├── data_models.drawio               # Draw.io file for data models (star schema)
│   └── naming-conventions.md            # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                             # SQL scripts for ETL and transformations
│   ├── bronze/                          # Scripts for extracting and loading raw data
│   ├── silver/                          # Scripts for cleaning and transforming data
│   └── gold/                            # Scripts for creating analytical models (Star Schema)
│
├── tests/                               # Test scripts and quality files
│   ├── quality_checks_silver.sql        # Quality validation for Silver Layer
│   └── quality_checks_gold.sql          # Quality validation for Gold Layer
│
├── README.md                            # Project overview and instructions
├── LICENSE                              # License information for the repository
├── .gitignore                           # Files and directories to be ignored by Git
└── requirements.txt                     # Dependencies and requirements for the project 

---

## 🙏 Acknowledgements

This project was built as a hands-on learning exercise, following the **"SQL Data Warehouse from Scratch"** course by Data with Baraa. All credit for the original project design and teaching goes to him — this repository is my own implementation and practice of the concepts covered in the course.

---

## 🛡️ License

This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.

---

## 🔗 Connect with Me

- **LinkedIn:** [Ahmed Tarek](https://www.linkedin.com/in/ahmed-tarik-8098aa230/)
- **GitHub:** [AAhmedTarekElShamy](https://github.com/AAhmedTarekElShamy)
