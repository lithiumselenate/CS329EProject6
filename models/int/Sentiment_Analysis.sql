with ints as(
    select * from {{ ref('h1b_sentiment_analysis') }}
)
select * from ints