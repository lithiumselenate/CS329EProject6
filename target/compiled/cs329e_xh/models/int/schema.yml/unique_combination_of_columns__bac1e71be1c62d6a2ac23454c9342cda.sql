





with validation_errors as (

    select
        case_number, appx_a_date_of_degree
    from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`LCA_Appendix`
    group by case_number, appx_a_date_of_degree
    having count(*) > 1

)

select *
from validation_errors


