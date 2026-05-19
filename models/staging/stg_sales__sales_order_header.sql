with source as (
    select * from {{ source('adventure_works', 'sales_salesorderheader') }}
),

renamed as (
    select
        salesorderid        as sales_order_id,
        orderdate           as order_date,
        customerid          as customer_id,
        territoryid         as territory_id,
        creditcardid        as credit_card_id,
        shiptoaddressid     as ship_to_address_id,
        status,
        onlineorderflag     as online_order_flag
    from source
)

select * from renamed