with lw as(
    select *
    from {{ ref('lca_worksites')}}
),
int_lw as(
SELECT 
    GENERATE_UUID() AS row_id,  -- Assign a unique UUID
    lw.*  
FROM lw
)
select * from int_lw