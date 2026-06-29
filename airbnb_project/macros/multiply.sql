{% macro multiply(value1, value2, precesion) %}
    round({{value1}} * {{value2}}, {{precesion}})
{% endmacro %}  