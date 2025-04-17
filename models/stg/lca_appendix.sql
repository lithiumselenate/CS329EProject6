{{ config(materialized='table') }}
with stg_lca_appendix as (
select * from {{ source('cs329e_xh_raw', 'lca_appendix') }}
)
select * from stg_lca_appendix