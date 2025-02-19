WITH questions AS (
    SELECT 
        id AS question_id,
        title,
        body,
        tags,
        owner_user_id,
        view_count,
        score,
        answer_count,
        creation_date
    FROM {{ source('stack_overflow', 'posts_questions') }}
)

SELECT * FROM questions