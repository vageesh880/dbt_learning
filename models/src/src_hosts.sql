WITH r_hosts AS (
 SELECT
 *
 FROM
 --AIRBNB.RAW.RAW_HOSTS
    {{ source('AIRBNB','hosts')}}
)
SELECT
 id AS host_id,
 NAME AS host_name,
 is_superhost,
 created_at,
 updated_at
FROM
 r_hosts