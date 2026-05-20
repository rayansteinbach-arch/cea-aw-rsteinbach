with 
    detail as (
        select * from {{ ref('stg_sales__sales_order_detail') }}
    )

    , header as (
        select * from {{ ref('stg_sales__sales_order_header') }}
    )

    , dim_product as (
        select pk_product as fk_product from {{ ref('int_dimension_product') }}
    )

    , dim_customer as (
        select pk_customer as fk_customer from {{ ref('int_dimension_customer') }}
    )

    , dim_date as (
        select pk_date as fk_date, full_date from {{ ref('int_dimension_date') }}
    )

    , dim_location as (
        select pk_location as fk_location from {{ ref('int_dimension_location') }}
    )

    , dim_credit_card as (
        select pk_credit_card as fk_credit_card from {{ ref('int_dimension_credit_card') }}
    )

    , joined as (
        select
            detail.sales_order_detail_id as pk_sales_order,
            dp.fk_product,
            dc.fk_customer,
            dd.fk_date,
            dl.fk_location,
            dcc.fk_credit_card as fk_credit_card,
            detail.sales_order_id,
            detail.order_qty,
            detail.unit_price,
            detail.unit_price_discount,
            detail.gross_revenue,
            detail.revenue,
            h.status,
            h.online_order_flag
        from detail
        join header h
            on h.sales_order_id = detail.sales_order_id
        join dim_product dp
            on dp.fk_product = detail.product_id
        join dim_customer dc
            on dc.fk_customer = h.customer_id
        join dim_date dd
            on dd.full_date = h.order_date
        join dim_location dl
            on dl.fk_location = h.ship_to_address_id
        left join dim_credit_card dcc
            on dcc.fk_credit_card = h.credit_card_id
    )

select * 
from joined