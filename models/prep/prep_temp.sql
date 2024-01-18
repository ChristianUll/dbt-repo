WITH --start the chain of CTEs

temp_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,

    EXTRACT(DOW FROM date) AS weekday,  -- Extracts the day of the week (0-6, where 0 is Sunday)
    EXTRACT(DAY FROM date) AS day_num,    -- Extracts the day of the month
    EXTRACT(WEEK FROM date) AS week_num,
    EXTRACT(MONTH FROM date) AS month_num,
    EXTRACT(YEAR FROM date) AS year_num
    FROM temp_daily
)
SELECT *
FROM add_weekday