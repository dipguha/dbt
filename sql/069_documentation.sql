-- models/schema.yml

version: 2
models:
- name: dim_listings_cleansed
description: Cleansed table which contains Airbnb listings.
columns:
- name: listing_id
description: Primary key for the listing
tests:
- unique
- not_null
- name: host_id
description: The hostss id. References the host table.
tests:
- not_null
- relationships:
to: ref('dim_hosts_cleansed')
field: host_id
- name: room_type
description: Type of the apartment / room
tests:
- accepted_values:
values: ['Entire home/apt', 'Private room', 'Shared room', 'Hotel room']
- name: minimum_nights
description: '{{ doc("dim_listing_cleansed__minimum_nights") }}'
tests:
- positive_value
- name: dim_hosts_cleansed
columns:
- name: host_id
tests:
- not_null
- unique
- name: host_name
tests:
- not_null
- name: is_superhost
tests:
- accepted_values:
values: ['t', 'f']
- name: fct_reviews
columns:
- name: listing_id
tests:
- relationships:
to: ref('dim_listings_cleansed')
field: listing_id
- name: reviewer_name
tests:
- not_null
- name: review_sentiment
tests:
- accepted_values:
values: ['positive', 'neutral', 'negative']

-- models/docs.md
{% docs dim_listing_cleansed__minimum_nights %}
Minimum number of nights required to rent this property.
Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.
{% enddocs %}

-- models/overview.md
{% docs __overview__ %}
# Airbnb pipeline
Hey, welcome to our Airbnb pipeline documentation!
Here is the schema of our input data:
![input schema](https://dbtlearn.s3.us-east-2.amazonaws.com/input_schema.png)
{% enddocs %}
