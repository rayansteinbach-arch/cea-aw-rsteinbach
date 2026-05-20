with
    int_customer as (
        select * from {{ ref('int_dimension_customer') }}
    )

select
    pk_customer,
    first_name,
    middle_name,
    last_name,
    full_name
from int_customer
