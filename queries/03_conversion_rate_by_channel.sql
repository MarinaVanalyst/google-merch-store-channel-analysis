-- Q3: Conversion rate by channel
-- Purpose: measure channel efficiency — which channels turn visitors into buyers
-- Conversion rate = sessions with at least one transaction / total sessions * 100

SELECT
  channelGrouping AS channel,
  SUM(totals.visits) AS total_sessions,
  COUNTIF(totals.transactions >= 1) AS converting_sessions,
  ROUND(COUNTIF(totals.transactions >= 1) / COUNT(*) * 100, 2) AS conversion_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY conversion_rate DESC
