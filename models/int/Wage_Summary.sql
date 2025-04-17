with ws as(
    select `company name` as `company_name`,
    `job title` as `job_title`,
    `min wage` as `min_wage`,
    `max wage` as `max_wage`,
    `average wage` as `average_wage`,
    `job count` as `job_count`,
    `_data_source`,
    `_load_time`
    from {{ ref('wage_summary')}}
),
ws2 as(
   WITH Ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY company_name, job_title ORDER BY _load_time DESC) AS row_num
    FROM ws
)
SELECT * EXCEPT(row_num)
FROM Ranked
WHERE row_num = 1
)
select * from ws2