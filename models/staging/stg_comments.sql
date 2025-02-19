WITH comments AS (
    SELECT 
        id AS comment_id,
        post_id,
        user_id AS commenter_user_id,
        score AS comment_score,
        text AS comment_text,
        creation_date
    FROM {{ source('stack_overflow', 'comments') }}
)

SELECT * FROM comments