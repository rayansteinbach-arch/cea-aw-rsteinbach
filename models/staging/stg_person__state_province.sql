with 
    source as (
        select * 
        from {{ source('adventure_works', 'person_stateprovince') }}
    )

    , renamed as (
        select
            cast(stateprovinceid as bigint) as state_province_id,
            stateprovincecode               as state_province_code,
            countryregioncode               as country_region_code,
            name                            as state_province_name,
            cast(territoryid as bigint)     as territory_id
        from source
    )

select * 
from renamed