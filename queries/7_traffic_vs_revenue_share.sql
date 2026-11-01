-- Q7: Share of sessions compared with share of revenue by channel
-- Purpose: show which channels bring traffic but little revenue, and the opposite
-- Note: revenue stored in micros, divided by 1,000,000 to convert to dollars

SELECT
  channelGrouping AS channel,
  ROUND(SUM(totals.visits) / SUM(SUM(totals.visits)) OVER() * 100, 1) AS pct_of_sessions,
  ROUND(
    IFNULL(SUM(totals.transactionRevenue / 1000000), 0) /
    SUM(SUM(totals.transactionRevenue / 1000000)) OVER() * 100
  , 1) AS pct_of_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY pct_of_sessions DESC
