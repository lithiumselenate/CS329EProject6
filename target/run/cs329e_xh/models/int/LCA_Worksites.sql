
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Worksites`
        
  (
    row_id string primary key not enforced,
    case_number string,
    secondary_entity string,
    secondary_entity_business_name string,
    worksite_address1 string,
    worksite_address2 string,
    worksite_city string,
    worksite_county string,
    worksite_state string,
    worksite_postal_code string,
    wage_rate_of_pay_from float64,
    wage_rate_of_pay_to float64,
    wage_unit_of_pay string,
    prevailing_wage float64,
    pw_unit_of_pay string,
    pw_tracking_number string,
    pw_wage_level string,
    pw_oes_year string,
    pw_other_source string,
    pw_survey_publisher string,
    pw_survey_name string,
    _data_source string,
    _load_time datetime,
    worksite_workers int64,
    pw_other_year int64
    
    )

      
    
    

    OPTIONS()
    as (
      
    select row_id, case_number, secondary_entity, secondary_entity_business_name, worksite_address1, worksite_address2, worksite_city, worksite_county, worksite_state, worksite_postal_code, wage_rate_of_pay_from, wage_rate_of_pay_to, wage_unit_of_pay, prevailing_wage, pw_unit_of_pay, pw_tracking_number, pw_wage_level, pw_oes_year, pw_other_source, pw_survey_publisher, pw_survey_name, _data_source, _load_time, worksite_workers, pw_other_year
    from (
        with lw as(
    select *
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`lca_worksites`
),
int_lw as(
SELECT 
    GENERATE_UUID() AS row_id,  -- Assign a unique UUID
    lw.*  
FROM lw
)
select * from int_lw
    ) as model_subq
    );
  