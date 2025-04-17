select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select agent_last_name
from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration`
where agent_last_name is null



      
    ) dbt_internal_test