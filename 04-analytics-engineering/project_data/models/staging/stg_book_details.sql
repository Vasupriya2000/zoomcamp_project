{{ config(materialized='table') }}

SELECT
    bdm.title,
    bdm.description,
    bdm.authors,
    bdm.image,
    bdm.previewlink,
    bdm.publisher,
    bdm.infolink,
    bdm.categories,
    bdm.ratingscount,
    bdm.published_date,
    bdm.published_year,
    -- From the Books Rating table
    brm.Id AS review_id,
    brm.price,
    brm.user_id,
    brm.profileName,
    brm.review_helpfulness,
    brm.review_score,
    brm.review_summary,
    brm.review_text
FROM
    {{ source('staging', 'Books_data_mod_parti_clus1') }} bdm
LEFT JOIN
    {{ source('staging', 'Books_rating_mod_parti_clus') }} brm
ON
    bdm.title = brm.title
