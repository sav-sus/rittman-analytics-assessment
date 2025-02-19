WITH raw AS (
    SELECT * FROM {{ ref('raw_trending_topics') }}
)

SELECT
    question_tags AS tag,
    COUNT(DISTINCT question_id) AS total_questions,
    SUM(question_views) AS total_views,
    SUM(question_total_votes) AS total_votes,
    SUM(question_total_comments) AS total_comments,
    AVG(tag_usage_count) AS avg_tag_usage
FROM raw
GROUP BY question_tags
ORDER BY total_views DESC, total_votes DESC, total_comments DESC