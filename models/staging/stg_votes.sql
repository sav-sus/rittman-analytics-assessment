WITH votes AS (
    SELECT
        id AS vote_id,
        creation_date,
        post_id,
        vote_type_id
    FROM {{ source('stack_overflow', 'votes') }}
)
SELECT * FROM votes