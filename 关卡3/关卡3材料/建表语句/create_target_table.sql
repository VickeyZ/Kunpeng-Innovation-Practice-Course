DROP TABLE IF EXISTS target.date_dimension;

CREATE TABLE target.date_dimension (
	date_key integer NOT NULL,
	full_date date,
	day_of_week tinyint,
	day_num_in_month tinyint,
	day_num_overall smallint,
	day_name varchar(9),
	day_abbrev char(3),
	weekday_flag varchar(10),
	week_num_in_year tinyint,
	week_num_overall smallint,
	week_begin_date date,
	week_begin_date_key integer,
	month tinyint,
	month_num_overall smallint,
	month_name varchar(9),
	month_abbrev char(3),
	quarter tinyint,
	year smallint,
	yearmo int,
	fiscal_month tinyint,
	fiscal_quarter tinyint,
	fiscal_year smallint,
	last_day_in_month_flag varchar(15),
	same_day_year_ago_date date,
	PRIMARY KEY (date_key)
)
DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS target.time_dimension;

CREATE TABLE target.time_dimension (
	time_key integer NOT NULL,
	hour integer,
	minute integer,
	second integer,
	t_am_pm char(2),
	PRIMARY KEY (time_key)
)
DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS target.goods_dimension;

CREATE TABLE target.goods_dimension (
	goods_key serial,
	goods_id integer,
	goods_sn varchar(63),
	goods_name varchar(127),
  category_id integer,
	category_name varchar(63),
	category_keywords varchar(1023),
	category_desc varchar(255),
	category_pid integer,
  brand_id integer,
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
	counter_price decimal(10, 2),
  retail_price decimal(10,2),
	detail text,
	product_id integer,
	specifications varchar(1023),
	gp_add_date integer,
	gp_add_time integer,
	gp_update_date integer,
	gp_update_time integer,
	gp_deleted tinyint,
	category_icon_url varchar(1023),
	category_pic_url varchar(1023),
	category_level varchar(255),
	category_sort_order tinyint,
	category_add_date integer,
	category_add_time integer,
	category_update_date integer,
	category_update_time integer,
	category_deleted tinyint,
	goods_add_date integer,
	goods_add_time integer,
	goods_update_date integer,
	goods_update_time integer,
	goods_deleted tinyint,
	PRIMARY KEY (goods_key)
)
DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS target.user_dimension;

CREATE TABLE target.user_dimension (
	user_key serial,
	user_id integer NOT NULL,
	username varchar(63),
	password varchar(63),
	gender tinyint,
	birthday integer,
	last_login_date integer,
	last_login_time integer,
	last_login_ip varchar(63),
	user_level tinyint,
	nickname varchar(63),
	mobile varchar(20),
	avatar varchar(255),
	weixin_openid varchar(63),
	session_key varchar(100),
	status tinyint,
	add_date integer,
	add_time integer,
	update_date integer,
	update_time integer,
	deleted tinyint,
	PRIMARY KEY (user_key)
)
DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS target.address_dimension;

CREATE TABLE target.address_dimension (
	address_key serial,
	address_id integer NOT NULL,
	province varchar(63),
	city varchar(63),
	county varchar(63),
	address_detail varchar(127),
	area_code char(6),
	postal_code char(6),
	is_default tinyint,
	add_date integer,
	add_time integer,
	update_date integer,
	update_time integer,
	deleted tinyint,
	PRIMARY KEY (address_key)
)
DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS target.orders;

CREATE TABLE target.orders (
	order_id integer NOT NULL,
	order_sn varchar(63),
	order_status smallint,
	user_key integer,
	address_key integer,
	goods_price decimal(10, 2),
	freight_price decimal(10, 2),
	coupon_price decimal(10, 2),
	integral_price decimal(10, 2),
	groupon_price decimal(10, 2),
	order_price decimal(10, 2),
	actual_price decimal(10, 2),
	pay_id varchar(63),
	pay_date integer,
	pay_time integer,
	ship_sn varchar(63),
	ship_channel varchar(63),
	ship_date integer,
	ship_time integer,
	confirm_date integer,
	confirm_time integer,
	message varchar(512),
	comments smallint,
	aftersale_status smallint,
	refund_amount decimal(10, 2),
	refund_type varchar(63),
	refund_content varchar(127),
	refund_date integer,
	refund_time integer,
	end_date integer,
	end_time integer,
	add_date integer,
	add_time integer,
	update_date integer,
	update_time integer,
	deleted tinyint,
	PRIMARY KEY (order_id)
)
DISTRIBUTE BY HASH (order_id)
PARTITION BY RANGE (order_id)
(
        PARTITION p1 VALUES LESS THAN(20000),
        PARTITION p2 VALUES LESS THAN(40000),
        PARTITION p3 VALUES LESS THAN(60000),
        PARTITION p4 VALUES LESS THAN(80000),
        PARTITION p5 VALUES LESS THAN(MAXVALUE)
);

DROP TABLE IF EXISTS target.order_goods;

CREATE TABLE target.order_goods (
	order_id integer,
	goods_key integer,
	number integer,
	price decimal(10, 2),
	comment_value integer,
	add_date integer,
	add_time integer,
	update_date integer,
	update_time integer,
	deleted tinyint,
	PRIMARY KEY (order_id, goods_key)
)
DISTRIBUTE BY HASH(order_id, goods_key);

DROP TABLE IF EXISTS target.inventory;

CREATE TABLE target.inventory (
	date_key integer NOT NULL,
	goods_key integer NOT NULL,
	number integer,
	PRIMARY KEY (date_key, goods_key)
)
DISTRIBUTE BY HASH(date_key, goods_key);
