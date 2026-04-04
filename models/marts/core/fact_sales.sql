WITH source AS (
    SELECT * FROM {{ref('stg_online_retail')}}
)
SELECT
    --surrogate key aka primary key   
    
    ABS(FARM_FINGERPRINT(
    CONCAT(
        COALESCE(CAST(invoice_id AS STRING), ''),
        COALESCE(stock_code, ''),
        COALESCE(CAST(invoice_datetime AS STRING), '')
    )
)) AS transaction_id,

    --business keys
    invoice_id,
    stock_code,
    customer_id,

    --dimensions
    date(invoice_datetime) AS invoice_date,
    country,

    --metrics
    quantity,
    price,
    line_amount,

    --flags métier
    is_return,
    is_cancelled,    
    is_free_item

FROM source

