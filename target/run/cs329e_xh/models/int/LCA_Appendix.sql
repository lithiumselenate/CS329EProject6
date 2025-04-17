
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Appendix`
        
  (
    case_number string,
    appx_a_date_of_degree datetime,
    appx_a_name_of_institution string,
    appx_a_no_of_exempt_workers int64,
    appx_a_field_of_study string,
    _data_source string,
    _load_time datetime,
    
    primary key (case_number, appx_a_date_of_degree) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select case_number, appx_a_date_of_degree, appx_a_name_of_institution, appx_a_no_of_exempt_workers, appx_a_field_of_study, _data_source, _load_time
    from (
        with int_lca AS (
SELECT 
    case_number,  
    appx_a_date_of_degree, 
    appx_a_name_of_institution,  
    appx_a_no_of_exempt_workers,  
    appx_a_field_of_study, 
    _data_source, 
    _load_time
FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`lca_appendix`
)
select * from int_lca
    ) as model_subq
    );
  