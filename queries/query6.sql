SELECT name, sector, price_earnings, earnings_per_share
FROM sp500_companies
WHERE price_earnings BETWEEN 5 AND 15
  AND earnings_per_share > 0
ORDER BY price_earnings ASC
LIMIT 10;
