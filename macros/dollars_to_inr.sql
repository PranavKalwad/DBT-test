{# A basic example for a project-wide macro to cast a column uniformly #}

{% macro dollars_to_inr(column_name) -%}
    {{ return(adapter.dispatch('dollars_to_inr')(column_name)) }}
{%- endmacro %}

{% macro default__dollars_to_inr(column_name) -%}
    (({{ column_name }})*83.97)::numeric(16, 2)
{%- endmacro %}

{% macro postgres__dollars_to_inr(column_name) -%}
    (({{ column_name }}*83.97)::numeric(16, 2))
{%- endmacro %}

{% macro bigquery__dollars_to_inr(column_name) %}
    round(cast((({{ column_name }})*83.97) as numeric), 2)
{% endmacro %}
