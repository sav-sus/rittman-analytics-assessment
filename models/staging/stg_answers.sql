WITH answers AS (
    SELECT 
        id AS answer_id,
        parent_id AS question_id,
        owner_user_id,
        score,
        creation_date
    FROM {{ source('stack_overflow', 'posts_answers') }}
)

SELECT * FROM answers