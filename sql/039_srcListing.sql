WITH raw_listings AS ( SELECT * FROM AIRBNB.RAW.RAW_LISTINGS)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings


WITH raw_reviews AS ( SELECT * FROM AIRBNB.RAW.RAW_REVIEWS )
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews

WITH raw_hosts AS ( SELECT * FROM AIRBNB.RAW.RAW_HOSTS )
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
