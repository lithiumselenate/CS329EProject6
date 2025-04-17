
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_mrt`.`industry_approval_rate`
      
    
    

    OPTIONS()
    as (
      WITH industry_data AS (
  SELECT
    sr.employer_name,
    -- Assign NAICS code: First use Employer_Detail, then fallback to SR
    COALESCE(SUBSTR(ed.naics_code, 1, 2), SUBSTR(sr.naics_code, 1, 2)) AS naics_code,
    CASE 
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '11' THEN '11 - Agriculture, Forestry, Fishing and Hunting'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '21' THEN '21 - Mining'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '22' THEN '22 - Utilities'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '23' THEN '23 - Construction'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) BETWEEN '31' AND '33' THEN '31-33 - Manufacturing'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '42' THEN '42 - Wholesale Trade'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) BETWEEN '44' AND '45' THEN '44-45 - Retail Trade'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) BETWEEN '48' AND '49' THEN '48-49 - Transportation and Warehousing'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '51' THEN '51 - Information'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '52' THEN '52 - Finance and Insurance'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '53' THEN '53 - Real Estate Rental and Leasing'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '54' THEN '54 - Professional, Scientific, and Technical Services'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '55' THEN '55 - Management of Companies and Enterprises'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '56' THEN '56 - Administrative and Support Services'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '61' THEN '61 - Educational Services'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '62' THEN '62 - Health Care and Social Assistance'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '71' THEN '71 - Arts, Entertainment, and Recreation'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '72' THEN '72 - Accommodation and Food Services'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '81' THEN '81 - Other Services (except Public Administration)'
      WHEN SUBSTR(COALESCE(ed.naics_code, sr.naics_code), 1, 2) = '92' THEN '92 - Public Administration'
      ELSE 'Unclassified' 
    END AS industry,
    COUNT(CASE WHEN sr.first_decision = 'Approved' THEN 1 END) AS approved,
    COUNT(CASE WHEN sr.first_decision = 'Denied' THEN 1 END) AS denied,
    COUNT(*) AS total
  FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration` sr
  LEFT JOIN `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail` ed
    ON sr.employer_name = ed.employer_petitioner_name
  LEFT JOIN `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Company_Data` cd
    ON sr.employer_name = cd.employer_name
  GROUP BY sr.employer_name, naics_code, industry
)
SELECT 
  industry,
  SUM(approved) AS total_approved,
  SUM(denied) AS total_denied,
  SUM(total) AS total_applications,
  ROUND(SUM(approved) / SUM(total) * 100, 2) AS approval_rate
FROM industry_data
GROUP BY industry
ORDER BY approval_rate DESC
    );
  