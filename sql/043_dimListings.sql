-- models/dim/dim_listings_cleansed.sql
WITH src_listings AS ( SELECT * FROM {{ ref('src_listings') }} )
SELECT
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(price_str, '$' ) :: NUMBER( 10, 2 ) AS price,
    created_at,
    updated_at
FROM
    src_listings


-- models/dim/dim_hosts_cleansed.sql
{{
    config(
    materialized = 'view'
    )
}}

WITH src_hosts AS ( SELECT * FROM {{ ref('src_hosts') }} )
SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts

-- Duplicate
WITH src_hosts AS ( SELECT * FROM {{ ref('src_hosts') }} )
SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts


-- fct/fct_reviews.sql
{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
)
}}

WITH src_reviews AS ( SELECT * FROM {{ ref('src_reviews') }} )

SELECT * 
FROM   src_reviews
WHERE review_text is not null
{% if is_incremental() %}
AND review_date > (select max(review_date) from {{ this }}) --this refers to fct_reviews table
{% endif %}


SELECT * FROM "AIRBNB"."DEV"."FCT_REVIEWS" WHERE listing_id=3176;

INSERT INTO "AIRBNB"."RAW"."RAW_REVIEWS"
VALUES (3176, CURRENT_TIMESTAMP(), 'Zoltan', 'excellent stay!', 'positive');


dbt run --full-refresh

-- dim/dim_listings_w_hosts.sql
WITH
    l AS ( SELECT * FROM {{ ref('dim_listings_cleansed') }}),
    h AS ( SELECT * FROM {{ ref('dim_hosts_cleansed') }})

SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM l LEFT JOIN h ON (h.host_id = l.host_id)

DROP VIEW AIRBNB.DEV.SRC_HOSTS;
DROP VIEW AIRBNB.DEV.SRC_LISTINGS;
DROP VIEW AIRBNB.DEV.SRC_REVIEWS;
