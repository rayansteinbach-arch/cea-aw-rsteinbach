with
    int_date as (
        select * from {{ ref('int_dimension_date') }}
    )

select
    pk_date,
    year,
    month,
    day,
    quarter,
    full_date,
    day_of_week,
    is_weekend
from int_date
