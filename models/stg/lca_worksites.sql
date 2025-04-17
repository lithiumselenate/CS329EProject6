{{ config(materialized='table') }}
with stg_lca_worksites as (
select * except(worksite_workers, pw_other_year),
        cast(worksite_workers as int64) as worksite_workers,
        cast(pw_other_year as int64) as pw_other_year
from {{ source('cs329e_xh_raw', 'lca_worksites') }}
)
select * from stg_lca_worksites