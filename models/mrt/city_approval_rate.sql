SELECT 
  lw.worksite_city AS city,
  lw.worksite_state AS state,
  COUNT(CASE WHEN ld.case_status IN ('Certified', 'Certified - Withdrawn') THEN 1 END) AS total_approved,
  COUNT(CASE WHEN ld.case_status = 'Denied' THEN 1 END) AS total_denied,
  COUNT(*) AS total_cases,
  ROUND(
    100 * COUNT(CASE WHEN ld.case_status IN ('Certified', 'Certified - Withdrawn') THEN 1 END) 
    / COUNT(*), 2
  ) AS approval_rate
FROM {{ ref('LCA_Disclosure') }} ld
JOIN {{ ref('LCA_Worksites') }} lw
ON ld.case_number = lw.case_number
GROUP BY lw.worksite_city, lw.worksite_state
ORDER BY approval_rate DESC