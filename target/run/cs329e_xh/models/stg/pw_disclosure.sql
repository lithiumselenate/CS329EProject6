
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`pw_disclosure`
      
    
    

    OPTIONS()
    as (
      
with temp as (
select 
    * except(required_experience_months, required_training_months, alt_training_months, alt_experience_months),
    cast(required_training_months as int64) as required_training_months,
    cast(required_experience_months as int64) as required_experience_months,
    cast(alt_training_months as int64) as alt_training_months,
    cast(alt_experience_months as int64) as alt_experience_months
from `silken-fortress-448205-p9`.`cs329e_xh_raw`.`pw_disclosure`
),
stg_pw_disclosure as (
    select 
    * except(bls_area),
    SPLIT(bls_area, ',')[SAFE_OFFSET(0)] AS bls_city,
    IFNULL(SPLIT(bls_area, ',')[SAFE_OFFSET(1)], '') AS bls_state
from temp)
select * from stg_pw_disclosure
    );
  