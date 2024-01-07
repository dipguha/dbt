-- curl https://dbtlearn.s3.us-east-2.amazonaws.com/seed_full_moon_dates.csv -o seeds/seed_full_moon_dates.csv

-- MODELS/MART/FULL_MOON_REVIEWS.SQL
{{ config(
    materialized = 'table',
) }}

WITH 
fct_reviews AS ( SELECT * FROM {{ ref('fct_reviews') }} ),
full_moon_dates AS (SELECT * FROM {{ ref('seed_full_moon_dates') }})

SELECT
    r.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM fct_reviews r LEFT JOIN full_moon_dates fm
ON   (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))


-- MODELS/SOURCES.YML
version: 2
sources:
    - name: airbnb
      schema: raw
      tables:
        - name: listings
          identifier: raw_listings
        - name: hosts
          identifier: raw_hosts
        - name: reviews
          identifier: raw_reviews
    loaded_at_field: date
    freshness:
        warn_after: {count: 1, period: hour}
        error_after: {count: 24, period: hour}

-- SELECT * FROM AIRBNB.RAW.RAW_LISTINGS -> select * from {{ 'airbnb', listings}}
-- AIRBNB.RAW.RAW_REVIEWS -> {{ 'airbnb', hosts}}
-- AIRBNB.RAW.RAW_HOSTS -> {{ 'airbnb', reviews}}
