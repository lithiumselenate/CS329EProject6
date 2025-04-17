
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`temp_emp`
      
    
    

    OPTIONS()
    as (
      with emp_sing as(
    select
    employer_name, fein
    FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`single_registrations`
),
emp_pw as(
    select
    employer_legal_business_name, employer_fein as fein
    FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`pw_disclosure`
    WHERE employer_legal_business_name is not null
),
des as (
    select distinct
    employer_name,fein
    FROM emp_sing)
, dep as(
    select distinct
    employer_legal_business_name, replace(fein,"-",'') as fein
    FROM emp_pw),
combined as (
    select employer_name, fein from des
  union all
  select  employer_legal_business_name as employer_name, fein from dep
)
SELECT
  ANY_VALUE(employer_name) AS employer_name, fein
FROM combined
GROUP BY fein
    );
  