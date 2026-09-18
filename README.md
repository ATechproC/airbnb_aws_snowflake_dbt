# 🏠 Airbnb End-to-End Data Engineering Project

An end-to-end **Data Engineering pipeline** built to transform raw Airbnb data into clean, structured, and analytics-ready datasets using **Snowflake, dbt, AWS S3, SQL, Python, and Jinja**.

The project demonstrates modern data engineering practices including **Medallion Architecture, incremental loading, data quality testing, data lineage, and Slowly Changing Dimensions (SCD Type 2)**.

---

## 📌 Project Overview

The goal of this project is to build a complete data pipeline that takes Airbnb data through multiple processing layers before making it available for analytics.

The pipeline follows this flow:

```text
                 ┌──────────────┐
                 │  Source CSV  │
                 └──────┬───────┘
                        │
                        ▼
                 ┌──────────────┐
                 │    AWS S3    │
                 └──────┬───────┘
                        │
                        ▼
              ┌────────────────────┐
              │ Snowflake Staging  │
              └─────────┬──────────┘
                        │
                        ▼
              ┌────────────────────┐
              │   🥉 Bronze Layer  │
              │       Raw Data     │
              └─────────┬──────────┘
                        │
                        ▼
              ┌────────────────────┐
              │   🥈 Silver Layer │
              │ Cleaned & Standard│
              └─────────┬──────────┘
                        │
                        ▼
              ┌────────────────────┐
              │    🥇 Gold Layer  │
              │ Analytics Ready   │
              └─────────┬──────────┘
                        │
                        ▼
                  📊 Analytics
```

---

## 🏗️ Architecture

The project uses a **Medallion Architecture** to separate raw, transformed, and business-ready data.

### 🥉 Bronze Layer

The Bronze layer contains data with minimal transformations.

Main models:

* `bronze_bookings`
* `bronze_hosts`
* `bronze_listings`

Purpose:

* Preserve source data
* Apply minimal transformations
* Provide a reliable foundation for downstream processing

---

### 🥈 Silver Layer

The Silver layer contains cleaned and standardized data.

Main models:

* `silver_bookings`
* `silver_hosts`
* `silver_listings`

Transformations include:

* Data cleaning
* Standardization
* Validation
* Business rules
* Price categorization

---

### 🥇 Gold Layer

The Gold layer contains datasets designed for analytics and reporting.

Main models:

* `fact`
* `obt`

The **OBT (One Big Table)** combines relevant information from bookings, listings, and hosts into a denormalized dataset suitable for analytical workloads.

---

## 🛠️ Technology Stack

| Technology   | Purpose                        |
| ------------ | ------------------------------ |
| ❄️ Snowflake | Cloud Data Warehouse           |
| 🔧 dbt       | Data Transformation & Modeling |
| ☁️ AWS S3    | Cloud Storage                  |
| 🐍 Python    | Project Setup & Automation     |
| SQL          | Data Transformation            |
| Jinja        | Dynamic SQL Generation         |
| Git          | Version Control                |

---

## 🔄 Data Engineering Concepts

### Incremental Models

The project uses dbt incremental models to process only new or changed records instead of rebuilding entire tables.

### 📸 Slowly Changing Dimensions — SCD Type 2

dbt snapshots are used to preserve historical changes.

The project tracks historical changes for:

* Bookings
* Hosts
* Listings

## 🧪 Data Quality

Data quality is an important part of the pipeline.

The project includes tests for:

* Unique identifiers
* NOT NULL constraints
* Referential integrity
* Source validation
* Business rules

## 🔍 Data Lineage

dbt provides a visual representation of dependencies between models.

```text
Sources
   │
   ▼
Bronze
   │
   ▼
Silver
   │
   ├──────────────┐
   ▼              ▼
 Fact            OBT
   │              │
   └──────┬───────┘
          ▼
      Analytics
```

---

## 📁 Project Structure

```text
airbnb_project/
│
├── SourceData/
│   ├── bookings.csv
│   ├── hosts.csv
│   └── listings.csv
│
├── DDL/
│   ├── ddl.sql
│   └── resources.sql
│
├── aws_dbt_snowflake_project/
│   │
│   ├── dbt_project.yml
│   ├── models/
│   │   │
│   │   ├── sources/
│   │   │   └── sources.yml
│   │   │
│   │   ├── bronze/
│   │   │   ├── bronze_bookings.sql
│   │   │   ├── bronze_hosts.sql
│   │   │   └── bronze_listings.sql
│   │   │
│   │   ├── silver/
│   │   │   ├── silver_bookings.sql
│   │   │   ├── silver_hosts.sql
│   │   │   └── silver_listings.sql
│   │   │
│   │   └── gold/
│   │       ├── fact.sql
│   │       ├── obt.sql
│   │       └── ephemeral/
│   │
│   ├── macros/
│   │   ├── generate_schema_name.sql
│   │   ├── multiply.sql
│   │   ├── tag.sql
│   │   └── trimmer.sql
│   │
│   ├── snapshots/
│   │   ├── dim_bookings.yml
│   │   ├── dim_hosts.yml
│   │   └── dim_listings.yml
│   │
│   ├── analyses/
│   │
│   ├── tests/
│   │
│   └── seeds/
│
├── main.py
├── pyproject.toml
└── README.md
```

---

## 📊 Data Model

The project works with three main source datasets:

### Bookings

Contains information related to Airbnb bookings.

### Hosts

Contains information about Airbnb hosts.

### Listings

Contains information about properties listed on Airbnb.

These datasets are progressively transformed through the Bronze, Silver, and Gold layers.

---

## 🔐 Security & Best Practices

The project follows several data engineering best practices:

* Credentials are not stored in the repository
* Snowflake schemas are separated by transformation layer
* Reusable dbt macros reduce duplicated SQL
* Incremental models reduce unnecessary processing
* Data quality tests validate transformations
* Git is used for version control
* dbt documentation provides model visibility and lineage

---

## 📚 What This Project Demonstrates

This project demonstrates practical experience with:

```text
Data Ingestion
      ↓
Data Warehousing
      ↓
Data Transformation
      ↓
Data Modeling
      ↓
Data Quality
      ↓
Historical Data
      ↓
Analytics-Ready Data
```
