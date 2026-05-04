# ASEAN-5 Sustainability & Economic Decoupling Analysis (1950-2024)


## 1. 🚀 Project Introduction & Executive Summary
### The Sustainability Challenge

Within the context of Emerging Markets, the **ASEAN-5** (Indonesia, Malaysia, Philippines, Thailand, and Vietnam) operate at a critical intersection: **Economic Expansion vs. Environmental Integrity.** This project provides a comprehensive investigation into the historical correlation between GDP growth and carbon emissions over a 74-year period.

### Analytical Objectives
* **Decoupling Verification:** Assessing whether ASEAN-5 economies have achieved "Absolute Decoupling" (GDP growth alongside declining emissions) or remain in a state of "Relative Decoupling."
* **Data-Driven Accountability:** Utilizing long-term historical data to pinpoint economic phases with the highest and lowest carbon intensity.

### Project Deliverables
* **SQL Transformation Layer:** Systematic data cleaning and multi-source integration.
* **Power BI Interactive System:** A multi-dimensional dashboard for comparative regional analysis.
* **Economic Projections:** Predictive insights for CO2 trends spanning 2025-2031.

---

## 2. 🏗️ Data Architecture & Pipeline (The SQL Power)
### Systematic Integration
To ensure a **"Single Source of Truth,"** the architecture utilizes a robust SQL pipeline to merge and transform disparate datasets:

1. `asean_gdp_master_2.csv`: Historical GDP (PPP) and population data.

2. `co2_emission_1950-2024_3.csv`: National CO2 emission records.

### Technical Implementation:
* **Data Cleaning:** Handling of null values and type-casting to ensure computational accuracy.
* **The Master Join:** Execution of an INNER JOIN on Year and Country keys to eliminate data silos.
* **Advanced Analytics:** Deployment of SQL Window Functions to calculate **Year-over-Year (YoY) Growth** and rolling averages at the database level.

  ---

## 3. 📈 Advanced Metric Engineering
The analysis moves beyond raw data by engineering sophisticated sustainability metrics to evaluate economic efficiency:
* **Carbon Intensity of Economy (CIE):**

  Used as a primary indicator of energy efficiency, measuring how many tons of CO2 are emitted for every dollar of wealth generated.

  <p align="center">
    $$CIE = \frac{Total\ CO_2\ Emissions}{GDP\ (PPP)}$$
  </p> 

* **Emission per Capita vs. Wealth:**

  By integrating population data, a correlation is established between individual environmental responsibility and rising national prosperity.

  <p align="center">
  $$CO_2\ per\ Capita = \frac{Total\ CO_2\ Emissions}{Total\ Population}$$
  </p> 

* **Inflation-Adjusted Analytics:**

  To maintain longitudinal accuracy, GDP figures are calculated using Purchasing Power Parity (PPP). This adjustment ensures that economic growth comparisons across different decades remain valid despite inflationary pressures.

* **Decoupling Classification Logic:**

  To ensure longitudinal accuracy over the 74-year period, the analysis utilizes **GDP (Purchasing Power Parity)** data. This methodology inherently adjusts for inflationary pressures and currency fluctuations, providing a consistent baseline for measuring real economic growth against carbon emissions.
  
