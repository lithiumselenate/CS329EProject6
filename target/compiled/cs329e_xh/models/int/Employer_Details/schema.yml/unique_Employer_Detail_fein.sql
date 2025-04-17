
    
    

with dbt_test__target as (

  select fein as unique_field
  from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail`
  where fein is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


