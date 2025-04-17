select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select publication_date
from `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Sentiment_Analysis`
where publication_date is null



      
    ) dbt_internal_test