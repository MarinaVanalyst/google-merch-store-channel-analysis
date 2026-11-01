-- Q4: Channels with high traffic but low revenue
-- Purpose: identify where budget may be misallocated
-- Threshold: channels generating less than 1% of total revenue are flagged
-- Note: IFNULL makes sure that channels with no revenue at all are also flagged

SELECT *
FROM (
  SELECT
    channelGrouping AS channel,
    SUM(totals.visits) AS total_sessions,
    ROUND(IFNULL(SUM(totals.transactionRevenue / 1000000), 0), 2) AS total_revenue,
    ROUND(
      IFNULL(SUM(totals.transactionRevenue / 1000000), 0) /
      SUM(SUM(totals.transactionRevenue / 1000000)) OVER() * 100
    , 2) AS pct_of_total_revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  GROUP BY channel
)
WHERE pct_of_total_revenue < 1
ORDER BY total_sessions DESC
