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
* **Economic Projections:** Predictive insights for CO<sub>2</sub> trends spanning 2025-2031.

---

## 2. 🏗️ Data Architecture & Pipeline (The SQL Power)
### Systematic Integration
To ensure a **"Single Source of Truth,"** the architecture utilizes a robust SQL pipeline to merge and transform disparate datasets:

1. `asean_gdp_master_2.csv`: Historical GDP (PPP) and population data.

2. `co2_emission_1950-2024_3.csv`: National CO<sub>2</sub> emission records.

### Technical Implementation: The Master Join
Behind the visualizations is a robust SQL transformation layer. The following script demonstrates how disparate datasets were unified into a single analytical view:
```sql
/* 
   Example: Joining GDP and Emission Data 
   Target: asean_gdp_master_2.csv + co2_emission_1950-2024_3.csv
*/
SELECT 
    gdp.Country,
    gdp.Year,
    gdp.gdp_per_capita_ppp,
    co2.total_emissions,
    -- Calculating Emission per Capita on the fly
    (co2.total_emissions / gdp.total_population) AS co2_per_capita,
    -- Identifying Decoupling Status (Logic Layer)
    CASE 
        WHEN gdp.gdp_growth > 0 AND co2.emission_growth < 0 THEN 'Absolute Decoupling'
        WHEN gdp.gdp_growth > co2.emission_growth THEN 'Relative Decoupling'
        ELSE 'No Decoupling'
    END AS decoupling_status
FROM asean_gdp_master_2 gdp
INNER JOIN co2_emission_1950_2024 co2 
    ON gdp.Country = co2.Country AND gdp.Year = co2.Year;
```

### Technical Implementation:
* **Data Cleaning:** Handling of null values and type-casting to ensure computational accuracy.
* **The Master Join:** Execution of an INNER JOIN on Year and Country keys to eliminate data silos.
* **Advanced Analytics:** Deployment of SQL Window Functions to calculate **Year-over-Year (YoY) Growth** and rolling averages at the database level.

  ---

## 3. 📈 Advanced Metric Engineering
The analysis moves beyond raw data by engineering sophisticated sustainability metrics to evaluate economic efficiency:
* **Carbon Intensity of Economy (CIE):**

  Used as a primary indicator of energy efficiency, measuring how many tons of *CO<sub>2</sub>* are emitted for every dollar of wealth generated.

  <p align="center">
    $$CIE = \frac{Total\ CO_2\ Emissions}{GDP\ (PPP)}$$
  </p> 

* **Emission per Capita vs. Wealth:**

  By integrating population data, a correlation is established between individual environmental responsibility and rising national prosperity.

  <p align="center">
  $$CO_2\ per\ Capita = \frac{Total\ CO_2\ Emissions}{Total\ Population}$$
  </p> 

* **Inflation-Adjusted Analytics:**

  To maintain longitudinal accuracy over the 74-year period, the analysis utilizes **GDP (Purchasing Power Parity)** data. This methodology inherently adjusts for inflationary pressures and currency fluctuations, providing a consistent baseline for measuring real economic growth.

* **Decoupling Classification Logic:**

  Quantitative criteria are applied to classify nations based on their ability to suppress emission growth while maintaining economic momentum, distinguishing between **Absolute Decoupling** (GDP up, Emissions down) and **Relative Decoupling** (Emissions grow slower than GDP).

---

## 4. 📊 Comparative Regional Analysis (The "Battle" of Big 5)

### **4.1 The Dynamic Decoupling Heatmap (Graph 4)**
The core of this analysis is captured in the dynamic movement of ASEAN-5 nations. The following visualization demonstrates the transition from 1950 to 2024, correlating rising prosperity with individual environmental responsibility:

<p align="center">
  <img src="dashboard/G4.gif" width="90%" alt="ASEAN-5 Decoupling Animation">
  <br>
  <i>Figure 1: Dynamic Scatter Chart (Wealth vs. Responsibility) showing GDP per Capita vs. CO<sub>2</sub> per Capita (1950-2024).</i>
</p>

