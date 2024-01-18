WITH --start the chain of CTEs

temp_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,

    EXTRACT(DOW FROM date) AS weekday,  -- Extracts the day of the week (0-6, where 0 is Sunday)
    EXTRACT(DAY FROM date) AS day_num    -- Extracts the day of the month
    FROM temp_daily
)
SELECT *
FROM add_weekday