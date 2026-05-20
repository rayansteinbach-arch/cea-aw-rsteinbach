with
    int_product as (
        select * from {{ ref('int_dimension_product') }}
    )

select
    pk_product,
    product_name,
    product_number
from int_product
