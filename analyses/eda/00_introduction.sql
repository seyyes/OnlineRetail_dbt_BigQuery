-- =====================================
-- EDA - Online Retail Dataset
-- =====================================

-- Objectif
-- Comprendre la structure, la qualité et les patterns business
-- avant modélisation avec dbt

-- Dataset
-- Source: online_retail_2009_2010.csv + online_retail_2010_2011.csv
-- Stocké dans BigQuery: `onlineretail-491719.ecommerce_raw.online_re

-- Questions clés
-- - Quelle est la qualité des données ?
-- - Y a-t-il des anomalies (prix négatifs, quantités négatives) ?
-- - Quels pays génèrent le plus de revenu ?
-- - Quelle part des clients est inconnue ?