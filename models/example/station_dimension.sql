with station as (
    select START_STATION_NAME as station_name,
    START_STATIO_ID as station_id,
    START_LAT as station_latitude,
    START_LNG as station_longitude
    from {{ source('demo', 'bike') }} 
    where RIDE_ID != 'ride_id'
)
select * from station