





with validation_errors as (

    select
        employer_name, ben_year_of_birth, gender, agent_first_name, agent_last_name, mail_addr
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration`
    group by employer_name, ben_year_of_birth, gender, agent_first_name, agent_last_name, mail_addr
    having count(*) > 1

)

select *
from validation_errors


