-- =====================================
-- 3. DATA ANOMALIES & CLEANING CHECKS
-- =====================================

-- Prix négatifs ou nuls
SELECT count(*) AS nb_negative_prices  -- 3687
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
WHERE SAFE_CAST(Price AS FLOAT64) <= 0;

-- Quantités négatives
SELECT count(*) AS nb_negative_quantities -- 12326
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
WHERE SAFE_CAST(Quantity AS INT64) < 0;

-- Factures annulées
SELECT count(*) AS nb_cancelled_invoices -- 10206
FROM `onlineretail-491719.ecommerce_raw.online_retail_2009_2010`
WHERE Invoice LIKE 'C%';

-- Insight:
-- Environ 3 687 lignes présentent un prix inférieur ou égal à 0
-- ces valeurs sont incohérentes pour une transaction commerciale classique

-- peuvent correspondre à :
--    - des erreurs de saisie
--    - des promotions (prix = 0)
--    - des ajustements ou corrections

-- Impact: risque de biaiser le calcul du chiffre d’affaires

-- Action: ces lignes devront être filtrées ou traitées spécifiquement dans les modèles dbt


-- Environ 12K lignes présentent des quantités négatives
-- ces valeurs correspondent probablement à des retours ou remboursements produits
-- Impact:
-- ces transactions doivent être distinguées des ventes classiques

-- Environ 10K factures sont annulées (Invoice commençant par 'C')
-- ces factures correspondent à des commandes annulées ou retournées