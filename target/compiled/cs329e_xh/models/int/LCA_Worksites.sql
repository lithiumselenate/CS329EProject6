with lw as(
    select *
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`lca_worksites`
),
int_lw as(
SELECT 
    GENERATE_UUID() AS row_id,  -- Assign a unique UUID
    lw.*  
FROM lw
)
select * from int_lw