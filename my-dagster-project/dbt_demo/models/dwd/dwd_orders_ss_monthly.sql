{{
    config(
        pre_hook=[
            "set hive.exec.dynamic.partition.mode=nonstrict;"
        ],
        materialized='incremental',
        incremental_strategy='insert_overwrite',
        partition_by=['status']
    )
}}

with _tmp as (select 1)
, mappings as (
    select
        id           as order_id,
        user_id      as customer_id,
        order_date   as order_date,
        status       as status
    from {{ source("ods", "ods_orders") }}
    where 1=1
)
, formatted as (
    select
        case when trim(order_id)     = '' then null else order_id    end as order_id,
        case when trim(customer_id)  = '' then null else customer_id end as customer_id,
        case when trim(order_date)   = '' then null else order_date  end as order_date,
        case when trim(status)       = '' then null else status      end as status
    from mappings
)
, filtered as (
    select * from formatted
    where 1=1
        and order_id    is not null
        and customer_id is not null
        and order_date  is not null
        and status      is not null
)
, deduplica_rn as (
    select *, row_number() over (partition by order_id order by order_date desc) as rn from filtered
)
, deduplica_and_final as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from deduplica_rn
    where rn = 1
)
select * from deduplica_and_final;
