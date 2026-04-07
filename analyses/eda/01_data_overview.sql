-- =====================================
-- 1. DATA OVERVIEW
-- =====================================

-- Nombre total de lignes
SELECT COUNT(*) AS total_rows
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`;

-- Aperçu des données
SELECT *
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
LIMIT 100;

-- Période couverte
SELECT 
  MIN(InvoiceDate) AS min_date,
  MAX(InvoiceDate) AS max_date
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`;

-- Insights:
-- le dataset compte 525461 lignes
-- les données couvrent la période du 01/12/2009 au 09/12/2010
-- Dataset couvre environ 2 ans d’activité