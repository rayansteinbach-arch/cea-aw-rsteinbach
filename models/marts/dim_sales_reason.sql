with
    int_sales_reason as (
        select * from {{ ref('int_dimension_sales_reason') }}
    )

select
    pk_sales_reason,
    fk_sales_order,
    fk_sales_reason,
    sales_reason_name,
    sales_reason_type
from int_sales_reason
