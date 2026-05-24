#EDA Queries Per each Table


#facebook 

#row count
SELECT COUNT(*) AS total_rows
FROM `impravado.impravado_campaigns.facebook_ads`;

#table structure
SELECT column_name, data_type
FROM `impravado.impravado_campaigns.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'facebook_ads';

#Sample data
SELECT * from `impravado.impravado_campaigns.facebook_ads` limit 10;

#Date coverage
SELECT 
  MIN(date) AS min_date,
  MAX(date) AS max_date,
  COUNT(DISTINCT date) AS active_days
FROM `impravado.impravado_campaigns.facebook_ads`;

#Null checks
SELECT
  COUNTIF(clicks IS NULL) AS null_clicks,
  COUNTIF(impressions IS NULL) AS null_impressions,
  COUNTIF(reach IS NULL) AS null_reach
FROM `impravado.impravado_campaigns.facebook_ads`;


#Google

#row count
SELECT COUNT(*) AS total_rows
FROM `impravado.impravado_campaigns.google_ads`;

#table structure
SELECT column_name, data_type
FROM `impravado.impravado_campaigns.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'google_ads';

#Sample data
SELECT * from `impravado.impravado_campaigns.google_ads` limit 10;

#Date coverage
SELECT 
  MIN(date) AS min_date,
  MAX(date) AS max_date,
  COUNT(DISTINCT date) AS active_days
FROM `impravado.impravado_campaigns.google_ads`;

#Null checks
SELECT
  COUNTIF(clicks IS NULL) AS null_clicks,
  COUNTIF(impressions IS NULL) AS null_impressions,
  COUNTIF(cost IS NULL) AS null_cost
FROM `impravado.impravado_campaigns.google_ads`;