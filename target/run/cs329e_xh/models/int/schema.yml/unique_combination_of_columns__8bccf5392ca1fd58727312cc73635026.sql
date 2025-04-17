select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        case_number, employer_name
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure`
    group by case_number, employer_name
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test