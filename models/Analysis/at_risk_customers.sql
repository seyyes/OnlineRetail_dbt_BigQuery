--Analysis to identify at-risk customers based on their purchasing behavior. 
WITH source AS (
    SELECT * FROM {{ ref('rfm_segmentation') }}
),
at_risk_customers AS (
    SELECT 
        customer_id, 
        total_revenue,
        nb_orders,
        recency_days,
        customer_segment
    FROM source
    WHERE customer_segment = 'At Risk'
    AND nb_orders >= 3 -- Pour ne orendre en compte que les clients réguliers
)
SELECT * FROM at_risk_customers
ORDER BY total_revenue DESC
