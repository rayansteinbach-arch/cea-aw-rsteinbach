with
    stg_credit_card as (
        select 
            credit_card_id as pk_credit_card,
            card_type
        from
            {{ ref('stg_sales__credit_card') }}
    )

select *
from stg_credit_card