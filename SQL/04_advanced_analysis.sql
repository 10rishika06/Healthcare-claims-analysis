-- STEP 4.1: Members With No Claims
SELECT mem.member_id,mem.member_name
FROM members mem LEFT JOIN claims clm
ON mem.member_id = clm.member_id
WHERE clm.claim_amount is null;

-- STEP 4.2: Monthly Claim Trend
SELECT DATE_TRUNC('month',claim_date) as claim_monthly, SUM(claim_amount) as total_claim_amount
FROM claims
GROUP BY claim_monthly
ORDER BY total_claim_amount DESC;

-- STEP 4:3 High Claim Members (>800)
SELECT mem.member_name, SUM(clm.claim_amount) as total_claim_amount
FROM members mem  JOIN claims clm
ON mem.member_id = clm.member_id
GROUP BY member_name
HAVING SUM(clm.claim_amount)> 800;

-- STEP 4.4: Ranking Members by Claim Amount
SELECT mem.member_name,SUM(clm.claim_amount) as total_claim_amount,
RANK()OVER(ORDER BY SUM(clm.claim_amount) DESC) as claim_rank
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
group by member_name;
