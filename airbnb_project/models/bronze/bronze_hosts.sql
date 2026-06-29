{{ config(materialized="incremental", unique_key="HOST_ID", incremental_strategy="merge") }}

SELECT * FROM {{ source('staging', 'hosts') }}
{% if is_incremental() %}
    WHERE UPDATED_AT > (SELECT COALESCE(MAX(UPDATED_AT), '1900-01-01') FROM {{this}})
{% endif %}



