WITH tags AS (
    SELECT
        id AS tag_id,
        tag_name,
        count,
        excerpt_post_id,
        wiki_post_id
    FROM {{ source('stack_overflow', 'tags') }}
)
SELECT * FROM tags