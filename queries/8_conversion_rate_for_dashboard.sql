-- Q8: Conversion rate by channel (for the dashboard)
-- Conversion rate = sessions with at least one transaction / all sessions
-- Result is a fraction (0.0508 = 5.08%), so it is formatted as Percent in Looker Studio

SELECT
  channelGrouping AS channel,
  COUNT(*) AS sessions,
  COUNTIF(totals.transactions >= 1) AS converting_sessions,
  ROUND(COUNTIF(totals.transactions >= 1) / COUNT(*), 4) AS conversion_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY conversion_rate DESC
