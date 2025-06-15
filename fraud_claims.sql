-- =====================================================
-- Claims Fraud Detection Project (SQL)
-- Author: Sneha Dutt
-- Description: Identifies suspicious insurance claims based on statistical outliers and repetitive billing patterns.
-- =====================================================

-- 01_join_queries
SELECT 
  c.claim_id,
  c.claim_amount,
  c.diagnosis_code,
  c.procedure_code,
  p.gender,
  p.age,
  pr.specialty,
  pr.years_of_experience
FROM claims c
JOIN patients p ON c.patient_id = p.patient_id
JOIN providers pr ON c.provider_id = pr.provider_id;

-- 02_aggregations

SELECT 
  diagnosis_code,
  COUNT(*) AS total_claims,
  ROUND(AVG(claim_amount), 2) AS avg_claim_amount,
  ROUND(MAX(claim_amount), 2) AS max_claim_amount
FROM claims
GROUP BY diagnosis_code
ORDER BY avg_claim_amount DESC;

-- finding 95th percentile
SELECT claim_amount
FROM claims
ORDER BY claim_amount
LIMIT 1 OFFSET (
  (SELECT COUNT(*) FROM claims) * 95 / 100
);

--03_outlier_detection
-- 95th percentile value found: 8284.97 
-- See provider + patient info for high-value claims
SELECT 
  c.claim_id, c.claim_amount, c.procedure_code, 
  p.gender, p.age, pr.specialty, pr.years_of_experience
FROM claims c
JOIN patients p ON c.patient_id = p.patient_id
JOIN providers pr ON c.provider_id = pr.provider_id
WHERE c.claim_amount > 8284.97;

-- 04_fraud_flags
-- Claims with missing or blank diagnosis
SELECT *
FROM claims
WHERE diagnosis_code IS NULL OR TRIM(diagnosis_code) = '';

-- Repeated claims (e.g., claim_amount = 147.95)
SELECT claim_amount, COUNT(*) AS frequency
FROM claims
GROUP BY claim_amount
HAVING frequency > 50;

-- What procedures are associated?
SELECT procedure_code, COUNT(*) AS count_147
FROM claims
WHERE claim_amount = 147.95
GROUP BY procedure_code
ORDER BY count_147 DESC;

-- Identify Providers Submitting 147.95 Too Often
SELECT provider_id, COUNT(*) AS count_147
FROM claims
WHERE claim_amount = 147.95
GROUP BY provider_id
HAVING count_147 > 10
ORDER BY count_147 DESC;

-- Providers with unusually high avg claim value
SELECT 
  provider_id,
  COUNT(*) AS total_claims,
  ROUND(AVG(claim_amount), 2) AS avg_claim_amount
FROM claims
GROUP BY provider_id
HAVING avg_claim_amount > 10000;

-- Claims above both threshold and from flagged providers
SELECT c.*
FROM claims c
JOIN (
  SELECT provider_id
  FROM claims
  GROUP BY provider_id
  HAVING AVG(claim_amount) > 10000
) flagged ON c.provider_id = flagged.provider_id
WHERE c.claim_amount > 8284.97;

-- 05_create_views
CREATE VIEW suspicious_claims AS
SELECT c.*
FROM claims c
LEFT JOIN providers pr ON c.provider_id = pr.provider_id
WHERE c.claim_amount > 9555.79
   OR c.diagnosis_code IS NULL
   OR TRIM(c.diagnosis_code) = '';

-- view for repeat claims 
CREATE VIEW repeat_claims AS
SELECT *
FROM claims
WHERE claim_amount = 147.95;


-- Preview the view
SELECT * FROM suspicious_claims;

