
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`lca_appendix`
      
    
    

    OPTIONS()
    as (
      
with stg_lca_appendix as (
select * from `silken-fortress-448205-p9`.`cs329e_xh_raw`.`lca_appendix`
)
select * from stg_lca_appendix
    );
  