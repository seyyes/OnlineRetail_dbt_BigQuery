WITH source AS (
    SELECT * FROM {{ref('dim_customers')}}
),
rfm_scores AS (
    SELECT 
    customer_id,
    recency_days,
    nb_orders,
    country,
    total_revenue,
    -- Calcul des scores RFM
    -- Recency score: plus c'est récent, mieux c'est
    ntile(5) over (order by recency_days asc) as r_score,

        -- Frequency score
    ntile(5) over (order by nb_orders desc) as f_score,

        -- Monetary score
    ntile(5) over (order by total_revenue desc) as m_score
    FROM source
), 
rfm_segments AS (
    SELECT *,
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'VIP'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score <= 2 THEN 'Low Value'
        ELSE 'Regular' 
        END AS customer_segment
    FROM rfm_scores
)
SELECT * FROM rfm_segments