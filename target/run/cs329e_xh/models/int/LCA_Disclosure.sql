
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Disclosure`
        
  (
    case_number string,
    case_status string,
    visa_class string,
    job_title string,
    soc_code string,
    soc_title string,
    full_time_position string,
    begin_date string,
    end_date string,
    employer_name string,
    trade_name_dba string,
    employer_address1 string,
    employer_address2 string,
    employer_city string,
    employer_state string,
    employer_postal_code string,
    employer_country string,
    employer_province string,
    employer_phone string,
    employer_phone_ext string,
    employer_fein string,
    naics_code string,
    employer_poc_last_name string,
    employer_poc_first_name string,
    employer_poc_middle_name string,
    employer_poc_job_title string,
    employer_poc_address1 string,
    employer_poc_address2 string,
    employer_poc_city string,
    employer_poc_state string,
    employer_poc_postal_code string,
    employer_poc_country string,
    employer_poc_province string,
    employer_poc_phone string,
    employer_poc_phone_ext string,
    employer_poc_email string,
    agent_representing_employer string,
    agent_attorney_last_name string,
    agent_attorney_first_name string,
    agent_attorney_middle_name string,
    agent_attorney_address1 string,
    agent_attorney_address2 string,
    agent_attorney_city string,
    agent_attorney_state string,
    agent_attorney_postal_code string,
    agent_attorney_country string,
    agent_attorney_province string,
    agent_attorney_phone string,
    agent_attorney_phone_ext string,
    agent_attorney_email_address string,
    lawfirm_name_business_name string,
    state_of_highest_court string,
    name_of_highest_state_court string,
    secondary_entity string,
    secondary_entity_business_name string,
    worksite_address1 string,
    worksite_address2 string,
    worksite_city string,
    worksite_county string,
    worksite_state string,
    worksite_postal_code string,
    wage_unit_of_pay string,
    pw_unit_of_pay string,
    pw_tracking_number string,
    pw_wage_level string,
    pw_oes_year string,
    pw_other_source string,
    pw_other_year string,
    pw_survey_publisher string,
    pw_survey_name string,
    agree_to_lc_statement string,
    h_1b_dependent string,
    willful_violator string,
    support_h1b string,
    statutory_basis string,
    appendix_a_attached string,
    public_disclosure string,
    preparer_last_name string,
    preparer_first_name string,
    preparer_middle_initial string,
    preparer_business_name string,
    preparer_email string,
    _data_source string,
    _load_time datetime,
    received_date datetime,
    decision_date datetime,
    original_cert_date datetime,
    total_worker_positions int64,
    new_employment int64,
    continued_employment int64,
    change_previous_employment int64,
    new_concurrent_employment int64,
    change_employer int64,
    amended_petition int64,
    worksite_workers int64,
    total_worksite_locations int64,
    wage_rate_of_pay_from float64,
    wage_rate_of_pay_to float64,
    prevailing_wage float64,
    
    primary key (case_number, employer_name) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select case_number, case_status, visa_class, job_title, soc_code, soc_title, full_time_position, begin_date, end_date, employer_name, trade_name_dba, employer_address1, employer_address2, employer_city, employer_state, employer_postal_code, employer_country, employer_province, employer_phone, employer_phone_ext, employer_fein, naics_code, employer_poc_last_name, employer_poc_first_name, employer_poc_middle_name, employer_poc_job_title, employer_poc_address1, employer_poc_address2, employer_poc_city, employer_poc_state, employer_poc_postal_code, employer_poc_country, employer_poc_province, employer_poc_phone, employer_poc_phone_ext, employer_poc_email, agent_representing_employer, agent_attorney_last_name, agent_attorney_first_name, agent_attorney_middle_name, agent_attorney_address1, agent_attorney_address2, agent_attorney_city, agent_attorney_state, agent_attorney_postal_code, agent_attorney_country, agent_attorney_province, agent_attorney_phone, agent_attorney_phone_ext, agent_attorney_email_address, lawfirm_name_business_name, state_of_highest_court, name_of_highest_state_court, secondary_entity, secondary_entity_business_name, worksite_address1, worksite_address2, worksite_city, worksite_county, worksite_state, worksite_postal_code, wage_unit_of_pay, pw_unit_of_pay, pw_tracking_number, pw_wage_level, pw_oes_year, pw_other_source, pw_other_year, pw_survey_publisher, pw_survey_name, agree_to_lc_statement, h_1b_dependent, willful_violator, support_h1b, statutory_basis, appendix_a_attached, public_disclosure, preparer_last_name, preparer_first_name, preparer_middle_initial, preparer_business_name, preparer_email, _data_source, _load_time, received_date, decision_date, original_cert_date, total_worker_positions, new_employment, continued_employment, change_previous_employment, new_concurrent_employment, change_employer, amended_petition, worksite_workers, total_worksite_locations, wage_rate_of_pay_from, wage_rate_of_pay_to, prevailing_wage
    from (
        with lca_d as (
    select * from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`lca_disclosure`
)
select * from lca_d
    ) as model_subq
    );
  