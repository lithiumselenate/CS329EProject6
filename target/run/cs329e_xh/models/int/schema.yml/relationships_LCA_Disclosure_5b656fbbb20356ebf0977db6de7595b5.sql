select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select decision_date as from_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure`
    where decision_date is not null
),

parent as (
    select publication_date as to_field
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Sentiment_Analysis`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test