select * from
    {{ ref("dim_listings_cleansed") }} l
    inner join {{ ref("fct_reviews") }} f
    on l.listing_id = f.listing_id
where l.created_at >= f.review_date
    