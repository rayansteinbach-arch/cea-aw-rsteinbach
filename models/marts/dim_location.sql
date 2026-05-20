with
    int_location as (
        select * from {{ ref('int_dimension_location') }}
    )

select
    pk_location,
    fk_territory,
    city,
    state_province_code,
    state_province_name,
    country_region_code,
    country_region_name,
    territory_group
from int_location
