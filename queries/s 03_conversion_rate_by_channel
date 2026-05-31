-- Q3: Conversion rate by channel
-- Purpose: measure channel efficiency — which channels turn visitors into buyers
-- Conversion rate = sessions with at least one transaction / total sessions * 100

SELECT
  channelGrouping AS channel,
  FORMAT("%'d", SUM(totals.visits)) AS total_sessions,
  FORMAT("%'d",COUNTIF(totals.transactions >= 1)) AS converting_sessions,
  CONCAT(
    ROUND(COUNTIF(totals.transactions >= 1) / COUNT(*) * 100, 2), '%' 
  ) AS conversion_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel
ORDER BY conversion_rate DESC

-- Results (full dataset Jul 2016 - Aug 2017):
-- Referral:       104,838 sessions | 5,322 converting | 5.08% conversion rate
-- Display:          6,262 sessions |   143 converting | 2.28% conversion rate
-- Paid Search:     25,326 sessions |   469 converting | 1.85% conversion rate
-- Direct:         143,026 sessions | 2,061 converting | 1.44% conversion rate
-- Organic Search: 381,561 sessions | 3,443 converting | 0.90% conversion rate
-- (Other):            120 sessions |     1 converting | 0.83% conversion rate
-- Social:         226,117 sessions |   104 converting | 0.05% conversion rate
-- Affiliates:      16,403 sessions |     9 converting | 0.05% conversion rate
