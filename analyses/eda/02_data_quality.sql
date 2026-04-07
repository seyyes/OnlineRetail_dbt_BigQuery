-- =====================================
-- 2. DATA QUALITY
-- =====================================

-- Valeurs manquantes
SELECT
  COUNTIF(Invoice IS NULL) AS null_invoices, -- 0
  COUNTIF(StockCode IS NULL) AS null_stock_code,-- 0
  COUNTIF(description IS NULL) AS null_description, --2928
  COUNTIF(Quantity IS NULL) AS null_quantities, -- 0
  COUNTIF(InvoiceDate IS NULL) AS null_invoice_date,-- 0
  COUNTIF(CustomerID IS NULL) AS null_customers, -- 107927
  COUNTIF(Country IS NULL) AS null_countries, -- 0
  COUNTIF(Price IS NULL) AS null_prices -- 0
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`;

-- Doublons
SELECT COUNT(*) - COUNT(DISTINCT Invoice || StockCode || InvoiceDate) AS duplicates -- 13332
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`;

-- Insights:
-- La majorité des données est complète (Invoice, StockCode, Date, Price)
-- Cependant il y a une proportion significative de clients inconnus (CustomerID NULL) et de descriptions manquantes. 
-- Il y a donc 107927 commandes sans information client → limite pour analyse CRM
-- 2928 lignes sans description → impact potentiel sur analyse produit

-- Le dataset contient environ 13k doublons basés sur (Invoice, StockCode, InvoiceDate)
-- ces doublons peuvent entraîner une surestimation du chiffre d’affaires et du volume de ventes
-- une étape de déduplication sera nécessaire dans les modèles dbt pour garantir la fiabilité des analyses