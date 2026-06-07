-- Q2: Revenue, sessions and transactions by channel
-- Purpose: identify which channels drive commercial value vs traffic only
-- Note: revenue stored in micros, divided by 1,000,000 to convert to dollars

SELECT
  channelGrouping AS channel,
  SUM(totals.visits) AS total_sessions,
  ROUND(IFNULL(SUM(totals.transactionRevenue / 1000000), 0), 2) AS total_revenue,
  SUM(totals.transactions) AS total_transactions,
  ROUND(
    SUM(totals.transactionRevenue / 1000000) /
    SUM(SUM(totals.transactionRevenue / 1000000)) OVER() * 100
  , 1) AS pct_of_total_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY total_revenue DESC
