
WITH sales AS (
    SELECT *
    FROM {{ ref('stg_raw__sales') }}
),

product AS (
    SELECT *
    FROM {{ ref('stg_raw__product') }}
)

SELECT
    sales.*,
    product.purchase_price,
    sales.quantity * product.purchase_price AS purchase_cost,
    ROUND(sales.revenue - (sales.quantity * product.purchase_price),2) AS margin
FROM sales
LEFT JOIN product
    ON sales.products_id = product.products_id
