with 
    bridge as (
    select * 
    from {{ ref('stg_sales__sales_order_header_sales_reason') }}
    )
 
    , reasons as (
        select * 
        from {{ ref('stg_sales__sales_reason') }}
    )

    , sales_reason_enriquecido as (
        select
            concat_ws(
                '_',
                b.sales_order_id,
                r.sales_reason_id
            ) as pk_sales_reason,
            b.sales_order_id    as fk_sales_order,
            r.sales_reason_id   as fk_sales_reason,
            r.sales_reason_name,
            r.sales_reason_type
        from bridge b
        join reasons r
            on r.sales_reason_id = b.sales_reason_id
    )

select *
from sales_reason_enriquecido