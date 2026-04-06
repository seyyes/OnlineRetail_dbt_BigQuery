-- calculer les KPIs globaux à partir de la table fact_sales
WITH source AS (
    SELECT * FROM {{ref('fact_sales')}}
),
global_KPIs AS (
    SELECT 
    -- CA total
    sum(line_amount) AS total_revenue,

    -- 
    count(distinct invoice_id) AS total_orders,
    count(distinct customer_id) AS total_customers,
    -- panier moyen global
    sum(line_amount) / nullif(count(distinct invoice_id), 0) as avg_order_value,
    -- country
    country
    FROM source
    GROUP BY country
)
SELECT * FROM global_KPIs