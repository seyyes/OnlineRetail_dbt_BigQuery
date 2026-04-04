WITH source AS (
    SELECT * FROM {{ref('stg_online_retail')}}
),
cleaned_source AS (-- car stockcode + description n'est pas une combinaison unique
    SELECT 
    stock_code,
    description,
    price,
    customer_id,
    invoice_datetime
    FROM source
    WHERE description IS NOT NULL and description != '' --les valeurs nulles créent des doublons sur stockcode et des erreurs en test
),
description_ranked AS (
    SELECT 
    stock_code,
    description,
    count(*) as nb_occurences,
    row_number() OVER(
        PARTITION BY stock_code
        ORDER BY count(*) DESC
    ) as rn 
    FROM cleaned_source
    GROUP BY stock_code, description
),
products AS (
    SELECT
    -------Id
    s.stock_code,
    d.description,
    -------Metrics
    min(price) AS min_price,
    max(price) AS max_price,
    avg(price) AS avg_price,
    count(*) AS nb_transactions,
    count(DISTINCT s.customer_id) AS nb_customers,
    min(s.invoice_datetime) AS first_sale_date,
    max(s.invoice_datetime) AS last_sale_date
    FROM source s 
    LEFT JOIN description_ranked d
    ON s.stock_code = d.stock_code 
    AND d.rn = 1 --garder la description la plus fréquente pour chaque stockcode
    GROUP BY stock_code, description
)
SELECT * FROM products