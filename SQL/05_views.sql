-- STEP 4.1: Create View
CREATE OR REPLACE VIEW member_claim
as
SELECT mem.member_name,mem.city,SUM(clm.claim_amount) as total_claim_amount 
FROM members mem JOIN claims clm
ON mem.member_id = clm.member_id
group by member_name,city;

-- STEP 4.2: View All Records from Member_claim View
SELECT * FROM member_claim;
