with 
    source as (
        select * 
        from {{ source('adventure_works', 'sales_customer') }}
    )

    , renamed as (
        select            
            cast(customerid  as bigint) as customer_id,
            cast(personid    as bigint) as person_id,
            cast(storeid     as bigint) as store_id,
            cast(territoryid as bigint) as territory_id
        from source
    )

select * 
from renamed