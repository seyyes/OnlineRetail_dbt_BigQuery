# E-commerce Analytics Project

## Objective

Analyze an e-commerce dataset to identify opportunities to:
- Improve revenue performance
- Increase customer value
- Detect risky customer behavior
- Perform RFM Analysis

---

## Data Stack

- **BigQuery** : Data warehouse
- **dbt** : Data transformation & modeling
- **Looker Studio** : Dashboard & visualization

---

## Data Pipeline

### 1. Data Ingestion
- Source: UCI Online Retail II dataset
- Loaded into BigQuery

---

### 2. Data Cleaning (dbt staging)

- Type casting (SAFE_CAST)
- Handling missing values
- Data normalization
- Creation of business flags:
  - Returns
  - Cancellations
  - Free items
  - Anonymous customers

---

### 3. Data Modeling

Star schema:

- `fact_sales`
- `dim_customers`
- `dim_products`

---

### 4. KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

---

### 5. Advanced Analytics

#### RFM Segmentation

Customers segmented into:
- VIP
- Loyal
- Regular
- At Risk
- Low Value

---

### 6. Business Insights

- Revenue is highly concentrated in the UK (>80%)
- Some products have extremely high return rates (>100%)
- A segment of previously active customers is now at risk

---

## Dashboard

Interactive dashboard built in Looker Studio:

Features:
- KPI overview
- Country performance (treemap)
- Customer segmentation (RFM)
- Product performance
- Return analysis
- At-risk customers
- View dashboard: https://lookerstudio.google.com/s/hSzpo94YlbQ
- Dashboard preview in (snapshots/Performance_Insights_Dashboard.png)
---

## Skills Demonstrated

- SQL (BigQuery)
- dbt (modular transformations)
- Data modeling (star schema)
- Business analysis
- Dashboard design
- Data storytelling
