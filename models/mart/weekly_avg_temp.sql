with 

total_avg as(
    select
    city, country, year_num, week_num, lat, lon,
    AVG(avgtemp_c) as avg_temp_week,
    MAX(maxtemp_c) as max_temp_week,
    MIN(mintemp_c) as min_temp_week
    FROM {{ref("prep_temp")}}
    GROUP BY city, country, year_num, week_num, lat, lon
)
select * FROM total_avg    
