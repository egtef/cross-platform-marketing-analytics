# Which campaign drives the best results
SELECT
  campaign_name,
  platform,
  SUM(cost) AS cost,
  SUM(conversions) AS conversions,
  SAFE_DIVIDE(SUM(cost), SUM(conversions)) AS cpa
FROM `impravado.impravado_campaigns.unified_campaigns`
GROUP BY campaign_name, platform
HAVING conversions > 0
ORDER BY conversions DESC
LIMIT 10;