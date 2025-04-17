WITH salary_by_field AS (
    SELECT 
        a.appx_a_field_of_study AS field_of_study,
        l.wage_unit_of_pay,
        l.wage_rate_of_pay_from AS wage_from,
        l.wage_rate_of_pay_to AS wage_to
    FROM {{ ref('LCA_Disclosure') }} l
    JOIN {{ ref('LCA_Appendix') }} a 
        ON l.case_number = a.case_number
    WHERE a.appx_a_field_of_study IS NOT NULL
)

SELECT 
    field_of_study,
    wage_unit_of_pay,
    COUNT(*) AS num_entries,
    ROUND(AVG(wage_from), 2) AS avg_wage_from,
    ROUND(AVG(wage_to), 2) AS avg_wage_to,
    ROUND(MIN(wage_from), 2) AS min_wage,
    ROUND(MAX(wage_to), 2) AS max_wage
FROM salary_by_field
WHERE wage_from IS NOT NULL AND wage_to IS NOT NULL
GROUP BY field_of_study, wage_unit_of_pay
ORDER BY field_of_study, wage_unit_of_pay