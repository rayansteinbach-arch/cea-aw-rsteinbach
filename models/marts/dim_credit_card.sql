with
    int_credit_card as (
        select * from {{ ref('int_dimension_credit_card') }}
    )

select
    pk_credit_card,
    card_type
from int_credit_card
