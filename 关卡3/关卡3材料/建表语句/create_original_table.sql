DROP TABLE IF EXISTS original.original_goods;

CREATE TABLE original.original_goods (
  id int NOT NULL,
  goods_sn varchar(63) NOT NULL,
  name varchar(127) NOT NULL,
  category_id int,
  brand_id int,
  gallery varchar(1023),
  keywords varchar(255),
  brief varchar(1023),
  is_on_sale tinyint,
  sort_order smallint,
  pic_url varchar(1023),
  share_url varchar(1023),
  is_new tinyint,
  is_hot tinyint,
  unit varchar(31),
  counter_price decimal(10,2),
  retail_price decimal(10,2),
  detail text,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_goods_product;

CREATE TABLE original.original_goods_product (
  id int NOT NULL,
  goods_id int NOT NULL,
  specifications varchar(1023) NOT NULL,
  price decimal(10,2) NOT NULL,
  number int NOT NULL,
  url varchar(125),
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_order;

CREATE TABLE original.original_order (
  id int NOT NULL,
  user_id int NOT NULL,
  order_sn varchar(63) NOT NULL,
  order_status smallint NOT NULL,
  aftersale_status smallint,
  consignee varchar(63) NOT NULL,
  mobile varchar(63) NOT NULL,
  address varchar(127) NOT NULL,
  message varchar(512),
  goods_price decimal(10,2) NOT NULL,
  freight_price decimal(10,2) NOT NULL,
  coupon_price decimal(10,2) NOT NULL,
  integral_price decimal(10,2) NOT NULL,
  groupon_price decimal(10,2) NOT NULL,
  order_price decimal(10,2) NOT NULL,
  actual_price decimal(10,2) NOT NULL,
  pay_id varchar(63),
  pay_time date,
  ship_sn varchar(63),
  ship_channel varchar(63),
  ship_time date,
  refund_amount decimal(10,2),
  refund_type varchar(63),
  refund_content varchar(127),
  refund_time date,
  confirm_time date,
  comments smallint,
  end_time date,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_order_goods;

CREATE TABLE original.original_order_goods (
  id int NOT NULL,
  order_id int NOT NULL,
  goods_id int NOT NULL,
  goods_name varchar(127) NOT NULL,
  goods_sn varchar(63) NOT NULL,
  product_id int NOT NULL,
  number smallint NOT NULL,
  price decimal(10,2) NOT NULL,
  specifications varchar(1023) NOT NULL,
  pic_url varchar(1023) NOT NULL,
  comment int,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_address;

CREATE TABLE original.original_address (
  id int NOT NULL,
  name varchar(63) NOT NULL,
  user_id int NOT NULL,
  province varchar(63) NOT NULL,
  city varchar(63) NOT NULL,
  county varchar(63) NOT NULL,
  address_detail varchar(127) NOT NULL,
  area_code char(6),
  postal_code char(6),
  tel varchar(20) NOT NULL,
  is_default tinyint NOT NULL,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_user;

CREATE TABLE original.original_user (
  id int NOT NULL,
  username varchar(63) NOT NULL,
  password varchar(63) NOT NULL,
  gender tinyint NOT NULL,
  birthday date,
  last_login_time date,
  last_login_ip varchar(63) NOT NULL,
  user_level tinyint,
  nickname varchar(63),
  mobile varchar(20) NOT NULL,
  avatar varchar(255),
  weixin_openid varchar(63),
  session_key varchar(100),
  status tinyint NOT NULL,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS original.original_category;

CREATE TABLE original.original_category (
  id int NOT NULL,
  name varchar(63) NOT NULL,
  keywords varchar(1023),
  cdesc varchar(255),
  pid int NOT NULL,
  icon_url varchar(255),
  pic_url varchar(1023),
  level varchar(255),
  sort_order tinyint,
  add_time date,
  update_time date,
  deleted tinyint,
  PRIMARY KEY (id)
);

