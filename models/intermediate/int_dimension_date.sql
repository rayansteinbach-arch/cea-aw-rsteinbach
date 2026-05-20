with
    date_interval as (
        {{ 
            dbt_utils.date_spine(
                datepart="day",
                start_date="cast('2000-01-01' as date)",
                end_date="cast('2050-12-31' as date)"
            )
        }}
    )

    , create_columns as (
        select
            row_number() over(order by date_day asc) as pk_date
            , extract(year from date_day) as year
            , extract(month from date_day) as month
            , extract(day from date_day) as day
            , extract(quarter from date_day) as quarter
            , to_char(date_day, 'yyyy-MM-dd') as full_date
            , extract(dow from date_day) as day_of_week
            , case 
                when extract(dow from date_day) in (0, 6) then true
                else false
            end as is_weekend
        from date_interval
    )

select *
from create_columns