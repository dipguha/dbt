-- macros/no_nulls_in_columns.sql

{% macro no_nulls_in_columns(model) %}
SELECT * FROM {{ model }} WHERE
{% for col in adapter.get_columns_in_relation(model) -%}
{{ col.column }} IS NULL OR
{% endfor %}
FALSE
{% endmacro %}

-- tests/no_nulls_in_dim_listings.sql
{{ no_nulls_in_columns(ref('dim_listings_cleansed')) }}

-- macros/positive_value.sql
{% test positive_value(model, column_name) %}
SELECT
*
FROM
{{ model }}
WHERE
{{ column_name}} < 1
{% endtest %}

-- schema.yml
- name: minimum_nights
  tests:
    - positive_value
