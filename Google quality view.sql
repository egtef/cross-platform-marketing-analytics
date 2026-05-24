# Google quality insight:
SELECT
  campaign_name,
  ROUND(AVG(quality_score),2) AS avg_quality_score,
  ROUND(SAFE_DIVIDE(SUM(clicks), SUM(impressions))*100,2) AS ctr
FROM `impravado.impravado_campaigns.unified_campaigns`
WHERE platform = 'Google'
GROUP BY campaign_name
ORDER BY avg_quality_score DESC;