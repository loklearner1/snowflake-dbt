{% macro get_season(x) %}
CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (10,11,12,1)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5,6)
    THEN 'SUMMER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (7,8,9)
    THEN 'MONSOON'
    ELSE 'SPRING'
    END
{% endmacro %}

{% macro day_type(x) %}
CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END
{% endmacro %}