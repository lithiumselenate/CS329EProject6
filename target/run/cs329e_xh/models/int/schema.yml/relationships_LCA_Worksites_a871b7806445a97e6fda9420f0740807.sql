select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select case_number as from_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Worksites`
    where case_number is not null
),

parent as (
    select case_number as to_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test