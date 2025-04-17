with int_cd AS
(
    SELECT 
    employer_name, 
    count,  
    employer_url, 
    _data_source, 
    _load_time
FROM {{ ref('company_data') }}
) select * from int_cd