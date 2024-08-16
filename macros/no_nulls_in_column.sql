{% macro no_nulls_in_col(modela) %}
select * from {{ modela }}
where
    {% for col in adapter.get_columns_in_relation(modela) -%}
        {{ col.column }} is null OR
    {% endfor %}
    FALSE
{% endmacro %}