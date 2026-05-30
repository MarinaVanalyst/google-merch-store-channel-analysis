-- Q2: Revenue, sessions and transactions by channel
-- Purpose: identify which channels drive commercial value vs traffic only
-- Note: revenue stored in micros, divided by 1,000,000 to convert to dollars

SELECT
  channelGrouping AS channel,
  FORMAT("%'d", SUM(totals.visits)) AS total_sessions,
  CONCAT('$', FORMAT("%'.2f", ROUND(SUM(totals.transactionRevenue / 1000000), 2))) AS total_revenue,
  FORMAT("%'d", SUM(totals.transactions)) AS total_transactions,
  CONCAT(
    ROUND(
      SUM(totals.transactionRevenue / 1000000) /
      SUM(SUM(totals.transactionRevenue / 1000000)) OVER() * 100
    , 2),
    '%'
  ) AS pct_of_total_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY SUM(totals.transactionRevenue) DESC


-- Results (full dataset Jul 2016 - Aug 2017):
-- Referral:       104,838 sessions | $651,429.91 | 5,543 transactions | 42.3% of revenue
-- Direct:         143,026 sessions | $434,840.55 | 2,219 transactions | 28.2% of revenue
-- Organic Search: 381,561 sessions | $326,380.51 | 3,581 transactions | 21.2% of revenue
-- Display:          6,262 sessions | $78,337.46  |   152 transactions |  5.1% of revenue
-- Paid Search:     25,326 sessions | $43,558.90  |   479 transactions |  2.8% of revenue
-- Social:         226,117 sessions | $4,916.54   |   131 transactions |  0.3% of revenue
-- Affiliates:      16,403 sessions | $597.38     |     9 transactions |  0.0% of revenue
-- (Other):            120 sessions | $9.99       |     1 transaction  |  0.0% of revenue
