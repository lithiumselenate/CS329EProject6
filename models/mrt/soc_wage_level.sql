WITH job_salary AS (
    SELECT 
        l.soc_code,
        l.soc_title,
        l.wage_unit_of_pay,
        l.wage_rate_of_pay_from AS wage_from,
        l.wage_rate_of_pay_to AS wage_to
    FROM {{ ref('LCA_Disclosure') }} l
    JOIN {{ ref('LCA_Appendix') }} a 
        ON l.case_number = a.case_number
    WHERE l.soc_code IS NOT NULL AND l.soc_title IS NOT NULL
)

SELECT 
    soc_code,
    soc_title,
    wage_unit_of_pay,
    COUNT(*) AS num_entries,
    ROUND(AVG(wage_from), 2) AS avg_wage_from,
    ROUND(AVG(wage_to), 2) AS avg_wage_to,
    ROUND(MIN(wage_from), 2) AS min_wage,
    ROUND(MAX(wage_to), 2) AS max_wage
FROM job_salary
WHERE wage_from IS NOT NULL AND wage_to IS NOT NULL
GROUP BY soc_code, soc_title, wage_unit_of_pay
ORDER BY avg_wage_from DESC