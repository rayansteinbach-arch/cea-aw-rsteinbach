with 
    source as (
        select * 
        from {{ source('adventure_works', 'sales_salesorderheader') }}
    )

    , renamed as (
        select
            cast(salesorderid       as bigint)      as sales_order_id,
            cast(orderdate          as date)        as order_date,
            cast(customerid         as bigint)      as customer_id,
            cast(territoryid        as bigint)      as territory_id,
            cast(creditcardid       as bigint)      as credit_card_id,
            cast(shiptoaddressid    as bigint)      as ship_to_address_id,
            cast(status             as smallint)    as status,
            cast(onlineorderflag    as boolean)     as online_order_flag
        from source
    )

select * 
from renamed