SELECT sector,
       ROUND(AVG(price_earnings), 2) AS avg_pe_ratio
FROM sp500_companies
WHERE price_earnings > 0
GROUP BY sector
ORDER BY avg_pe_ratio DESC;
