{{ config(materialized='table') }}
with stg_wage_summary as (
select * from {{ source('cs329e_xh_raw', 'wage_summary') }}
)
select * from stg_wage_summary