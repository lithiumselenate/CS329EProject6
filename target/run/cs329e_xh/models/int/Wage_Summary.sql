
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Wage_Summary`
        
  (
    company_name string,
    job_title string,
    min_wage int64,
    max_wage int64,
    average_wage float64,
    job_count int64,
    _data_source string,
    _load_time datetime,
    
    primary key (company_name, job_title) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select company_name, job_title, min_wage, max_wage, average_wage, job_count, _data_source, _load_time
    from (
        with ws as(
    select `company name` as `company_name`,
    `job title` as `job_title`,
    `min wage` as `min_wage`,
    `max wage` as `max_wage`,
    `average wage` as `average_wage`,
    `job count` as `job_count`,
    `_data_source`,
    `_load_time`
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`wage_summary`
),
ws2 as(
   WITH Ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY company_name, job_title ORDER BY _load_time DESC) AS row_num
    FROM ws
)
SELECT * EXCEPT(row_num)
FROM Ranked
WHERE row_num = 1
)
select * from ws2
    ) as model_subq
    );
  