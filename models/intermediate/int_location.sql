with 
    addresses as (
        select * 
        from {{ ref('stg_person__address') }}
    )

    , states as (
        select * 
        from {{ ref('stg_person__state_province') }}
    )

    , countries as (
        select * 
        from {{ ref('stg_person__country_region') }}
    )

    , territories as (
        select * 
        from {{ ref('stg_sales__sales_territory') }}
    )

    , address_enriquecido as (
        select
            a.address_id,
            a.city,
            st.state_province_code,
            st.state_province_name,
            cr.country_region_code,
            cr.country_region_name,
            t.territory_id,
            t.territory_group
        from addresses a
        join states st
            on st.state_province_id = a.state_province_id
        join countries cr
            on cr.country_region_code = st.country_region_code
        join territories t
            on t.territory_id = st.territory_id
    )

select *
from address_enriquecido