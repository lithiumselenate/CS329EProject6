{{ config(materialized='table') }}
with stg_employer_details_1 as (
select
    * except (`tax id`,`line by line` ),
    lpad(cast(cast(`tax id` as int64) as string), 4, '0') as tax_id,
    CAST(REPLACE(`line by line`, ',', '') AS INT64) AS employer_no
from {{ source('cs329e_xh_raw', 'employer_details') }}
),
stg_employer_details as (
    select
    employer_no,
    `fiscal year   ` as fiscal_year,
    `employer petitioner name` as employer_petitioner_name,
    tax_id as tax_id,
    `industry naics code` as naics_code,
    `petitioner city` as petitioner_city,
    `petitioner state` as petitioner_state,
    `petitioner zip code` as petitioner_zip_code,
    `initial approval` as initial_approval,
    `initial denial` as initial_denial,
    `continuing approval` as continuing_approval,
    `continuing denial` as continuing_denial,
    _data_source, _load_time
from stg_employer_details_1
) 
select * from stg_employer_details