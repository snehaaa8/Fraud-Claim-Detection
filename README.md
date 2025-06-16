# 🏥 Claims Fraud Detection Dashboard

## 🔍 Project Overview
This project detects potential fraudulent insurance claims using SQL, Python (pandas), and Power BI. 

We flag claims based on statistical outliers, repeated billing patterns, and missing data.

## 🔗 Technologies
- SQL (join logic, window functions, outlier logic)
- Python (pandas, matplotlib)
- Power BI (dashboard, slicers, drillthrough)

## 📈 Key Features
- Outlier detection using 95th percentile
- Repeated claims (147.95) analysis
- Missing/blank diagnosis detection
- Drillthrough provider profiles
- Risk scoring by claim and age group

## 📊 Dataset

This project uses synthetic healthcare claims data generated using **[SDV (Synthetic Data Vault)](https://sdv.dev/)**. 

While SDV realistically mimics the statistical properties of real datasets, it occasionally introduces **repetitive patterns** due to mode frequency in categorical and continuous values. In this project, over **50% of claims had a value of 147.95**, a known artifact of the generation process.

Instead of discarding this anomaly, it was leveraged as a **case study for repeated billing fraud detection** — a common real-world fraud signal in healthcare analytics.


## 📊 Dashboard Views
- **Fraud Overview**: Summary KPIs + breakdowns
- **Outlier Detection**: Claims > 95th percentile
- **Repeated Claims**: Pattern abuse via fixed amounts
- **Provider Drilldown**: Risk profile by provider
- **Provider Profile**: Drillthrough summary

## 🧠 Key Insight:
Over 83% of claims had a value of **147.95**, primarily due to synthetic pattern repetition from SDV. While this is an artifact of synthetic data generation, it mimics **real-world fraud cases where providers repeatedly bill the same amount**, making it a useful case for modeling repeated claim fraud.


## 📂 Files
```
Claims-Fraud-Detection-in-Healthcare/
├── dataset/
│   ├── synthetic_claims.csv
│   ├── synthetic_patients.csv
│   ├── synthetic_procedures.csv
│   ├── synthetic_providers.csv
│   └── SDV.ipynb                  # SDV generation logic
├── fraud_claims.sql              # SQL queries
├── fraud_pipeline.ipynb          # Python validation script
├── fraud_dataset.csv             # Cleaned merged dataset for dashboard
├── Fraud Detection Dashboard.pbix
├── insights.md                   # Insight summary (SQL + visuals)
├── README.md                     
├── LICENSE
```

## 👩‍💻 Author

**Sneha Dutt**

B.S. in Computer Science with a Minor in Accounting  

[LinkedIn](www.linkedin.com/in/sneha-dutt) |
[Github](https://github.com/snehaaa8) 


