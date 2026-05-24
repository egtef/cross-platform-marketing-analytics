# Are things improving or declining?

SELECT
  date,
  platform,
  ROUND(SUM(cost),2) AS cost,
  SUM(conversions) AS conversions,
  ROUND(SAFE_DIVIDE(SUM(conversions), SUM(cost)), 2) AS conv_per_cost
FROM `impravado.impravado_campaigns.unified_campaigns`
GROUP BY date, platform
ORDER BY date;