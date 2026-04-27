# E-commerce Revenue & Customer Analytics

## Key Result

More than 80% of total revenue ($19.3M) is generated from a single country (UK), while a portion of high-value customers is at risk and several products show abnormal return rates (>100%).

---

## 1. Project Overview

This project delivers an end-to-end analytics solution to analyze revenue performance, customer behavior, and product efficiency in an e-commerce business.

The objective is to transform raw transactional data into actionable insights to support decision-making in marketing, retention, and operations.

---

## 2. Business Problem

The purpose of this project is to:

- Identify where revenue is generated  
- Understand which customers drive value  
- Detect early signals of churn  
- Monitor product performance and return issues  

Core question:

How can we optimize revenue and improve customer lifetime value?

---

## 3. Dataset

- Source: UCI Online Retail II  
- Period: 2009–2011  
- Granularity: Transaction-level  

Key fields:
- Invoice ID  
- Customer ID  
- Product (StockCode, Description)  
- Quantity & Price  
- Country  
- Timestamp  

---

## 4. Tech Stack

- BigQuery — Data warehouse  
- dbt — Data transformation & modeling  
- SQL — Analysis logic  
- GitHub : version control & documentation
- Looker studio : Dashboard & Business insights 

---

## 5. Data Modeling

Star schema:

### Fact Table
- fact_sales  
- Grain: one row = one product per transaction  

Includes:
- revenue (line_amount)  
- quantity  
- business flags  

---

### Dimensions
- dim_customers  
- dim_products  

---

## 6. Data Transformations

### Staging

- SAFE_CAST for type conversion  
- Data cleaning (NULL, formatting)  
- Price normalization  
- Creation of business flags:
  - returns  
  - cancellations  
  - free items  
  - anonymous customers  

---

### Mart Layer

- fact_sales  
- dim_customers  
- dim_products  
- KPI tables  
- RFM segmentation  

---

## 7. Key KPIs

From the dashboard:

- Total Revenue: $19.3M  
- Total Orders: 53.6K  
- Total Customers: 5.96K  
- Average Order Value: $27.27K  

### Customer Metrics

- Total revenue per customer  
- Recency (days since last purchase)  
- Frequency (number of orders)  

---

## 8. Analyses Performed

### Customer Segmentation (RFM)

- VIP  
- Loyal  
- Regular  
- At Risk  
- Low Value  

---

### Product Analysis

- Top revenue-generating products  
- Return rate analysis  

---

### Geographic Analysis

- Revenue by country  
- Market concentration  

---

### Risk Analysis

- Identification of at-risk customers  
- Based on recency and past value  

---

## 9. Dashboard

Interactive dashboard built in Looker Studio.
- ![Dashboard](../OnlineRetail_dbt_Transform/assets/image.png)

### Main components:

- KPI overview  
- Revenue by country (treemap)  
- Customer segmentation (RFM)  
- Top products  
- Product return rates  
- At-risk customers  

Dashboard link:  
https://lookerstudio.google.com/s/hSzpo94YlbQ  

---

## 10. Key Insights

### Revenue concentration

The UK generates the vast majority of revenue (>80%).

Business implication:
High dependency on a single market.

---

### Product performance issues

Several products show return rates above 100%.

Implication:
Potential data inconsistencies or operational issues (returns, pricing, product quality).

---

### Customer risk

A segment of previously valuable customers shows high recency.

Implication:
Opportunity for targeted retention campaigns.

---

### Revenue distribution

A small group of customers contributes disproportionately to total revenue.

Implication:
Typical high-value customer concentration.

---

## 11. Recommendations

### Reduce geographic dependency
- Expand into new markets  
- Diversify acquisition channels  

---

### Fix high-return products
- Review product quality  
- Improve product descriptions  
- Reassess pricing strategy  

---

### Activate at-risk customers
- Targeted email campaigns  
- Promotions  
- Personalized offers  

---

### Strengthen VIP engagement
- Loyalty programs  
- Exclusive benefits  

---

## 12. Business Impact

This project enables:

- Better revenue visibility  
- Improved customer retention strategy  
- Early identification of product issues  
- Data-driven decision-making  

---

## 13. Project Structure
models/
  - staging/
  - marts/
    - busines/
    - core/
    - kpi/
  - Analysis/

analyses/
- eda/ (contains exploratory analysis)

assets/
- dashboard screenshots