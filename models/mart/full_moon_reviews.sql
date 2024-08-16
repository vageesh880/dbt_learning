{{ config(
    materialized = 'table',
) }}

with fct_reviews as (
    select * from {{ ref("fct_reviews") }}
),
full_moon_dates as (
    select * from {{ ref("seed_full_moon_dates") }}
)
select
    r.*,
    CASE
        when fm.full_moon_date is null then 'not full moon'
        else 'full moon'
    end as full_moon
from
    fct_reviews 
    r
    left join full_moon_dates fm on (TO_DATE(r.review_date) = DATEADD(DAY,1, fm.full_moon_date))