CREATE DATABASE cong_nghe_phan_mem;
GO

USE cong_nghe_phan_mem;
GO

CREATE TABLE users (
    user_id VARCHAR(25) PRIMARY KEY,
    email VARCHAR(50),
    user_name VARCHAR(50),
    password_hash VARCHAR(255),
    created_at SMALLDATETIME,
    status VARCHAR(25)
);

CREATE TABLE roles (
    role_id VARCHAR(25) PRIMARY KEY,
    role_name VARCHAR(25)
);

CREATE TABLE user_roles (
    user_role_id VARCHAR(25) PRIMARY KEY,
    user_id VARCHAR(25),
    role_id VARCHAR(25),

    CONSTRAINT fk_user_roles_users
    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    CONSTRAINT fk_user_roles_roles
    FOREIGN KEY (role_id)
    REFERENCES roles(role_id)
);

CREATE TABLE employees (
    employee_id VARCHAR(25) PRIMARY KEY,
    user_id VARCHAR(25),
    full_name VARCHAR(50),
    phone VARCHAR(25),
    hire_date SMALLDATETIME,
    salary DECIMAL(18,2),
    position VARCHAR(25),

    CONSTRAINT fk_employees_users
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

CREATE TABLE customers (
    customer_id VARCHAR(25) PRIMARY KEY,
    full_name VARCHAR(50),
    phone VARCHAR(25),
    loyalty_points INT,
    created_at SMALLDATETIME
);

CREATE TABLE cafe_tables (
    table_id VARCHAR(25) PRIMARY KEY,
    table_number VARCHAR(25),
    status VARCHAR(25)
);

CREATE TABLE reservations (
    reservation_id VARCHAR(25) PRIMARY KEY,
    customer_id VARCHAR(25),
    table_id VARCHAR(25),
    reservation_time SMALLDATETIME,
    number_of_people INT,
    status VARCHAR(25),

    CONSTRAINT fk_reservations_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    CONSTRAINT fk_reservations_tables
    FOREIGN KEY (table_id)
    REFERENCES cafe_tables(table_id)
);

CREATE TABLE categories (
    category_id VARCHAR(25) PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE menu_items (
    item_id VARCHAR(25) PRIMARY KEY,
    category_id VARCHAR(25),
    item_name VARCHAR(50),
    price DECIMAL(18,2),
    description TEXT,
    availability_status VARCHAR(25),

    CONSTRAINT fk_menu_items_categories
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

CREATE TABLE ingredients (
    ingredient_id VARCHAR(25) PRIMARY KEY,
    ingredient_name VARCHAR(50),
    unit VARCHAR(25),
    stock_quantity DECIMAL(18,2),
    minimum_stock DECIMAL(18,2)
);

CREATE TABLE menu_item_ingredients (
    menu_item_ingredient_id VARCHAR(25) PRIMARY KEY,
    item_id VARCHAR(25),
    ingredient_id VARCHAR(25),
    quantity_required DECIMAL(18,2),

    CONSTRAINT fk_menu_item_ingredients_items
    FOREIGN KEY (item_id)
    REFERENCES menu_items(item_id),

    CONSTRAINT fk_menu_item_ingredients_ingredients
    FOREIGN KEY (ingredient_id)
    REFERENCES ingredients(ingredient_id)
);

CREATE TABLE suppliers (
    supplier_id VARCHAR(25) PRIMARY KEY,
    supplier_name VARCHAR(50),
    phone VARCHAR(25),
    address VARCHAR(100),
    email VARCHAR(50)
);

CREATE TABLE inventory_logs (
    inventory_log_id VARCHAR(25) PRIMARY KEY,
    ingredient_id VARCHAR(25),
    supplier_id VARCHAR(25),
    quantity DECIMAL(18,2),
    log_type VARCHAR(25),
    log_date SMALLDATETIME,

    CONSTRAINT fk_inventory_logs_ingredients
    FOREIGN KEY (ingredient_id)
    REFERENCES ingredients(ingredient_id),

    CONSTRAINT fk_inventory_logs_suppliers
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id VARCHAR(25) PRIMARY KEY,
    customer_id VARCHAR(25),
    employee_id VARCHAR(25),
    table_id VARCHAR(25),
    order_time SMALLDATETIME,
    total_amount DECIMAL(18,2),
    order_status VARCHAR(25),

    CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    CONSTRAINT fk_orders_employees
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id),

    CONSTRAINT fk_orders_tables
    FOREIGN KEY (table_id)
    REFERENCES cafe_tables(table_id)
);

CREATE TABLE order_items (
    order_item_id VARCHAR(25) PRIMARY KEY,
    order_id VARCHAR(25),
    item_id VARCHAR(25),
    quantity INT,
    unit_price DECIMAL(18,2),
    subtotal DECIMAL(18,2),

    CONSTRAINT fk_order_items_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_menu_items
    FOREIGN KEY (item_id)
    REFERENCES menu_items(item_id)
);

CREATE TABLE payments (
    payment_id VARCHAR(25) PRIMARY KEY,
    order_id VARCHAR(25),
    payment_method VARCHAR(25),
    payment_time SMALLDATETIME,
    amount DECIMAL(18,2),
    payment_status VARCHAR(25),

    CONSTRAINT fk_payments_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

CREATE TABLE promotions (
    promotion_id VARCHAR(25) PRIMARY KEY,
    promotion_name VARCHAR(50),
    discount_percent DECIMAL(5,2),
    start_date SMALLDATETIME,
    end_date SMALLDATETIME
);

CREATE TABLE order_promotions (
    order_promotion_id VARCHAR(25) PRIMARY KEY,
    order_id VARCHAR(25),
    promotion_id VARCHAR(25),

    CONSTRAINT fk_order_promotions_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_order_promotions_promotions
    FOREIGN KEY (promotion_id)
    REFERENCES promotions(promotion_id)
);

CREATE TABLE audit_logs (
    log_id VARCHAR(25) PRIMARY KEY,
    user_id VARCHAR(25),
    action VARCHAR(100),
    log_time SMALLDATETIME,

    CONSTRAINT fk_audit_logs_users
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

CREATE TABLE products (
    product_id VARCHAR(25) PRIMARY KEY,
    category_id VARCHAR(25),
    description VARCHAR(100),
    price DECIMAL(18,2),
    status VARCHAR(25),
    created_at SMALLDATETIME,

    CONSTRAINT fk_products_categories
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

CREATE TABLE purchase_orders (
    purchase_order_id VARCHAR(25) PRIMARY KEY,
    supplier_id VARCHAR(25),
    order_date SMALLDATETIME,
    total_amount DECIMAL(18,2) NOT NULL DEFAULT 0,
    status VARCHAR(25) NOT NULL DEFAULT 'pending',
    note NVARCHAR(255),
    created_at SMALLDATETIME,

    CONSTRAINT fk_purchase_orders_suppliers
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
);

CREATE TABLE purchase_order_details (
    purchase_order_detail_id VARCHAR(25) PRIMARY KEY,
    purchase_order_id VARCHAR(25),
    ingredient_id VARCHAR(25),
    quantity DECIMAL(10,2) NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,

    CONSTRAINT fk_purchase_order_details_orders
    FOREIGN KEY (purchase_order_id)
    REFERENCES purchase_orders(purchase_order_id),

    CONSTRAINT fk_purchase_order_details_ingredients
    FOREIGN KEY (ingredient_id)
    REFERENCES ingredients(ingredient_id)
);
