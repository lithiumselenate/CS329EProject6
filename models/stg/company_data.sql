{{ config(materialized='table') }}
with stg_company_data as (
select * from {{ source('cs329e_xh_raw', 'company_data') }}
)
select * from stg_company_data