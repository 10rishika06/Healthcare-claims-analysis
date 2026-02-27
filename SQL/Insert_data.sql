--STEP 2: Insert Sample Data

INSERT INTO members (member_name,age,gender,city,join_date)
VALUES
('Ravi Kumar',35,'Male','Dubai','2023-01-15'),
('Priya Sharma',29,'Female','Abu Dhabi','2023-03-10'),
('Ahmed Alir',42,'Male','Sharjah','2022-11-20'),
('Fatima Khan',38,'Female','Dubai','2023-07-01');


INSERT INTO claims (member_id,claim_date,claim_amount,claim_status,diagnosis_code,hospital_name)
VALUES 
(1,'2024-01-05',1200.50,'Approved','D001','City Hospital'),
(1,'2024-02-10',800.00,'Denied','D002','Care Clinic'),
(2,'2024-01-15',5000.75,'Approved','D003','Dubai Medical'),
(3,'2024-03-01',2500.00,'Approved','D001','Al Noor Hospital'),
(4,'2024-02-20',1500.00,'Denied','D004','City Hospital');
