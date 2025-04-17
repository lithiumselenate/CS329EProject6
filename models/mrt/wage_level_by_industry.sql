WITH industry_wages AS (
  SELECT
    CASE 
      WHEN SUBSTR(ed.naics_code, 1, 2) = '11' THEN '11 - Agriculture, Forestry, Fishing and Hunting'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '21' THEN '21 - Mining'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '22' THEN '22 - Utilities'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '23' THEN '23 - Construction'
      WHEN SUBSTR(ed.naics_code, 1, 2) BETWEEN '31' AND '33' THEN '31-33 - Manufacturing'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '42' THEN '42 - Wholesale Trade'
      WHEN SUBSTR(ed.naics_code, 1, 2) BETWEEN '44' AND '45' THEN '44-45 - Retail Trade'
      WHEN SUBSTR(ed.naics_code, 1, 2) BETWEEN '48' AND '49' THEN '48-49 - Transportation and Warehousing'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '51' THEN '51 - Information'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '52' THEN '52 - Finance and Insurance'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '53' THEN '53 - Real Estate Rental and Leasing'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '54' THEN '54 - Professional, Scientific, and Technical Services'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '55' THEN '55 - Management of Companies and Enterprises'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '56' THEN '56 - Administrative and Support Services'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '61' THEN '61 - Educational Services'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '62' THEN '62 - Health Care and Social Assistance'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '71' THEN '71 - Arts, Entertainment, and Recreation'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '72' THEN '72 - Accommodation and Food Services'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '81' THEN '81 - Other Services (except Public Administration)'
      WHEN SUBSTR(ed.naics_code, 1, 2) = '92' THEN '92 - Public Administration'
      ELSE 'Unclassified'
    END AS industry,
    ROUND(AVG(ws.average_wage), 2) AS avg_wage,
    ROUND(MIN(ws.min_wage), 2) AS min_wage,
    ROUND(MAX(ws.max_wage), 2) AS max_wage
  FROM {{ ref('Wage_Summary') }} ws
  LEFT JOIN {{ ref('Employer_Detail') }} ed
    ON ws.company_name = ed.employer_petitioner_name
  WHERE ws.average_wage IS NOT NULL
  GROUP BY industry
)
SELECT
  industry,
  avg_wage,
  min_wage,
  max_wage
FROM industry_wages
ORDER BY avg_wage DESC