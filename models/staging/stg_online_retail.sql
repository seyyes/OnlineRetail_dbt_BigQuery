-- Staging model for online retail data

-- Uniting the 2 source files
WITH combined_sources AS(
    SELECT * FROM {{source('ecommerce_raw', 'online_retail_2009_2010')}}
    UNION ALL
    SELECT * FROM {{source('ecommerce_raw', 'online_retail_2010_2011')}}
),
-- cleaning, renaming and formating the data   
cleaned_data AS(
    SELECT 
    --Ids
    CAST(Invoice AS string) AS invoice_id,
    CAST(StockCode AS string) AS stock_code,
    CAST(CustomerID AS string) AS customer_id,

    --Text
    TRIM(Description) AS description,
    TRIM(Country) AS country,

    --Numeric
    SAFE_CAST(Quantity AS int64) AS quantity,
    SAFE_CAST(replace(nullif(Price, ''), ',', '.') AS float64) AS price,   
    
    --Date
    SAFE.PARSE_TIMESTAMP('%m/%d/%y %H:%M', InvoiceDate) AS invoice_datetime,

    --Flags métier
    CASE 
    WHEN SAFE_CAST(Quantity AS int64) < 0 THEN TRUE
    ELSE FALSE
    END AS is_return,

    CASE 
    WHEN CAST(Invoice AS string) LIKE 'C%' THEN TRUE
    ELSE FALSE
    END AS is_cancelled,

    CASE 
    WHEN CustomerID IS NULL OR CustomerID = '' THEN TRUE
    ELSE FALSE
    END AS is_anonymous_customer,

    CASE 
    WHEN SAFE_CAST(replace(nullif(Price, ''), ',', '.') AS float64) = 0 THEN TRUE
    ELSE FALSE
    END AS is_free_item,

    -- Metrics
    SAFE_CAST(Quantity AS int64) * SAFE_CAST(replace(nullif(Price, ''), ',', '.') AS float64) AS line_amount

FROM combined_sources

)
SELECT * FROM cleaned_data