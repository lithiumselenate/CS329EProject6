select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        company_name, job_title
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Wage_Summary`
    group by company_name, job_title
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test