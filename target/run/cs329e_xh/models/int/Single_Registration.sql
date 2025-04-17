
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration`
        
  (
    employer_name string,
    ben_year_of_birth string,
    gender string,
    agent_first_name string,
    agent_last_name string,
    mail_addr string,
    country_of_birth string,
    country_of_nationality string,
    fein string,
    city string,
    state string,
    zip string,
    lottery_year string,
    status_type string,
    ben_multi_reg_ind string,
    rec_date string,
    first_decision string,
    first_decision_date string,
    i129_employer_name string,
    pet_street string,
    pet_city string,
    pet_state string,
    pet_zip string,
    requested_class string,
    basis_for_classification string,
    requested_action string,
    number_of_beneficiaries string,
    ben_sex string,
    ben_country_of_birth string,
    ben_current_class string,
    job_title string,
    worksite_street string,
    worksite_city string,
    worksite_state string,
    worksite_zip string,
    full_time_ind string,
    wage_amt string,
    wage_unit string,
    valid_from string,
    valid_to string,
    num_of_emp_in_us string,
    s1q1a string,
    s1q1b string,
    ben_education_code string,
    ed_level_definition string,
    ben_pfield_of_study string,
    ben_comp_paid string,
    dot_code string,
    naics_code string,
    s3q1 string,
    s4q1 string,
    _data_source string,
    _load_time datetime,
    
    primary key (employer_name, ben_year_of_birth, gender, agent_first_name, agent_last_name, mail_addr) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select employer_name, ben_year_of_birth, gender, agent_first_name, agent_last_name, mail_addr, country_of_birth, country_of_nationality, fein, city, state, zip, lottery_year, status_type, ben_multi_reg_ind, rec_date, first_decision, first_decision_date, i129_employer_name, pet_street, pet_city, pet_state, pet_zip, requested_class, basis_for_classification, requested_action, number_of_beneficiaries, ben_sex, ben_country_of_birth, ben_current_class, job_title, worksite_street, worksite_city, worksite_state, worksite_zip, full_time_ind, wage_amt, wage_unit, valid_from, valid_to, num_of_emp_in_us, s1q1a, s1q1b, ben_education_code, ed_level_definition, ben_pfield_of_study, ben_comp_paid, dot_code, naics_code, s3q1, s4q1, _data_source, _load_time
    from (
        with sr as(
    SELECT DISTINCT 
       employer_name, 
       ben_year_of_birth, 
       gender, 
       agent_first_name, 
       agent_last_name, 
       mail_addr, 
       country_of_birth, 
       country_of_nationality, 
       fein, 
       city, 
       state, 
       zip, 
       lottery_year, 
       status_type, 
       ben_multi_reg_ind, 
       rec_date, 
       first_decision, 
       first_decision_date, 
       i129_employer_name, 
       pet_street, 
       pet_city, 
       pet_state, 
       pet_zip, 
       requested_class, 
       basis_for_classification, 
       requested_action, 
       number_of_beneficiaries, 
       ben_sex, 
       ben_country_of_birth, 
       ben_current_class, 
       job_title, 
       worksite_street, 
       worksite_city, 
       worksite_state, 
       worksite_zip, 
       full_time_ind, 
       wage_amt, 
       wage_unit, 
       valid_from, 
       valid_to, 
       num_of_emp_in_us, 
       s1q1a, 
       s1q1b, 
       ben_education_code, 
       ed_level_definition, 
       ben_pfield_of_study, 
       ben_comp_paid, 
       dot_code, 
       naics_code, 
       s3q1, 
       s4q1, 
       _data_source, 
       _load_time
FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`single_registrations`)
select * from sr where agent_first_name is not null and agent_last_name is not null and employer_name is not null
    ) as model_subq
    );
  