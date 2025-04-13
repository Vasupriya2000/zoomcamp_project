{{ config(materialized='table') }}

SELECT
    title,
    description,
    authors,
    image,
    previewlink,
    publisher,
    infolink,
    categories,
    ratingscount,
    published_date,
    published_year,
    
    -- Aggregations
    AVG(review_score) AS avg_review_score,
    COUNT(review_score) AS review_count,

    -- Popularity band based on ratings count
    CASE 
        WHEN ratingscount >= 1000 THEN 'High'
        WHEN ratingscount >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS popularity_band

FROM {{ ref('stg_book_details') }}
WHERE title IS NOT NULL
GROUP BY
    title, description, authors, image, previewlink, publisher,
    infolink, categories, ratingscount, published_date, published_year
