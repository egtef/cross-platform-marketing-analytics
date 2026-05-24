CREATE VIEW `impravado.impravado_campaigns.unified_campaigns` AS

-- Google
SELECT
  date,
  campaign_id,
  campaign_name,
  ad_group_id AS ad_group,
  ad_group_name,
  impressions,
  clicks,
  cost,
  conversions,

  -- Standard KPIs (recalculated)
  SAFE_DIVIDE(clicks, impressions) AS ctr,
  SAFE_DIVIDE(cost, clicks) AS cpc,
  SAFE_DIVIDE(cost, conversions) AS cpa,

  -- Platform-specific
  conversion_value,
  quality_score,


  -- Fill missing fields
  NULL AS video_views,
  NULL AS engagement_rate,
  NULL AS reach,
  NULL AS frequency,
  NULL AS likes,
  NULL AS shares,

  'Google' AS platform

FROM `impravado.impravado_campaigns.google_ads`

UNION ALL

-- Facebook
SELECT
  date,
  campaign_id,
  campaign_name,
  ad_set_id AS ad_group,
  ad_set_name AS ad_group_name,
  impressions,
  clicks,
  spend AS cost,
  conversions,

  -- Standard KPIs
  SAFE_DIVIDE(clicks, impressions) AS ctr,
  SAFE_DIVIDE(spend, clicks) AS cpc,
  SAFE_DIVIDE(spend, conversions) AS cpa,

  -- Platform-specific
  NULL AS conversion_value,
  NULL AS quality_score,
  video_views,
  engagement_rate,
  reach,
  frequency,
  NULL AS likes,
  NULL AS shares,

  'Facebook' AS platform

FROM `impravado.impravado_campaigns.facebook_ads`

UNION ALL

-- TikTok
SELECT
  date,
  campaign_id,
  campaign_name,
  adgroup_id AS ad_group,
  adgroup_name AS ad_group_name,
  impressions,
  clicks,
  cost,
  conversions,

  -- Standard KPIs
  SAFE_DIVIDE(clicks, impressions) AS ctr,
  SAFE_DIVIDE(cost, clicks) AS cpc,
  SAFE_DIVIDE(cost, conversions) AS cpa,

  -- Platform-specific
  NULL AS conversion_value,
  NULL AS quality_score,
  video_views,
  NULL AS engagement_rate,
  NULL AS reach,
  NULL AS frequency,
  likes,
  shares,
  'TikTok' AS platform
FROM `impravado.impravado_campaigns.tiktok`;


