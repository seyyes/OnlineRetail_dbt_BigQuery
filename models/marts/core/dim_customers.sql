WITH source AS(
    SELECT * FROM {{ref('stg_online_retail')}}
    WHERE customer_id IS NOT NULL AND customer_id != '' --filtrer les clients anonymes
),
customers AS (
    SELECT 
    customer_id,
    any_value(country) AS country,

    --activité
    count(distinct invoice_id) AS nb_orders,
    sum(quantity) AS total_quantity,

    --valeur
    sum(line_amount) AS total_revenue,
    sum(line_amount) / nullif(count(distinct invoice_id), 0) as avg_order_value,-- éviter division par 0

    --temporalité
    min(invoice_datetime) AS first_purchase_date,
    max(invoice_datetime) AS last_purchase_date,
    date_diff(current_date(), DATE(max(invoice_datetime)), day) AS recency_days
    FROM source
    GROUP BY customer_id
)
SELECT * FROM customers