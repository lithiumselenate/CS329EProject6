select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with dbt_test__target as (

  select employer_petitioner_name as unique_field
  from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail`
  where employer_petitioner_name is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



      
    ) dbt_internal_test