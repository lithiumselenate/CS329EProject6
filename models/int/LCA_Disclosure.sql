with lca_d as (
    select * from {{ ref('lca_disclosure') }}
)
select * from lca_d