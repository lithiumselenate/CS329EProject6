
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Company_Data`
        
  (
    employer_name string primary key not enforced,
    count int64,
    employer_url string,
    _data_source string,
    _load_time datetime
    
    )

      
    
    

    OPTIONS()
    as (
      
    select employer_name, count, employer_url, _data_source, _load_time
    from (
        with int_cd AS
(
    SELECT 
    employer_name, 
    count,  
    employer_url, 
    _data_source, 
    _load_time
FROM `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`company_data`
) select * from int_cd
    ) as model_subq
    );
  