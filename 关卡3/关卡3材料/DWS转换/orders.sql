INSERT INTO target.orders
  (order_id,
   order_sn,
   order_status,
   user_key,
   address_key,
   goods_price,
   freight_price,
   coupon_price,
   integral_price,
   groupon_price,
   order_price,
   actual_price,
   pay_id,
   pay_date,
   pay_time,
   ship_sn,
   ship_channel,
   ship_date,
   ship_time,
   confirm_date,
   confirm_time,
   message,
   comments,
   aftersale_status,
   refund_amount,
   refund_type,
   refund_content,
   refund_date,
   refund_time,
   end_date,
   end_time,
   add_date,
   add_time,
   update_date,
   update_time,
   deleted)
select order_id,
       order_sn,
       order_status,
       user_key,
       address_key,
       goods_price,
       freight_price,
       coupon_price,
       integral_price,
       groupon_price,
       order_price,
       actual_price,
       pay_id,
       pay_date,
       pay_time,
       ship_sn,
       ship_channel,
       ship_date,
       ship_time,
       confirm_date,
       confirm_time,
       message,
       comments,
       aftersale_status,
       refund_amount,
       refund_type,
       refund_content,
       refund_date,
       refund_time,
       end_date,
       end_time,
       add_date,
       add_time,
       update_date,
       update_time,
       deleted
  from (SELECT oo.id                               AS order_id,
               order_sn,
               order_status,
               ud.user_key,
               ad.address_key,
               goods_price,
               freight_price,
               coupon_price,
               integral_price,
               groupon_price,
               order_price,
               actual_price,
               pay_id,
               to_char(pay_time, 'YYYYMMDD')       :: INTEGER AS pay_date,
               0                                   AS pay_time,
               ship_sn,
               ship_channel,
               to_char(ship_time, 'YYYYMMDD')      :: INTEGER AS ship_date,
               0                                   AS ship_time,
               to_char(confirm_time, 'YYYYMMDD')   :: INTEGER AS confirm_date,
               0                                   AS confirm_time,
               message,
               comments,
               aftersale_status,
               refund_amount,
               refund_type,
               refund_content,
               to_char(refund_time, 'YYYYMMDD')    :: INTEGER AS refund_date,
               0                                   AS refund_time,
               to_char(end_time, 'YYYYMMDD')       :: INTEGER AS end_date,
               0                                   AS end_time,
               to_char(oo.add_time, 'YYYYMMDD')    :: INTEGER AS add_date,
               0                                   AS add_time,
               to_char(oo.update_time, 'YYYYMMDD') :: INTEGER AS update_date,
               0                                   AS update_time,
               oo.deleted,
               row_number()                        over(partition by oo.id) num
          FROM original.original_order oo
          LEFT JOIN original.original_address oa ON oo.user_id = oa.user_id
          LEFT JOIN target.address_dimension ad ON oa.id = ad.address_id
          LEFT JOIN target.user_dimension ud ON ud.user_id = oo.user_id ) a
 where a.num = 1
 order by order_id;
