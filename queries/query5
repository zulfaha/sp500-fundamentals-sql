SELECT name, sector, price, week_52_high,
       ROUND((price / week_52_high) * 100, 1) AS pct_of_52wk_high
FROM sp500_companies
WHERE week_52_high IS NOT NULL
ORDER BY pct_of_52wk_high DESC
LIMIT 15;
