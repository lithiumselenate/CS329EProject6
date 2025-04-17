WITH matched as (
    select
        t.tax_id, t.employer_petitioner_name, 
        m.employer_name,m.fein
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`employer_details` as t
    left join `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`temp_emp` as m
    ON SUBSTR(m.fein, -4) = t.tax_id
)
select
    tax_id, employer_petitioner_name as original_name,
    employer_name as candidate_company_names,
    fein as candidate_fein
from matched