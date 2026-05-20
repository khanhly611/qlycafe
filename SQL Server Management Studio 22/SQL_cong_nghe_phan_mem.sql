create database cong_nghe_phan_mem
use cong_nghe_phan_mem

create table users(
	user_id varchar(25) primary key,
	email varchar(25),
	user_name varchar(25),
	password_hash varchar(25),
	create_at smalldatetime,
	status varchar(25)
);

create table roles(
	role_id varchar(25) primary key,
	role_name varchar (25)
);

create table user_roles(
	user_roleID varchar(25) primary key,
	user_id varchar(25),
	role_id varchar(25)
);
create table employees(
	employee_id varchar(25) primary key,
	user_id varchar(25),
	full_name varchar(25),
	phone varchar(25),
	hire_date smalldatetime,
	salary float,
	position varchar(25)
);

create table customers(
	customer_id varchar(25) primary key,
	full_name varchar(25),
	phone varchar(25),
	loyalty_points int,
	created_at smalldatetime
)

create table cafe_tables(
	table_id varchar(25) primary key,
	table_number varchar(25),
	status varchar(25)
);

create table reservations(
	reservation_id varchar(25) primary key,
	customer_id varchar(25),
	table_id varchar(25),
	reservation_time smalldatetime,
	number_of_people int,
	status varchar(25)
);

create table categories(
	category_id varchar(25) primary key,
	category_name varchar(25)
);

create table menu_items(
	item_id varchar(25) primary key,
	category_id varchar(25),
	item_name varchar(25),
	price float,
	desription text,
	availability_status varchar(25)
);

create table ingredients(
	ingredient_id varchar(25) primary key,
	ingredient_name varchar(25),
	unit varchar(25),
	stock_quatity float,
	minimum_stock float
);

create table menu_item_ingredients(
	menu_item_ingredients_id varchar(25),
	item_id varchar(25),
	ingredient_id varchar(25),
	quantity_required float,
);

create table suppliers(
	supplier_id varchar(25) primary key,
	supplier_name varchar(25),
	phone varchar(25),
	address varchar(25),
	email varchar(25)
);

create table iventory_logs(
	inventory_log_id varchar(25),
	ingredient_id varchar(25),
	supplier_id varchar(25),
	quantity float,
	log_type varchar(25),
	log_date smalldatetime
);

create table orders(
	order_id varchar(25) primary key,
	customer_id varchar(25),
	employee_id varchar(25),
	table_id varchar(25),
	order_time smalldatetime,
	total_amount float,
	roder_status varchar(25)
);

create table items(
	order_items varchar(25) primary key,
	order_id varchar(25),
	item_id varchar(25),
	quantity int,
	unit_price float,
	subtotal float
);

create table payments(
	payment_id varchar(25) primary key,
	order_id varchar(25),
	payment_method varchar(25),
	payment_time smalldatetime,
	amout float,
	payment_status varchar(25)
);

create table promotions(
	promotion_id varchar(25) primary key,
	promotion_name varchar(25),
	discount_percent float,
	starts_date smalldatetime,
	end_date smalldatetime
);


create table order_promotions(
	order_promotion_id varchar(25) primary key,
	order_id varchar(25),
	promotion_id varchar(25)
);

create table notifications(
	notification_id varchar(25) primary key,
	user_id varchar(25),
	mess text,
	created_at smalldatetime,
	is_read bit
);

create table audit_logs(
	log_id varchar(25) primary key,
	user_id varchar(25),
	action varchar (25),
	log_time smalldatetime










	
