-- Trigger Function: Validate Claim Amount

CREATE OR REPLACE FUNCTION validate_claim_amount()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.claim_amount < 0 THEN
        RAISE EXCEPTION 'Claim amount cannot be negative';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Call Statement
CREATE TRIGGER check_claim_amount
BEFORE INSERT OR UPDATE
ON claims
FOR EACH ROW
EXECUTE FUNCTION validate_claim_amount();
