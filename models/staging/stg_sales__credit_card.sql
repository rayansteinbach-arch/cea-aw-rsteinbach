with source as (
    select * from {{ source('adventure_works', 'sales_creditcard') }}
),

renamed as (
    select
        creditcardid    as credit_card_id,
        cardtype        as card_type
    from source
)

select * from renamed