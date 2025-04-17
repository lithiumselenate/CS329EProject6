
with s as (
SELECT
    * EXCEPT (received_date, decision_date, original_cert_date, total_worker_positions, new_employment, continued_employment, change_previous_employment, new_concurrent_employment, change_employer, amended_petition, worksite_workers, wage_rate_of_pay_from, wage_rate_of_pay_to, prevailing_wage, total_worksite_locations),
    SAFE_CAST(received_date AS DATETIME) AS received_date,
    SAFE_CAST(decision_date AS DATETIME) AS decision_date,
    SAFE_CAST(original_cert_date AS DATETIME) AS original_cert_date,
    
    SAFE_CAST(total_worker_positions AS INT64) AS total_worker_positions,
    SAFE_CAST(new_employment AS INT64) AS new_employment,
    SAFE_CAST(continued_employment AS INT64) AS continued_employment,
    SAFE_CAST(change_previous_employment AS INT64) AS change_previous_employment,
    SAFE_CAST(new_concurrent_employment AS INT64) AS new_concurrent_employment,
    SAFE_CAST(change_employer AS INT64) AS change_employer,
    SAFE_CAST(amended_petition AS INT64) AS amended_petition,
    SAFE_CAST(worksite_workers AS INT64) AS worksite_workers,
    SAFE_CAST(total_worksite_locations AS INT64) AS total_worksite_locations,

    SAFE_CAST(REGEXP_REPLACE(wage_rate_of_pay_from, r'[\$,]', '') AS FLOAT64) AS wage_rate_of_pay_from,
    SAFE_CAST(REGEXP_REPLACE(wage_rate_of_pay_to, r'[\$,]', '') AS FLOAT64) AS wage_rate_of_pay_to,
    SAFE_CAST(REGEXP_REPLACE(prevailing_wage, r'[\$,]', '') AS FLOAT64) AS prevailing_wage

FROM `silken-fortress-448205-p9`.`cs329e_xh_raw`.`lca_disclosure`
    )
select * from s