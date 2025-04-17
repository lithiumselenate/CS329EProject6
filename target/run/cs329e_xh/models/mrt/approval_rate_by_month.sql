
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_mrt`.`approval_rate_by_month`
      
    
    

    OPTIONS()
    as (
      WITH monthly_windows AS (
    SELECT 
        EXTRACT (YEAR FROM publication_date) AS year,
        EXTRACT(MONTH FROM publication_date) AS month,
        MAX(publication_date) AS latest_date
    FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Sentiment_Analysis`
    GROUP BY year, month
),
approval_rate_monthly AS (

    SELECT 
        EXTRACT(YEAR FROM decision_date) AS year,
        EXTRACT(MONTH FROM decision_date) AS month,
        COUNT(CASE WHEN case_status = 'Certified' THEN 1 END) AS approved_count,
        COUNT(CASE WHEN case_status != 'Certified' THEN 1 END) AS denied_count,
        COUNT(*) AS total_applications
    FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure`
    WHERE decision_date IS NOT NULL
    GROUP BY year, month
)
SELECT 
    a.month,
    m.latest_date,
    a.approved_count,
    a.denied_count,
    a.total_applications,
    ROUND(100.0 * a.approved_count / a.total_applications, 2) AS approval_rate
FROM approval_rate_monthly a
LEFT JOIN monthly_windows m
    ON a.month = m.month
ORDER BY a.month
    );
  