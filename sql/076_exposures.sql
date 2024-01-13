-- CREATE THE REPORTER ROLE AND PRESET USER IN SNOWFLAKE

USE ROLE ACCOUNTADMIN;
CREATE ROLE IF NOT EXISTS REPORTER;
CREATE USER IF NOT EXISTS PRESET
PASSWORD='presetPassword123'
LOGIN_NAME='preset'
MUST_CHANGE_PASSWORD=FALSE
DEFAULT_WAREHOUSE='COMPUTE_WH'
DEFAULT_ROLE='REPORTER'
DEFAULT_NAMESPACE='AIRBNB.DEV'
COMMENT='Preset user for creating reports';
GRANT ROLE REPORTER TO USER PRESET;
GRANT ROLE REPORTER TO ROLE ACCOUNTADMIN;
GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE REPORTER;
GRANT USAGE ON DATABASE AIRBNB TO ROLE REPORTER;
GRANT USAGE ON SCHEMA AIRBNB.DEV TO ROLE REPORTER;


-- analyses/full_moon_no_sleep.sql
WITH mart_fullmoon_reviews AS (
SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT
    is_full_moon,
    review_sentiment,
    COUNT(*) as reviews
FROM
    mart_fullmoon_reviews
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    is_full_moon,
    review_sentiment

-- Exposures. models/dashboard.yml
version: 2
exposures:
- name: Executive Dashboard
type: dashboard
maturity: low
url: https://7e942fbd.us2a.app.preset.io:443/r/2
description: Executive Dashboard about Airbnb listings and hosts
depends_on:
- ref('dim_listings_w_hosts')
- ref('mart_fullmoon_reviews')
owner:
name: Zoltan C. Toth
email: hello@learndbt.com

-- Post hook, dbt_project.yml
+post-hook:
- "GRANT SELECT ON {{ this }} TO ROLE REPORTER"
