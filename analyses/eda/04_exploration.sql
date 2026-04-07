-- =====================================
-- 4. EXPLORATORY ANALYSIS
-- =====================================

-- Transactions par pays
SELECT
  Country,
  COUNT(*) AS nb_transactions
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
GROUP BY Country
ORDER BY nb_transactions DESC;

-- Insight:
-- UK domine largement en volume: C'est donc le marché principalde l'entreprise