# S&P 500 Company Fundamentals Analysis
**Tools:** PostgreSQL · pgAdmin 4  
**Dataset:** [S&P 500 Companies with Financial Information](https://www.kaggle.com/datasets/paytonfisher/sp-500-companies-with-financial-information) — Kaggle (Payton Fisher)  
**Skills demonstrated:** Aggregation, filtering, derived columns, sector-level analysis, basic stock screening

---

## Project Overview

A beginner SQL project where I analysed the financial fundamentals of S&P 500 companies — things like which sectors have the highest earnings, which companies are overvalued by P/E ratio, and who's paying dividends. A project I built in early 2025 due to my growing interest in investment analysis.

---

A single flat CSV containing one row per S&P 500 company with data updated last in 2020. It includes

| Column | Description |
|---|---|
| `symbol` | Stock ticker |
| `name` | Company name |
| `sector` | GICS sector classification |
| `price` | Current share price (USD) |
| `price_earnings` | P/E ratio |
| `dividend_yield` | Annual dividend as % of price |
| `earnings_per_share` | EPS (USD) |
| `week_52_low / week_52_high` | 52-week price range |
| `market_cap` | Total market capitalisation (USD) |
| `ebitda` | Earnings before interest, taxes, depreciation & amortisation |
| `price_sales` | Price-to-sales ratio |
| `price_book` | Price-to-book ratio |

Source: Yahoo Finance via Kaggle. Data shows a point-in-time snapshot.

---

## Analysis

### 1. Index Composition by Sector
*How is the S&P 500 distributed across sectors? Before any analysis, this establishes what the index actually contains.*

The S&P 500 is not evenly distributed — Consumer Discretionary and Information Technology dominate by company count, while Telecommunication Services has just 3 constituents, making it by far the smallest sector in the index.

[Full query](/queries/query1.sql)

### 2. Top 10 Companies by Market Capitalisation
*The S&P 500 is market-cap weighted, so the largest companies drive index performance disproportionately. This analysis idetifies these drivers.*

Apple, "Alphabet Inc Class A and C etc are the top 10 — and combined they represent 22.4% of the entire index despite being just 5% of the companies.

[Full query](/queries/query2.sql)

### 3. Average P/E Ratio by Sector
*P/E (price-to-earnings) measures how much investors pay per dollar of earnings. High P/E sectors signal growth expectations; low P/E sectors may reflect maturity or perceived risk. This is the core valuation comparison.*

Technology has the highest average P/E outside of Energy, reflecting market expectations for future earnings growth, while Financials and Utilities trade at lower values consistent with their mature, regulated nature — Energy's outlier position ,likely reflects depressed earnings at the time of the snapshot rather than legit growth expectations.

[Full query](/queries/query3.sql)

### 4. Highest Dividend Yield Stocks
*Dividend yield shows income return relative to share price. Income-oriented investors — pension funds, conservative portfolios — prioritise this metric. This query surfaces the top income-generating holdings.*

High dividend yields are concentrated in Telecommunication Services and Real Estate — real estate driven by REITs which are legally required to distribute the majority of their income, making them structurally attractive to income-focused investors.

[Full query](/queries/query4.sql)

### 5. Stocks Trading Near Their 52-Week High
*A stock near its 52-week high shows sustained price momentum — the market has consistently bid it up. This calculates each stock's current price as a percentage of its annual peak.*

All 15 companies are trading within 7% of their 52-week peak, with Consumer Discretionary appearing most frequently — Scripps and Monsanto were also active acquisition targets at the time (2018), which likely anchored their prices near annual highs rather than reflecting organic momentum alone.

[Full query](/queries/query5.sql)

### 6. Basic Value Screen — Low P/E, Positive Earnings
*A simple value investing filter: companies with a low P/E ratio and positive earnings per share. These are candidates a value investor might investigate further as potentially underpriced relative to their earnings.*

The value screen surfaces predominantly Consumer Discretionary companies in traditional industries — Ford, GM, and Macy's trade at very low multiples despite positive earnings, reflecting market unsureness about their long term relevance rather than current unprofitability.

[Full query](/queries/query6.sql)

---

## Key Findings

- The S&P 500 is heavily concentrated in a small number of sectors; Technology and Consumer Discretionary together account for a large share of index constituents
- P/E ratios vary significantly by sector, with high-growth sectors (e.g. Technology, Consumer Discretionary) commanding materially higher multiples than capital-heavy or regulated sectors (e.g. Financials, Utilities)
- Dividend-paying stocks cluster in mature, stable sectors — Telecommunication Services and Real Estate the high-yield list
- The top 10 companies by market cap represent a disproportionate 22.4% of total index value, reflecting the index's cap-weighted construction
- A basic value screen surfaces companies in traditional industries that may be priced conservatively relative to earnings

---

## Limitations

- **Point-in-time snapshot:** No timestamps in the dataset; trends over time cannot be assessed
- **P/E alone is incomplete:** A low P/E can indicate undervaluation or declining earnings — additional context is required before drawing conclusions
- **No macroeconomic context:** P/E benchmarks shift with interest rate environments; these ratios are not interpreted against that
- **Null filtering introduces bias:** Queries excluding null P/E or dividend values may  exclude certain types of companies (e.g. pre-profit growth firms)

---

## What I Learned

Working with real financial data reinforced how much context matters in interpretation — a P/E ratio only becomes meaningful when compared across sectors or against a market average. SQL aggregation is suited to this kind of cross-sectional screening, and this project served as a foundation for understanding the metrics that appear in equity research before moving to more dynamic time-series analysis.

Completed 19/03/25

---
