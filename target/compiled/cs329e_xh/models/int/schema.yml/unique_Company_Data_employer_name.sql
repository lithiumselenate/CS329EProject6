
    
    

with dbt_test__target as (

  select employer_name as unique_field
  from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Company_Data`
  where employer_name is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


