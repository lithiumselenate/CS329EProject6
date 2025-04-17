
WITH matched as (
    select
        t.tax_id, t.employer_petitioner_name, 
        m.employer_name,m.fein
    from {{ ref('employer_details') }} as t
    left join {{ ref('temp_emp') }} as m
    ON SUBSTR(m.fein, -4) = t.tax_id
)
select
    tax_id, employer_petitioner_name as original_name,
    employer_name as candidate_company_names,
    fein as candidate_fein
from matched