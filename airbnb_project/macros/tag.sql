{% macro tag(col) %}
    CASE
        WHEN {{col}} < 50 THEN 'LOW'
        WHEN {{col}} > 100 THEN 'MEDIUM'
        ELSE 'HIGH'
    END
{% endmacro %}