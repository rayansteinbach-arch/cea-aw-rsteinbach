with 
    source as (
        select * 
        from {{ source('adventure_works', 'production_product') }}
    )

    , renamed as (
        select
            cast(productid      as bigint)      as product_id,
            name                                as product_name,
            productnumber                       as product_number
        from source
    )

select * 
from renamed