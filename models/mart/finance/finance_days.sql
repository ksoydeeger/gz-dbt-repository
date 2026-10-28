
WITH oper AS (
    SELECT *
    FROM {{ ref('int_orders_operational') }}
),
ord_mar AS (
    SELECT *
    FROM {{ ref('int_orders_margin') }}
)
SELECT
ord_mar.date_date AS date_date,
COUNT (DISTINCT ord_mar.orders_id) AS order_count,
SUM(ord_mar.revenue) AS revenue,
SUM(ord_mar.revenue)/COUNT (DISTINCT ord_mar.orders_id) AS average_basket,
SUM(oper.operasyonel_marj) AS operasyonel_marj,
SUM(ord_mar.purchase_cost) AS purchase_cost,
SUM(oper.shipping_fee) AS ship_cost,
SUM(oper.logcost) AS logcost,
SUM(ord_mar.quantity) AS quantity

FROM ord_mar
LEFT JOIN oper ON ord_mar.orders_id=oper.orders_id
GROUP BY ord_mar.date_date
ORDER BY ord_mar.date_date