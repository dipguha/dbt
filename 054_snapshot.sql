-- snapshots/scd_raw_listings.sql
{% snapshot scd_raw_listings %}

{{
    config(
        target_schema='DEV',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

select * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}

-- Update the table
UPDATE AIRBNB.RAW.RAW_LISTINGS SET MINIMUM_NIGHTS=30, updated_at=CURRENT_TIMESTAMP() WHERE ID=3176;
SELECT * FROM AIRBNB.DEV.SCD_RAW_LISTINGS WHERE ID=3176;

-- snapshots/scd_raw_hosts.sql
{% snapshot scd_raw_hosts %}
{{
    config(
        target_schema='DEV',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}
select * FROM {{ source('airbnb', 'hosts') }}

{% endsnapshot %}
