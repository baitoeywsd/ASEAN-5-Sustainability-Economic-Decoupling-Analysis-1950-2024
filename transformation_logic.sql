-- 1. CLEANUP: Delete old view if exists
DROP VIEW IF EXISTS v_asean_sustainability_analysis;

-- 2. TRANSFORMATION: Join and Metric Engineering
CREATE VIEW v_asean_sustainability_analysis AS
WITH raw_merged AS (
    SELECT 
        g.Year,           -- Primary Key 1
        g.Country,        -- Primary Key 2
        g.gdp_growth,
        g.gdp_ppp_billions,
        g.population_millions,
        g.gdp_per_capita_ppp,
        g.inflation_rate,
        c.co2,            -- From co2_emission table
        c.co2_per_capita  -- For TOC Section 3
    FROM asean_gdp_master g
    INNER JOIN co2_emission c 
        ON g.Year = c.year AND g.Country = c.country
),
calculated_metrics AS (
    SELECT 
        *,
        -- TOC 3: Carbon Intensity of Economy (CIE)
        (co2 / NULLIF(gdp_ppp_billions, 0)) AS carbon_intensity,
        
        -- Window Function for YoY Analysis
        LAG(co2) OVER (PARTITION BY Country ORDER BY Year) AS prev_year_co2
    FROM raw_merged
)
SELECT 
    *,
    -- Calculate Emission Growth Rate (%)
    ((co2 - prev_year_co2) / NULLIF(prev_year_co2, 0)) * 100 AS co2_growth_yoy,
    
    -- TOC 4: Decoupling Classification Logic
    CASE 
        WHEN gdp_growth > 0 AND ((co2 - prev_year_co2) / NULLIF(prev_year_co2, 0)) < 0 
            THEN 'Absolute Decoupling'
        WHEN gdp_growth > 0 AND ((co2 - prev_year_co2) / NULLIF(prev_year_co2, 0)) < gdp_growth 
            THEN 'Relative Decoupling'
        ELSE 'No Decoupling'
    END AS decoupling_status
FROM calculated_metrics;

-- 3. FINAL EXECUTION: Fetch all records for Export
SELECT * FROM v_asean_sustainability_analysis;