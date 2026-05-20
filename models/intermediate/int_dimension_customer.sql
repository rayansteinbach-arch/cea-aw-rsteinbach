with 
    customers as (
    select * 
    from {{ ref('stg_sales__customer') }}
    )

    , persons as (
        select * 
        from {{ ref('stg_person__person') }}
    )

    , customers_enriquecido as (
        select
            c.customer_id as pk_customer,
            p.first_name,
            p.middle_name,
            p.last_name,
            concat_ws(' ', p.first_name,p.middle_name, p.last_name) as full_name
        from customers c
        join persons p
            on p.person_id = c.person_id
    )
select *
from customers_enriquecido