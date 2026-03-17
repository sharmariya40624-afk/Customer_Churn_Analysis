CREATE TABLE customer_churn(
customerID TEXT,
count TEXT,
country TEXT,
state TEXT,
city TEXT,
zip TEXT,
latitude TEXT,
longitude TEXT,
gender TEXT,
SeniorCitizen TEXT,
Partner TEXT,
Dependents TEXT,
TenureMonths TEXT,
PhoneService TEXT,
MultipleLines TEXT,
InternetService TEXT,
OnlineSecurity TEXT,
OnlineBackup TEXT,
DeviceProtection TEXT,
TechSupport TEXT,
StreamingTV TEXT,
StreamingMovies TEXT,
Contract TEXT,
PaperlessBilling TEXT,
PaymentMethod TEXT,
MonthlyCharges TEXT,
TotalCharges TEXT,
ChurnLabel TEXT,
ChurnValue TEXT,
ChurnScore TEXT,
CLTV TEXT
);

SELECT COUNT(*)AS total_customers
FROM customer_churn;

SELECT*FROM customer_churn
LIMIT 10;

SELECT COUNT(*)
FROM customer_churn;

SELECT COUNT(*)
FROM customer_churn
WHERE churnlabel = 'Yes';

SELECT
COUNT(*)FILTER(WHERE churnlabel='Yes')
*100.0/COUNT(*)
AS churn_rate
FROM customer_churn;

SELECT gender,
COUNT(*)AS customers,
SUM(CASE WHEN churnlabel='Yes' THEN 1 ELSE 0 END)
AS churned
FROM customer_churn
GROUP BY gender;

SELECT contract,
COUNT(*)AS customers,
SUM(CASE WHEN churnlabel='Yes' THEN 1 ELSE 0 END)
AS churned
FROM customer_churn
GROUP BY contract;

SELECT internetservice,
COUNT(*)AS customers,
SUM(CASE WHEN churnlabel='Yes'THEN 1 ELSE 0 END)
AS churned
FROM customer_churn
GROUP BY internetservice;

SELECT SUM(NULLIF(TRIM(totalcharges),'')::numeric)
FROM customer_churn;

SELECT churnlabel,
AVG(monthlycharges::numeric)
FROM customer_churn
GROUP BY churnlabel;

SELECT city,
COUNT(*)AS customers
FROM customer_churn
GROUP BY city
ORDER BY customers DESC 
LIMIT 10;

SELECT
tenuremonths,
COUNT(*)AS customers
FROM customer_churn
GROUP BY tenuremonths
ORDER BY tenuremonths;

SELECT paymentmethod,
COUNT(*)AS customers,
SUM(CASE WHEN churnlabel='Yes' THEN 1 ELSE 0 END)
AS churned
FROM customer_churn
GROUP BY paymentmethod
ORDER BY churned DESC;

