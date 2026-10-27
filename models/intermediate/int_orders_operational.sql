WITH ship AS (
    SELECT *
    FROM {{ ref('stg_raw__ship') }}
),
orders_marg AS (
    SELECT *
    FROM {{ ref('int_orders_margin') }}
    )

    SELECT 
    orders_marg.orders_id, 
    orders_marg.date_date,
    (orders_marg.margin + ship.shipping_fee - ship.logcost - ship.ship_cost)  AS operasyonel_marj
    FROM orders_marg
    LEFT JOIN ship ON ship.orders_id=orders_marg.orders_id
