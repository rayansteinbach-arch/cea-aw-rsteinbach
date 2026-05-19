with 
    source as (
        select * 
        from {{ source('adventure_works', 'person_person') }}
    )

    , renamed as (
        select
            cast(businessentityid as bigint) as person_id,
            persontype                       as person_type,
            firstname                        as first_name,
            middlename                       as middle_name,
            lastname                         as last_name
        from source
    )

select * 
from renamed