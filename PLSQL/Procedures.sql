-- Procedure: Insert Claim with Validation
CREATE OR REPLACE PROCEDURE add_new_claim(
    p_claim_id INT,
    p_member_id INT,
    p_diagnosis VARCHAR,
    p_amount NUMERIC,
    p_date DATE,
    p_status VARCHAR
)
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Check if member exists
    IF NOT EXISTS (
        SELECT 1 FROM members WHERE member_id = p_member_id
    ) THEN
        RAISE EXCEPTION 'Member ID does not exist';
    END IF;

    INSERT INTO claims
    VALUES (p_claim_id, p_member_id, p_diagnosis,
            p_amount, p_date, p_status);

END;
$$;

--Call Statement
CALL add_new_claim(101, 1, 'Cardiology', 20000, '2025-01-10', 'Approved');
