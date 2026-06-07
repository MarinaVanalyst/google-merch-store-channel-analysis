-- Q5: Monthly revenue trend by channel
-- Purpose: identify seasonal patterns and growth or decline trends per channel
-- Note: August 2017 is incomplete as the dataset ends mid-month and should be excluded from trend conclusions
-- Note: revenue stored in micros, divided by 1,000,000 to convert to dollars
-- Note: IFNULL used to replace missing revenue with 0 for completeness

SELECT 
  FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date)) AS year_month,
  channelGrouping AS channel,
  ROUND(IFNULL(SUM(totals.transactionRevenue / 1000000), 0), 2) AS total_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY channel, FORMAT_DATE('%Y-%m', PARSE_DATE('%Y%m%d', date))
ORDER BY year_month ASC

-- Key findings:
-- Referral is consistently the top revenue channel every single month
-- December 2016 peak across all channels likely reflects Christmas shopping behaviour
-- February 2017 Direct spike may reflect seasonal gifting around Valentine's Day
-- April 2017 Display spike from near zero to $42,000 suggests a specific campaign launch
-- Organic Search remains steady throughout with no significant peaks or troughs
-- August 2017 figures are incomplete and excluded from trend analysis
