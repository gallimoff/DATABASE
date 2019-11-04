CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    name TEXT NOT NULL,
    quantity INTEGER NOT NULL CHECK ( quantity > 0 ) default 0,
    status TEXT NOT NULL, -- Available, Absent
    price INTEGER NOT NULL CHECK ( price > 0 )
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT UNIQUE,
    name TEXT,
    email TEXT UNIQUE,
    phone TEXT UNIQUE,
    password TEXT
);

CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER REFERENCES users NOT NULL,
    total_price INTEGER NOT NULL,
    status TEXT NOT NULL -- Paid, Shipped, Cart, Completed, Cancelled
);

CREATE TABLE sales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER REFERENCES orders NOT NULL,
    product_id INTEGER REFERENCES products NOT NULL,
    quantity INTEGER NOT NULL CHECK ( quantity > 0 ) default 0,
    price INTEGER NOT NULL CHECK ( price > 0 ),
    total_price INTEGER NOT NULL CHECK ( total_price > 0 )
);

INSERT INTO products(category, name, quantity, status, price) VALUES
    ('MeatGrinder', 'Scarlett SC-MG45S61',1, 'Available', 3990),
    ('MeatGrinder', 'Kitfort КТ-2101-3 Carnivora',1, 'Available', 3190),
    ('MeatGrinder', 'Polaris PMG 2029',1, 'Available', 5290);

INSERT INTO users(id, login, name, email, phone, password) VALUES
    (1, 'Aleks', 'Aleksandr', 'aleksandr@bk.ru', '+79876543210','qwerty1'),
    (2, 'Vova', 'Vladimir', 'vladimir@mail.ru', '+79876543211','qwerty2'),
    (3, NULL, NULL, NULL, NULL, NULL );

INSERT INTO orders(user_id, total_price, status) VALUES
    (1, 3190, 'Paid'),
    (2, 3990, 'Shipped'),
    (3, 5290, 'Paid');

INSERT INTO sales(order_id, product_id, quantity, price, total_price) VALUES
    (1, 2, 3, 3190, 9570),
    (2, 1, 2, 3990, 7980),
    (3, 3, 1, 5290, 5290);
