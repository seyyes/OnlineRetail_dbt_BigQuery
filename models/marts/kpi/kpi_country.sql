--Analyse métier
WITH source AS (
    SELECT * FROM {{ref('fact_sales')}}
),
country_KPIs AS (
    SELECT 
    country, 
    -- CA total
    sum(line_amount) AS total_revenue,
    count(distinct invoice_id) AS total_orders,
    count(distinct customer_id) AS total_customers
    FROM source
    GROUP BY country
)
SELECT * FROM country_KPIs