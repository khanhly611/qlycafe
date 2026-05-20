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
	role_id varchar(25),

	constraint fk_user 
	foreign key(user_id)
	references users(user_id)

	

);
create table employees(
	employee_id varchar(25) primary key,
	user_id varchar(25),
	full_name varchar(25),
	phone varchar(25),
	hire_date smalldatetime,
	salary float,
	position varchar(25),

	constraint fk_user
	foreign key(user_id)
	references users(user_id)
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
	status varchar(25),

	constraint fk_customer
	foreign key(customer_id)
	references customers(customer_id),

	constraint fk_table
	foreign key(table_id)
	references cafe_tables(table_id)
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
	availability_status varchar(25),

	constraint fk_category
	foreign key(category_id)
	references categories(category_id)
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

	constraint fk_item
	foreign key(item_id)
	references menu_items(item_id),

	constraint fk_ingredient
	foreign key(ingredient_id)
	references ingredients(ingredient_id)
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

	constraint fk_ingredient
	foreign key(ingredient_id)
	references ingredients(ingredient_id),

	constraint fk_suppy
	foreign key(supplier_id)
	references suppliers(supplier_id)

);

create table orders(
	order_id varchar(25) primary key,
	customer_id varchar(25),
	employee_id varchar(25),
	table_id varchar(25),
	order_time smalldatetime,
	total_amount float,
	roder_status varchar(25),

	constraint fk_customer
	foreign key(customer_id)
	references customers(customer_id),

	constraint fk_employee
	foreign key(employee_id)
	references employees(employee_id),

	constraint fk_table
	foreign key(table_id)
	references cafe_tables(table_id)
);

create table order_items(
	order_items varchar(25) primary key,
	order_id varchar(25),
	item_id varchar(25),
	quantity int,
	unit_price float,
	subtotal float,

	constraint fk_order
	foreign key(order_id)
	references orders(order_id),

	constraint fk_item
	foreign key(item_id)
	references menu_items(item_id)
);

create table payments(
	payment_id varchar(25) primary key,
	order_id varchar(25),
	payment_method varchar(25),
	payment_time smalldatetime,
	amout float,
	payment_status varchar(25),

	constraint fk_order
	foreign key(order_id)
	references orders(order_id)
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

	constraint fk_order
	foreign key(order_id)
	references orders(order_id),

	constraint fk_promotion
	foreign key(promotion_id)
	references promotions(promotion_id)
);



create table audit_logs(
	log_id varchar(25) primary key,
	user_id varchar(25),
	action varchar (25),
	log_time smalldatetime,

	constraint fk_user
	foreign key(user_id)
	references users(user_id)
);

create table prodcuts(
	products_id varchar(25) primary key,
	category_ID varchar(25),
	description varchar(25),
	price float,
	status varchar(25),
	create_at smalldatetime
);
create table purchase_Order(
	purchaseOrder_id varchar(25) primary key,
	supplierId varchar(25),
	orderDate smalldatetime,
	TotalAmount float not null default 0,
	status varchar(25) not null default 'pending',
	note nvarchar(255),
	createAt smalldatetime 
);

create table purchase_Order_Detail(
	PurchaseOrderDetailID varchar(25) primary key,
	purchaseOrder_id varchar(25),
	ingredient_id varchar(25),
	quantity decimal(10,2) not null,
	unitPrice decimal(18,2) not null
)









	
