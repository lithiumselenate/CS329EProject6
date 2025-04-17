select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ben_year_of_birth
from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Single_Registration`
where ben_year_of_birth is null



      
    ) dbt_internal_test