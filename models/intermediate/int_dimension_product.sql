with
    stg_product as (
        select 
            product_id as pk_product,
            product_name,
            product_number
        from
            {{ ref('stg_production__product') }}
    )

select *
from stg_product