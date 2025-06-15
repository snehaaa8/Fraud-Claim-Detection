# 🕵️ Claims Fraud Detection Insights Report

**Project Title**: Claims Fraud Detection in Healthcare  
**Author**: Sneha Dutt  
**Generated Dataset**: Synthetic data created using [SDV - Synthetic Data Vault](https://sdv.dev)  
**Goal**: Identify anomalies and potential fraudulent behaviors in insurance claims data through advanced SQL analysis.

---

## 🔍 Project Objective

The objective of this project is to uncover suspicious patterns in healthcare claims that could indicate fraud, waste, or abuse. By analyzing relationships between patients, providers, procedures, and claim amounts, we flag:

- Repetitive low-value billing  
- Outlier claims  
- Missing or blank diagnosis codes  
- Providers with statistically abnormal behavior  

---

## 🧠 Skills Demonstrated

- Complex SQL JOINs across claims, patients, and providers  
- Outlier detection using percentile logic  
- Aggregation & group filtering for pattern detection  
- Subqueries to identify high-claim providers  
- Pattern recognition in repetitive billing  
- Identification of blank or missing diagnosis fields  
- Use of indexing and optimization techniques  

---

## 📊 Key Insights

### 1. 🚩 Outlier Detection via 95th Percentile
- Claims exceeding the 95th percentile value of **$8284.97** were flagged.
- High-value claims often involve **Cardiology** and **Pediatrics** specialists, with patients aged **38–79**.

### 2. 📈 Providers with High Average Claim Amounts
- Providers with average claims above **$10,000** were identified.
- These providers may require auditing due to abnormal billing patterns.

### 3. 🔁 Repetitive Billing for Exact Amounts
- The claim amount **$147.95** appeared **419 times** in the dataset.
- Several providers submitted this value **30+ times**, indicating possible upcoding or automation misuse.

### 4. 🧾 Procedure Code Frequency
- Procedures like **PC31**, **PC34**, and **PC20** were most associated with repetitive billing.
- Suggests the potential misuse of common codes to avoid detection.

### 5. 🧑‍⚕️ Provider Behavior Patterns
- Providers **D08**, **D01**, and **D09** submitted identical claims multiple times.
- A few flagged providers had **<5 years of experience**, raising training or fraud concerns.

### 6. ❌ Claims with Missing Diagnosis
- Some claims had **NULL or blank diagnosis codes**, indicating poor data entry or potential fraud.

### 7. 🧬 High-Claim Diagnosis Codes
- Diagnosis code **D001** had the **highest average claim ($2545.82)** and maximum of **$11,532.04**.
- Diagnosis-based claim monitoring can highlight cases of inflated treatment costs.

---

## 📬 Contact

For questions or collaboration inquiries, feel free to connect via LinkedIn or GitHub.  
Project developed by **Sneha Dutt**