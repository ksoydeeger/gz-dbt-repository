WITH campaigns AS (

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__adwords') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__bing') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__criteo') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_raw__facebook') }}

)

SELECT
    CONCAT(
        CAST(date_date AS STRING),
        '_',
        paid_source,
        '_',
        campaign_key
    ) AS campaign_id,
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM campaigns