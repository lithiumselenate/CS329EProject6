
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_mrt`.`company_approval_rate`
      
    
    

    OPTIONS()
    as (
      SELECT 
    COALESCE(sr.employer_name, cd.employer_name, ed.employer_petitioner_name) AS employer_name,
    COUNT(CASE WHEN sr.first_decision = 'Approved' THEN 1 END) AS total_approved,
    COUNT(CASE WHEN sr.first_decision = 'Denied' THEN 1 END) AS total_denied,
    COUNT(*) AS total_applications,
    ROUND(
        (COUNT(CASE WHEN sr.first_decision = 'Approved' THEN 1 END) * 100.0) / 
        NULLIF(COUNT(*), 0), 2
    ) AS approval_rate
FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration` sr
LEFT JOIN `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail` ed 
    ON sr.employer_name = ed.employer_petitioner_name
LEFT JOIN `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Company_Data` cd 
    ON sr.employer_name = cd.employer_name
GROUP BY employer_name
ORDER BY approval_rate DESC
    );
  