SELECT sector, COUNT(*) AS num_companies
FROM sp500_companies
GROUP BY sector
ORDER BY num_companies DESC;
