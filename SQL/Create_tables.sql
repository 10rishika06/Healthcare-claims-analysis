--CREATE STATEMENT FOR MEMBERS TABLE
CREATE TABLE members(
member_id SERIAL PRIMARY KEY,
member_name VARCHAR(100) NOT NULL,
age INT,
gender VARCHAR(20),
city VARCHAR(50),
join_date DATE
);


--CREATE STATEMENT FOR CLAIMS TABLE
CREATE TABLE claims(
claim_id SERIAL PRIMARY KEY,
member_id INT,
claim_date DATE,
claim_amount NUMERIC(10,2),
claim_status VARCHAR(20),
diagnosis_code VARCHAR(100),
hospital_name VARCHAR(100),
logical_delete_flag CHAR(1) DEFAULT 'N',

CONSTRAINT fk_member
FOREIGN KEY(member_id)
REFERENCES members(member_id)
);
