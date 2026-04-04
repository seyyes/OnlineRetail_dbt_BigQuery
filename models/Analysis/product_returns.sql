-- Analyse des produits retournés : identifier les produits les plus retournés,le taux de retour
WITH source AS (
    SELECT * FROM {{ref('fact_sales')}}
), 
products AS (
    SELECT * FROM {{ ref('dim_products') }}
),
products_return AS (
    SELECT 
        s.stock_code,
        p.description,
        count(*) AS nb_transactions, --Fréquence de vente du produit
        countif(s.is_return) AS nb_returns,
        round(countif(s.is_return) / nullif(count(*), 0) * 100, 2) AS return_rate -- Another alternative : sum(CASE WHEN s.is_return THEN 1 ELSE 0 END) AS nb_returns,
    FROM source s
    LEFT JOIN products p ON s.stock_code = p.stock_code
    GROUP BY s.stock_code, p.description
    having countif(s.is_return) > 10 -- Eviter les produits avec très peu de transactions pour lesquels le taux de retour peut être biaisé
)
SELECT * FROM products_return
ORDER BY return_rate DESC