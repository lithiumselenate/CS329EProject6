
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_int`.`Sentiment_Analysis`
        
  (
    publication_date datetime primary key not enforced,
    text_summary string,
    sentiment string,
    _data_source string,
    _load_time datetime
    
    )

      
    
    

    OPTIONS()
    as (
      
    select publication_date, text_summary, sentiment, _data_source, _load_time
    from (
        with ints as(
    select * from `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`h1b_sentiment_analysis`
)
select * from ints
    ) as model_subq
    );
  