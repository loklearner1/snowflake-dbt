with cte as (
    select
    t.*,
    w.*
    from
    {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE = w.recorded_time
)
select * from cte