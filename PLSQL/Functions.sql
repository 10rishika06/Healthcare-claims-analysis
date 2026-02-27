-- Function: Get High Claim Members

CREATE OR REPLACE FUNCTION get_high_claim_members(p_limit NUMERIC)
RETURNS TABLE(member_name VARCHAR, total_claim NUMERIC) AS
$$
BEGIN
    RETURN QUERY
    SELECT m.member_name,
           SUM(c.claim_amount)
    FROM members m
    JOIN claims c
    ON m.member_id = c.member_id
    GROUP BY m.member_name
    HAVING SUM(c.claim_amount) > p_limit;
END;
$$ LANGUAGE plpgsql;
