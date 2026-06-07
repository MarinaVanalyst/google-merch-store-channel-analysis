-- Q1: Sessions by channel across the full dataset
-- Purpose: understand traffic volume distribution across marketing channels

SELECT
  channelGrouping AS channel,
  SUM(totals.visits) AS total_sessions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY total_sessions DESC
