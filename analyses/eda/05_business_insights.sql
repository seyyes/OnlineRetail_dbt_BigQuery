-- =====================================
-- 5. BUSINESS INSIGHTS
-- =====================================

-- Revenue par pays
SELECT
  Country,
  COUNT(*) AS nb_transactions,
  SUM(SAFE_CAST(Quantity AS INT64) * SAFE_CAST(Price AS FLOAT64)) AS revenue
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;

-- Insight:
-- Le Royaume-Uni domine largement en nombre de transactions et en revenu: C'est lemarché principal de l’entreprise

-- Les autres pays (Allemagne, France) contribuent significativement mais restent loin derrière
-- → activité internationale présente mais secondaire

-- Clients uniques
SELECT 
  COUNT(DISTINCT CustomerID) AS nb_clients
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`;

-- Clients inconnus
SELECT 
  COUNT(DISTINCT Invoice) AS nb_commandes_impactees
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
WHERE CustomerID IS NULL;

--Insight:
-- Forte proportion de clients inconnus → limite pour analyse CRM