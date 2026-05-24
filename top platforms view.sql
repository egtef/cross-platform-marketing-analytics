#Which platform performs better

SELECT
 
 platform,

  ROUND(SUM(cost),2) AS total_cost,
  SUM(clicks) AS total_clicks,
  SUM(impressions) AS total_impressions,
  SUM(conversions) AS total_conversions,
  ROUND(SAFE_DIVIDE(SUM(clicks), SUM(impressions))*100, 2) AS ctr_percentage,
  ROUND(SAFE_DIVIDE(SUM(cost), SUM(clicks)), 2) AS cpc,
  ROUND(SAFE_DIVIDE(SUM(cost), SUM(conversions)), 2) AS cpa

FROM
  `impravado.impravado_campaigns.unified_campaigns`

GROUP BY platform
ORDER BY total_conversions DESC;