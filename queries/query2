SELECT name, sector, market_cap
FROM sp500_companies
ORDER BY market_cap DESC
LIMIT 10;

SELECT 
    ROUND(SUM(CASE WHEN market_cap IN (
        SELECT market_cap FROM sp500_companies 
        ORDER BY market_cap DESC LIMIT 10
    ) THEN market_cap ELSE 0 END) * 100.0 / SUM(market_cap), 1) AS top10_pct_of_total
FROM sp500_companies;
