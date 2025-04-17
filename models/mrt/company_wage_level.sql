SELECT 
    COALESCE(ws.company_name, cd.employer_name, ed.employer_petitioner_name) AS employer_name,
    ROUND(AVG(ws.min_wage), 2) AS min_wage,
    ROUND(AVG(ws.max_wage), 2) AS max_wage,
    ROUND(AVG(ws.average_wage), 2) AS average_wage
FROM {{ ref('Wage_Summary') }} ws
LEFT JOIN {{ ref('Employer_Detail') }} ed 
    ON ws.company_name = ed.employer_petitioner_name
LEFT JOIN {{ ref('Company_Data') }} cd 
    ON ws.company_name = cd.employer_name
GROUP BY employer_name
ORDER BY average_wage DESC