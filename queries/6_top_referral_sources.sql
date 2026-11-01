-- Q6: Top referral sources by revenue
-- Purpose: check which websites drive Referral performance before acting on Finding 1
-- Note: revenue stored in micros, divided by 1,000,000 to convert to dollars

SELECT
  trafficSource.source AS source,
  SUM(totals.visits) AS total_sessions,
  ROUND(IFNULL(SUM(totals.transactionRevenue / 1000000), 0), 2) AS total_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE channelGrouping = 'Referral'
GROUP BY source
ORDER BY total_revenue DESC
LIMIT 10
