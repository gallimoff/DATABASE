CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    name TEXT NOT NULL,
    quantity INTEGER NOT NULL CHECK ( quantity > 0 ) default 0,
    status TEXT NOT NULL, -- AVAILABLE, ABSENT
    price INTEGER NOT NULL CHECK ( price > 0 )
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER REFERENCES users NOT NULL,
    status TEXT NOT NULL -- PAID, SHIPPED, CART, COMPLETED, CANCELLED
);

CREATE TABLE sales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER REFERENCES orders NOT NULL,
    product_id INTEGER REFERENCES products NOT NULL,
    quantity INTEGER NOT NULL CHECK ( quantity > 0 ) default 0,
    price INTEGER NOT NULL CHECK ( price > 0 )
);

INSERT INTO products(category, name, quantity, status, price) VALUES
('MeatGrinder', 'Scarlett SC-MG45S61',1, 'Available', 3990),
('MeatGrinder', 'Kitfort КТ-2101-3 Carnivora',1, 'Available', 3190),
('MeatGrinder', 'Polaris PMG 2029',1, 'Available', 5290);

INSERT INTO users(id, login, name, email, phone, password) VALUES
(1, 'Aleks', 'Aleksandr', 'aleksandr@bk.ru', '+79876543210','qwerty1'),
(2, 'Vova', 'Vladimir', 'vladimir@mail.ru', '+79876543211','qwerty2'),
(3, 'Nastya', 'Anastasiya', 'Anastasiya@gmail.com', '+79876543212', 'qwerty3' );

INSERT INTO orders(user_id, status) VALUES
(1, 'Paid'),
(2, 'Shipped'),
(3, 'Paid');

INSERT INTO sales(order_id, product_id, quantity, price) VALUES
(1, 2, 3, 3190),
(2, 1, 2, 3990),
(3, 3, 1, 5290);

SELECT  s.order_id, s.product_id, s.quantity, s.price, s.price * s.quantity AS total_prise FROM sales s;