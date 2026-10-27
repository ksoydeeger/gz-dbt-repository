WITH oper AS (
    SELECT *
    FROM {{ ref('int_orders_operational') }}
)
SELECT
date_date,
COUNT (DISTINCT orders_id) AS order_count,
SUM(revenue) AS revenue,
SUM(revenue)/COUNT (orders_id) AS average_basket,
SUM(operasyonel_marj) AS operasyonel_marj,
SUM(purchase_cost) AS purchase_cost,
SUM(shipping_fee) AS ship_cost,
SUM(logcost) AS logcost,
SUM(quantity) AS quantity

FROM oper
GROUP BY date_date
ORDER BY date_date