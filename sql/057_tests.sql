-- models/schema.yml
version: 2
models:
    - name: dim_listings_cleansed
      columns:
        
        - name: listing_id
            tests:
                - unique
                - not_null

        - name: host_id
            tests:
                - not_null
                - relationships:
                    to: ref('dim_hosts_cleansed')
                    field: host_id
        
        - name: room_type
            tests:
                - accepted_values:
                    values: ['Entire home/apt',
                             'Private room',
                             'Shared room',
                             'Hotel room']

-- tests/dim_listings_minumum_nights.yml
SELECT * FROM {{ ref('dim_listings_cleansed') }} WHERE minimum_nights < 1 LIMIT 10

dbt test --select dim_listings_cleansed

-- tests/consistent_created_at.sql
SELECT * FROM {{ ref('dim_listings_cleansed') }} l
INNER JOIN {{ ref('fct_reviews') }} r
USING (listing_id)
WHERE l.created_at >= r.review_date
