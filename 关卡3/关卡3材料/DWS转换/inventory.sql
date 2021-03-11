INSERT INTO target.inventory
  (date_key, goods_key, number)
(WITH cur_inv AS(
         SELECT to_char(inv.update_time, 'YYYYMMDD') :: INTEGER AS update_date,
                inv.product_id AS product_id,
                inv.number
           from (SELECT update_time,
                        id AS product_id,
                        number,
                        ROW_NUMBER() OVER(PARTITION BY id ORDER BY update_time DESC) AS update_inv
                   FROM original.original_goods_product ) inv
           where inv.update_inv = 1)
          SELECT ci.update_date, gd.goods_key, ci.number
            FROM cur_inv ci
            LEFT JOIN target.goods_dimension gd on ci.product_id = gd.product_id
           ORDER BY goods_key);
