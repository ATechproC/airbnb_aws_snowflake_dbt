{{ config(materialized="incremental", unique_key="LISTING_ID", incremental_strategy="merge") }}

SELECT * FROM {{ source('staging', 'listings') }}
{% if is_incremental() %}
    WHERE UPDATED_AT > (SELECT COALESCE(MAX(UPDATED_AT), '1900-01-01') FROM {{this}})
{% endif %}



