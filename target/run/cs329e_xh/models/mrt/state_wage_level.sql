
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_mrt`.`state_wage_level`
      
    
    

    OPTIONS()
    as (
      SELECT 
  lw.worksite_state AS state,
  ROUND(AVG(ld.prevailing_wage), 2) AS avg_wage,
  ROUND(MAX(ld.prevailing_wage), 2) AS max_wage,
  ROUND(MIN(ld.prevailing_wage), 2) AS min_wage,
  COUNT(ld.case_number) AS total_cases
FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure` ld
JOIN `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Worksites` lw
ON ld.case_number = lw.case_number
WHERE ld.prevailing_wage IS NOT NULL
AND LOWER(ld.pw_unit_of_pay) != 'hour'  -- Exclude hourly wage records
GROUP BY lw.worksite_state
ORDER BY avg_wage DESC
    );
  