### **4.2 Country Deep-Dive & Performance Metrics (Graphs 1, 2, & 3)**
We focus on the structural efficiencies of the economies, specifically comparing **Thailand** and **Vietnam** as representatives of different industrial phases:

* **Decoupling Status (Graph 1):** Thailand shows signs of "Relative Decoupling" as the economy matures, while Vietnam remains in a steep upward trajectory due to rapid industrialization.
* **Carbon Intensity Trend (Graph 2):** Measuring the efficiency of wealth generation (CO<sub>2</sub> emitted per $1 GDP).
* **Economic Growth vs. Emission Rate (Graph 3):** A YoY comparison to verify if economic gains are outpacing pollution growth.

<p align="center">
  <img src="images/decoupling_heatmap_G1.png" width="80%">
  <br>
  <i>Figure 2: Comparative Analysis of Emission Trajectories and Decoupling Status.</i>
</p>

<p align="center">
  <img src="images/carbon_intensity_G2.png" width="45%">
  <img src="images/growth_comparison_G3.png" width="45%">
  <br>
  <i>Figure 3: Left - Carbon Intensity Trend (Efficiency); Right - YoY Growth Rate Comparison.</i>
</p>

### **4.3 Historical Context & World Benchmarking (Graph 5)**
To provide global context, regional data is benchmarked against world averages, alongside the **Historical CO<sub>2</sub> Accumulation (Graph 5)** which highlights the total carbon debt each nation has contributed since 1950.

<p align="center">
  <img src="images/historical_accumulation_G5.png" width="80%">
  <br>
  <i>Figure 4: Historical CO<sub>2</sub> Accumulation (The Carbon Debt) from 1950 to 2024.</i>
</p>

---

## 5. 🔮 Predictive Insights & Future Projections (Graph 6)

To support long-term sustainability planning, the dashboard incorporates a **Time-Series Forecasting model** (built-in Power BI exponential smoothing) to predict emission trends for the period 2025-2031.

<p align="center">
  <img src="images/co2_forecast_G6.png" width="85%">
  <br>
  <i>Figure 5: 7-Year CO<sub>2</sub> Emission Projection for ASEAN-5 nations with 95% Confidence Interval.</i>
</p>

> [!IMPORTANT]
> **Key Observation:** The projection highlights a widening gap between "Business as Usual" (BAU) trends and the targets required for Carbon Neutrality in the ASEAN region.

---

## 6. 🧠 Analytical Key Insights & Summary

Based on the 74-year historical analysis of ASEAN-5, several critical patterns emerge:

* **The Middle-Income Environmental Trap:** Data indicates that most ASEAN-5 nations experience a peak in carbon intensity during their transition from agrarian to industrial economies.

* **Decoupling Variance:** **Thailand** and **Malaysia** show the earliest signs of Relative Decoupling (where GDP grows faster than emissions), whereas **Vietnam** is currently in an Emission-Intensive Growth phase, reflecting its position as a rising global manufacturing hub.

* **Historical Responsibility vs. Future Risk:** While Indonesia has the highest historical accumulated emissions, the **2031 Forecast** warns that without significant energy transition, the regional emission curve will significantly deviate from the Net-Zero targets.

---

### 7. 📚 Data Sources & References

To ensure data integrity and transparency, this project utilizes high-fidelity datasets from the following sources:

* **International Monetary Fund (IMF):** Used for historical GDP (PPP), population metrics, and future economic growth projections for ASEAN-5 nations. [Source: IMF Data Mapper]
* **Our World in Data (OWID) via Luca Lullo (Kaggle):** The primary source for national CO<sub>2</sub> emission records (1950-2024), including historical accumulation and intensity metrics.
* **Methodology:** All economic data has been adjusted for Purchasing Power Parity (PPP) to maintain longitudinal accuracy and cross-border comparability.

---

### 8. 🏁 Conclusion

The transition from "Growth at all costs" to "Sustainable Prosperity" is the defining challenge for the ASEAN-5 region. This analysis highlights that while economic decoupling is possible, it requires a deliberate shift in energy efficiency and policy intervention. This project serves as a data-driven framework to monitor that transition through the lens of Environmental Engineering and Data Science.
