
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`wage_summary`
      
    
    

    OPTIONS()
    as (
      
with stg_wage_summary as (
select * from `silken-fortress-448205-p9`.`cs329e_xh_raw`.`wage_summary`
)
select * from stg_wage_summary
    );
  