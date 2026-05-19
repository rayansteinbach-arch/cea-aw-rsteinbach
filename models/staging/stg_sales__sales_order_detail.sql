with 
    source as (
        select * 
        from {{ source('adventure_works', 'sales_salesorderdetail') }}
    )

    , renamed as (
        select
            cast(salesorderdetailid as bigint)      as sales_order_detail_id,
            cast(salesorderid       as bigint)      as sales_order_id,
            cast(productid          as bigint)      as product_id,
            cast(orderqty           as int)         as order_qty,
            cast(unitprice          as decimal(19,4)) as unit_price,
            cast(unitpricediscount  as decimal(19,4)) as unit_price_discount
        from source
    )

select 
    *,
    unit_price * order_qty                             as gross_revenue,
    unit_price * order_qty * (1 - unit_price_discount)   as revenue
from renamed