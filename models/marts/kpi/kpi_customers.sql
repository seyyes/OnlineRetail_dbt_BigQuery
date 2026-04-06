--Analyse métier
WITH source AS (
    SELECT * FROM {{ref('dim_customers')}}
),
customer_KPIs AS (
    SELECT
    customer_id,
    total_revenue,
    nb_orders,
    avg_order_value,
    recency_days, 
    country
    FROM source

)
SELECT * FROM customer_KPIs