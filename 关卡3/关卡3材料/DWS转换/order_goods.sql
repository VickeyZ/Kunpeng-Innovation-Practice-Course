INSERT INTO target.order_goods(
order_id,
	goods_key,
	number,
	price,
	comment_value,
	add_date,
	add_time,
	update_date,
	update_time,
	deleted
)
SELECT oog.order_id,
       gd.goods_key,
       oog.number,
       oog.price,
       oog.comment,
       to_char(oog.add_time, 'YYYYMMDD') :: INTEGER AS add_date,
       0 AS add_time,
       to_char(oog.update_time, 'YYYYMMDD') :: INTEGER AS update_date,
       0 AS update_time,
       oog.deleted
  FROM original.original_order_goods oog
  LEFT JOIN target.goods_dimension gd ON oog.product_id = gd.product_id
  ORDER BY order_id,goods_key;
