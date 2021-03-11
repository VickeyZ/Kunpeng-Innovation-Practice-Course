INSERT INTO target.address_dimension
  (address_id,
   province,
   city,
   county,
   address_detail,
   area_code,
   postal_code,
   is_default,
   add_date,
   add_time,
   update_date,
   update_time,
   deleted)
SELECT id AS address_id,
       province,
       city,
       county,
       address_detail,
       area_code,
       postal_code,
       is_default,
       to_char(add_time, 'YYYYMMDD') :: INTEGER AS add_date,
       0 AS add_time,
       to_char(update_time, 'YYYYMMDD') :: INTEGER AS update_date,
       0 AS update_time,
       deleted
  FROM original.original_address
ORDER BY id;
