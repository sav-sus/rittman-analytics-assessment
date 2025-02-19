WITH users AS (
    SELECT 
        id AS user_id,
        display_name,
        reputation,
        creation_date,
        last_access_date
    FROM {{ source('stack_overflow', 'users') }}
)

SELECT * FROM users