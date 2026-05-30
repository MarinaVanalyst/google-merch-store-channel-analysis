-- Q1: Sessions by channel across the full dataset
-- Purpose: understand traffic volume distribution across marketing channels

SELECT
  channelGrouping AS channel,
  SUM(totals.visits) AS total_sessions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY total_sessions DESC

-- Results (full dataset Jul 2016 - Aug 2017):
-- Organic Search: 381,561 (42% of total traffic)
-- Social:         226,117 (25%)
-- Direct:         143,026 (16%)
-- Referral:       104,838 (12%)
-- Paid Search:     25,326 (3%)
-- Affiliates:      16,403 (2%)
-- Display:          6,262 (1%)
-- (Other):            120 (excluded from analysis)
