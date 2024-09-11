{% snapshot orders_rupees_snapshot %}

{{
    config(
        target_database='JAFFLE_SHOP',
        target_schema='RAW',  
        unique_key='order_id',        
        strategy='timestamp',         
        updated_at='ordered_at' 
    )
}}

-- The snapshot will capture the entire contents of the orders_rupees table
select * from {{ ref('orders_rupees') }}

{% endsnapshot %}
