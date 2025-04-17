
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Employer_Detail`
        
  (
    employer_petitioner_name string,
    fein string,
    employer_no int64,
    fiscal_year int64,
    tax_id string,
    naics_code string,
    petitioner_city string,
    petitioner_state string,
    petitioner_zip_code string,
    initial_approval string,
    initial_denial int64,
    continuing_approval string,
    continuing_denial int64,
    _data_source string,
    _load_time datetime,
    
    primary key (employer_petitioner_name) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select employer_petitioner_name, fein, employer_no, fiscal_year, tax_id, naics_code, petitioner_city, petitioner_state, petitioner_zip_code, initial_approval, initial_denial, continuing_approval, continuing_denial, _data_source, _load_time
    from (
        
with ed as(
select a.*, b.matched_fein as fein
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`employer_details` as a
    left join `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`matching` as b
    on a.employer_petitioner_name = b.original_name)
, int_emp as (
    SELECT
    fein,
    employer_no,
    fiscal_year,
    employer_petitioner_name,
    tax_id,
    naics_code,
    petitioner_city,
    petitioner_state,
    petitioner_zip_code,
    initial_approval,
    initial_denial,
    continuing_approval,
    continuing_denial,
    _data_source,
    _load_time
FROM (
    SELECT
        distinct employer_petitioner_name,
        fein,
        employer_no,
        fiscal_year,
        tax_id,
        naics_code,
        petitioner_city,
        petitioner_state,
        petitioner_zip_code,
        initial_approval,
        initial_denial,
        continuing_approval,
        continuing_denial,
        _data_source,
        _load_time,
        ROW_NUMBER() OVER (PARTITION BY fein ORDER BY _load_time DESC) AS row_num
    FROM
        ed
    WHERE
        fein IS NOT NULL AND fein != ''
)
WHERE
    row_num = 1
)
select * from int_emp where employer_petitioner_name is not null
    ) as model_subq
    );
  