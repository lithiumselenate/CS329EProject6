{{ config(materialized='table') }}
with stg_senti as (
select * 
from {{ source('cs329e_xh_raw', 'h1b_sentiment_analysis') }}
)
select * from stg_senti