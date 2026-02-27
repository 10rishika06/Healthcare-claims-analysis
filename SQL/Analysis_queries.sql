-- STEP 3.1: View All Records from Members Table
SELECT * FROM members;

-- STEP 3.2: View All Records from claims Table
SELECT * FROM claims;

-- STEP 3.3: Join Members and Claims
SELECT mem.member_id,mem.member_name,mem.city,clm.claim_id,clm.diagnosis_code,clm.claim_amount,clm.claim_status
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id;

-- STEP 3.4: Total Claims Amount per Member
SELECT mem.member_name,SUM(clm.claim_amount) as total_claim_amount 
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
group by member_name
ORDER BY total_claim_amount DESC;

-- STEP 3.5: Total Claims by City
SELECT mem.city,SUM(clm.claim_amount) as total_claim_amount 
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
GROUP BY city
ORDER BY total_claim_amount DESC;

-- STEP 3.6: Claims Count by Status
SELECT claim_status,COUNT(*)
FROM claims
GROUP BY claim_status;

-- STEP 3.7: Average Claim by Diagnosis code
SELECT diagnosis_code, AVG(claim_amount) as total_claim_amount
FROM claims
GROUP BY diagnosis_code
ORDER BY total_claim_amount DESC;

-- STEP 3.8: Members With No Claims
SELECT mem.member_id,mem.member_name
FROM members mem LEFT JOIN claims clm
ON mem.member_id = clm.member_id
WHERE clm.claim_amount is null;

-- STEP 3.9: Monthly Claim Trend
SELECT DATE_TRUNC('month',claim_date) as claim_monthly, SUM(claim_amount) as total_claim_amount
FROM claims
GROUP BY claim_monthly
ORDER BY total_claim_amount DESC;

-- STEP 4: High Claim Members (>800)
SELECT mem.member_name, SUM(clm.claim_amount) as total_claim_amount
FROM members mem  JOIN claims clm
ON mem.member_id = clm.member_id
GROUP BY member_name
HAVING SUM(clm.claim_amount)> 800;

-- STEP 4.1: Ranking Members by Claim Amount
SELECT mem.member_name,SUM(clm.claim_amount) as total_claim_amount,
RANK()OVER(ORDER BY SUM(clm.claim_amount) DESC) as claim_rank
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
group by member_name;

-- STEP 4.2: Create View
CREATE OR REPLACE VIEW member_claim
as
SELECT mem.member_name,mem.city,SUM(clm.claim_amount) as total_claim_amount 
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
group by member_name,city;

-- STEP 4.3: View All Records from Member_claim View
SELECT * FROM member_claim;


