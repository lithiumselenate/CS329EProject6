
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`company_data`
      
    
    

    OPTIONS()
    as (
      
with stg_company_data as (
select * from `silken-fortress-448205-p9`.`cs329e_xh_raw`.`company_data`
)
select * from stg_company_data
    );
  