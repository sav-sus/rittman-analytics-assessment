-- This is the main table for the main source
WITH questions AS (
    SELECT
        id AS question_id,
        title,
        body,
        owner_user_id AS question_author_id,
        view_count,
        score AS question_score,
        answer_count,
        creation_date AS question_created_at,
        tag
    FROM {{ source('stack_overflow', 'posts_questions') }},
    -- unnesting the tags so we can look at the topics
    UNNEST(SPLIT(tags, '|')) AS tag
),

-- Need to count how many votes the question have
votes AS (
    SELECT
        post_id AS question_id,
        COUNT(*) AS total_votes
    FROM {{ source('stack_overflow', 'votes') }}
    GROUP BY question_id
),

-- Counting how many comments this has
comments AS (
    SELECT
        post_id AS question_id,
        COUNT(*) AS total_comments
    FROM {{ source('stack_overflow', 'comments') }}
    GROUP BY question_id
),

-- counting the tags on a bigger level
tag_metadata AS (
    SELECT
        tag_name,
        count AS tag_usage_count,
        wiki_post_id
    FROM {{ source('stack_overflow', 'tags') }}
),

-- Finalising the last CTE
trending_topics AS (
    SELECT
        q.question_id,
        q.title as question_title,
        q.body as question_body,
        q.question_author_id,
        q.view_count as question_views,
        q.question_score,
        q.answer_count as question_answer_count,
        q.question_created_at,
        q.tag as question_tags,
        COALESCE(v.total_votes, 0) AS question_total_votes,
        COALESCE(c.total_comments, 0) AS question_total_comments,
        t.tag_usage_count,
        t.wiki_post_id
    FROM questions q
    LEFT JOIN votes v ON q.question_id = v.question_id
    LEFT JOIN comments c ON q.question_id = c.question_id
    LEFT JOIN tag_metadata t ON q.tag = t.tag_name
)

SELECT * FROM trending_topics