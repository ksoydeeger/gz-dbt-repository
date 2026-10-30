{{
    config(
        materialized='view'
    )
}}

WITH cday AS (
    SELECT *
    FROM {{ ref('int_campaigns_vday') }}
),

fday AS (
    SELECT *
    FROM {{ ref('finance_days') }}
)


SELECT 
fday.date_date AS date_date,
fday.operational_marj-cday.ads_cost AS ads_margin,
fday.average_basket AS average_basket,
fday.operational_marj AS operational_margin,
cday.ads_cost AS ads_cost,
cday.ads_impression AS ads_impression,
cday.ads_clicks AS ads_clicks,
fday.quantity AS quantity,
fday.revenue AS revenue,
fday.purchase_cost AS purchase_cost,
fday.ship_cost AS shipping_fee,
fday.logcost AS logcost


FROM fday 
LEFT JOIN cday 
ON cday.date_date=fday.date_date
