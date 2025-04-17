SELECT 
    COALESCE(sr.employer_name, cd.employer_name, ed.employer_petitioner_name) AS employer_name,
    COUNT(CASE WHEN sr.first_decision = 'Approved' THEN 1 END) AS total_approved,
    COUNT(CASE WHEN sr.first_decision = 'Denied' THEN 1 END) AS total_denied,
    COUNT(*) AS total_applications,
    ROUND(
        (COUNT(CASE WHEN sr.first_decision = 'Approved' THEN 1 END) * 100.0) / 
        NULLIF(COUNT(*), 0), 2
    ) AS approval_rate
FROM {{ ref('Single_Registration') }} sr
LEFT JOIN {{ ref('Employer_Detail') }} ed 
    ON sr.employer_name = ed.employer_petitioner_name
LEFT JOIN {{ ref('Company_Data') }} cd 
    ON sr.employer_name = cd.employer_name
GROUP BY employer_name
ORDER BY approval_rate DESC