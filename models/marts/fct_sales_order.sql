with
    int_sales_order as (
        select * from {{ ref('int_fact_sales_order') }}
    )

select
    pk_sales_order,
    fk_product,
    fk_customer,
    fk_date,
    fk_location,
    fk_credit_card,
    sales_order_id,
    order_qty,
    unit_price,
    unit_price_discount,
    gross_revenue,
    revenue,
    status,
    online_order_flag
from int_sales_order
