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