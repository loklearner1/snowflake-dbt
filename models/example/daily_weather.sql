with daily_weather as (
    select city_name, weather, clouds, humidity, pressure, temp, date(time) as recorded_time from {{ source('demo', 'weather') }}
),
daily_weather_agg as (
    select recorded_time, round(avg(temp),2) as AVG_TEMP, round(avg(pressure),2) as AVG_PRESSURE, 
    round(avg(humidity),2) as AVG_HUMIDITY, round(avg(clouds),2) as AVG_CLOUDS, weather 
    from daily_weather 
    group by recorded_time, weather
    qualify row_number() over (PARTITION BY recorded_time ORDER BY COUNT(weather) desc) = 1
)
select * from daily_weather_agg