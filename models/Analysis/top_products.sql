--Analyse des top produits en termes de revenus générés et de nombre de transactions.
WITH source AS (
    SELECT * FROM {{ ref('fact_sales') }}
),
products AS (
    SELECT * FROM {{ ref('dim_products') }}
),
top_products AS (
    SELECT 
        s.stock_code,
        p.description,
        sum(line_amount) AS total_revenue,
        count(*) AS nb_transactions
    FROM source s
    LEFT JOIN products p ON s.stock_code = p.stock_code
    GROUP BY s.stock_code, p.description
)
SELECT * FROM top_products
ORDER BY total_revenue DESC
LIMIT 10
