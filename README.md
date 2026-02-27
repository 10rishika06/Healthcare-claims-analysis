# Healthcare Claims Analysis

## Project Overview
This project demonstrates end-to-end healthcare claims data analysis using PostgreSQL and Power BI.

The objective was to design a normalized relational database, perform analytical SQL queries, and build an interactive dashboard to generate business insights from healthcare claims data.

---

## Database Design

### Members Table
- member_id (Primary Key)
- member_name
- age
- gender
- city
- join_date

### Claims Table
- claim_id (Primary Key)
- member_id (Foreign Key referencing members.member_id)
- diagnosis_code
- claim_amount
- claim_date
- claim_status (Approved / Rejected)
- hospital_name
- logical_delete_flag

Relationship:
One-to-Many relationship between members and claims.

---

## SQL Analysis Performed

The following SQL operations were implemented:

- Inner Join between members and claims
- Total Claim Amount per Member
- Claims grouped by City
- Claim Status Distribution (Approved vs Rejected)
- Average Claim Amount by Diagnosis
- Identification of Members with No Claims
- Monthly Claim Trend using DATE_TRUNC()
- High Claim Members using HAVING clause
- Ranking Members using RANK() window function
- Creation of reporting view: member_claim_summary

---

## Power BI Dashboard

An interactive dashboard was developed including:

- Total Members (Card Visual)
- Total Claim Amount (Card Visual)
- Claim Amount by Diagnosis (Bar Chart)
- Claim Status Distribution (Pie Chart)
- Monthly Claim Trend (Line Chart)

Data modeling was performed using a One-to-Many relationship between members and claims.

---

## Tools and Technologies

- PostgreSQL
- pgAdmin
- Power BI Desktop
- Git
- GitHub

---

## Project Structure

healthcare-claims-analysis  
│  
├── sql/  
│ ├── create_tables.sql  
│ ├── insert_data.sql  
│ ├── analysis_queries.sql  
│  
├── powerbi/  
│ └── Healthcare_Claims_Analysis.pbix
