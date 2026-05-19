with source as (
    select * from {{ source('adventure_works', 'person_address') }}
),

renamed as (
    select
        addressid       as address_id,
        addressline1    as address_line_1,
        addressline2    as address_line_2,
        city,
        postalcode      as postal_code,
        stateprovinceid as state_province_id
    from source
)

select * from renamed