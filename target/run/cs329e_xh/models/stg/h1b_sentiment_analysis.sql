
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`h1b_sentiment_analysis`
      
    
    

    OPTIONS()
    as (
      
with stg_senti as (
select * 
from `silken-fortress-448205-p9`.`cs329e_xh_raw`.`h1b_sentiment_analysis`
)
select * from stg_senti
    );
  