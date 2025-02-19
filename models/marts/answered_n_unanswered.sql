WITH question_status AS (
    SELECT
      r.question_id,
      r.question_tags AS tag,
      r.question_views,
      CASE WHEN a.id IS NULL THEN 'Unanswered' ELSE 'Answered' END AS answer_status
    FROM {{ ref('raw_trending_topics') }} r
    LEFT JOIN {{ source('stack_overflow','posts_answers') }} a
           ON r.question_id = a.parent_id
),
tag_answer_comparison AS (
    SELECT
      tag,
      answer_status,
      COUNT(DISTINCT question_id) AS total_questions,
      SUM(question_views)        AS total_views
    FROM question_status
    GROUP BY tag, answer_status
)

SELECT *
FROM tag_answer_comparison
ORDER BY total_views DESC