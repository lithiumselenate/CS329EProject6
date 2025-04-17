select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select employer_petitioner_name as from_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail`
    where employer_petitioner_name is not null
),

parent as (
    select employer_name as to_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Company_Data`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test