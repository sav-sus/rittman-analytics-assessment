WITH unanswered_questions AS (
  SELECT
    r.question_id,
    r.question_tags AS tag,
    r.question_views,
    r.question_score
  FROM {{ ref('raw_trending_topics') }} r
  LEFT JOIN {{ source('stack_overflow','posts_answers') }} a
         ON r.question_id = a.parent_id
  WHERE a.id IS NULL
),

unanswered_trending AS (
  SELECT
    tag,
    COUNT(DISTINCT question_id) AS total_unanswered_questions,
    SUM(question_views)        AS total_unanswered_views,
    AVG(question_score)        AS avg_question_score
  FROM unanswered_questions
  GROUP BY tag
)

SELECT * 
FROM unanswered_trending
ORDER BY total_unanswered_views DESC