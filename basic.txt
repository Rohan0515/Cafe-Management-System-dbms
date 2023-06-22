drop table cities;
drop table customers;
drop tables cafes;
drop table managers;
drop table staff;
drop table orders;
drop table menu;

CREATE TABLE cities (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  address VARCHAR(200) NOT NULL,
  city_id INT,
  FOREIGN KEY (city_id) REFERENCES cities(id)
);



CREATE TABLE cafes (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL,
  city_id INT,
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE managers (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  cafe_id INT,
  FOREIGN KEY (cafe_id) REFERENCES cafes(id)
);

CREATE TABLE staff (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  cafe_id INT,
  FOREIGN KEY (cafe_id) REFERENCES cafes(id)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  cafe_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (cafe_id) REFERENCES cafes(id)
);

CREATE TABLE menu (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(500) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  cafe_id INT,
  FOREIGN KEY (cafe_id) REFERENCES cafes(id)
);




INSERT INTO cities (id, name) VALUES (1, 'Delhi');
INSERT INTO cities (id, name) VALUES (2, 'Bangalore');
INSERT INTO cities (id, name) VALUES (3, 'Mumbai');
INSERT INTO cities (id, name) VALUES (4, 'Chennai');





INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (101, 'Aarav', 'Kumar', 'aarav.kumar@example.com', '+91-9999999999', '123 Main Street, Delhi, India', 1);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (102, 'Sneha', 'Sharma', 'sneha.sharma@example.com', '+91-8888888888', '456 Park Avenue, Bangalore, India', 2);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (103, 'Vikram', 'Singh', 'vikram.singh@example.com', '+91-7777777777', '789 High Street, Mumbai, India', 3);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (104, 'Neha', 'Gupta', 'neha.gupta@example.com', '+91-6666666666', '567 Low Street, Chennai, India', 4);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (105, 'Kunal', 'Patel', 'kunal.patel@example.com', '+91-9999999999', '123 Main Street, Delhi, India', 1);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (106, 'Shreya', 'Thakur', 'shreya.thakur@example.com', '+91-8888888888', '456 Park Avenue, Bangalore, India', 2);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (107, 'Aryan', 'Joshi', 'aryan.joshi@example.com', '+91-7777777777', '789 High Street, Mumbai, India', 3);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (108, 'Priya', 'Verma', 'priya.verma@example.com', '+91-6666666666', '567 Low Street, Chennai, India', 4);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (109, 'Alok', 'Sharma', 'alok.sharma@example.com', '+91-9999999999', '123 Main Street, Delhi, India', 1);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (110, 'Anjali', 'Shukla', 'anjali.shukla@example.com', '+91-8888888888', '456 Park Avenue, Bangalore, India', 2);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (111, 'Karan', 'Chopra', 'karan.chopra@example.com', '+91-7777777777', '789 High Street, Mumbai, India', 3);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (112, 'Divya', 'Singh', 'divya.singh@example.com','9984894333','marine town,chennai',4);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (113, 'Arnav', 'Kumari', 'arnav.kumari@example.com', '+91-99999999459', '129 Main Street, Delhi, India', 1);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (114, 'Snejal', 'Sharma', 'snejal.sharma@example.com', '+91-8883888888', '123 Park Avenue, Bangalore, India', 2);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (115, 'Vikrant', 'Singh', 'vikrant.singh@example.com', '+91-7777777777', '991 High Street, Mumbai, India', 3);

INSERT INTO customers (id, first_name, last_name, email, phone_number, address, city_id) VALUES (116, 'Nehal', 'Gupta', 'nehal.gupta@example.com', '+91-45666666666', '589 Low Street, Chennai, India', 4);







INSERT INTO cafes (id, name, address, city_id) 
VALUES (1, 'Chai Point', '123 Main St, Rohini, Delhi', 1);

INSERT INTO cafes (id, name, address, city_id) 
VALUES (2, 'Coffee Day', '456 Elm St, Mumbai, Maharashtra', 3);

INSERT INTO cafes (id, name, address, city_id) 
VALUES (3, 'Barista', '789 Oak St, New Delhi, Delhi', 1);

INSERT INTO cafes (id, name, address, city_id) 
VALUES (4, 'Tea Villa Cafe', '101 Pine St, indiranagar,Bangalore', 2);

INSERT INTO cafes (id, name, address, city_id) 
VALUES (5, 'Mocha', '555 Cedar St, Chennai, Tamil Nadu', 4);

INSERT INTO cafes (id, name, address, city_id) 
VALUES (6, 'Chaayos', '777 Birch St, Whitefield, Bangalore', 2);

INSERT INTO cafes (id, name, address, city_id) VALUES 
(7, 'Rajasthani Cafe', '123 Main St, Mumbai', 3);
INSERT INTO cafes (id, name, address, city_id) VALUES(8, 'Mughal Bistro', '456 Central Ave, chennai', 4);





INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (1, 'Amit', 'Patel', 'amit.patel@example.com', '9876543210', 1);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (2, 'Manisha', 'Shah', 'manisha.shah@example.com', '9876543211', 2);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (3, 'Alok', 'Jain', 'alok.jain@example.com', '9876543212', 3);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (4, 'Priya', 'Gupta', 'priya.gupta@example.com', '9876543213', 4);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (5, 'Rajesh', 'Mishra', 'rajesh.mishra@example.com', '9876543214', 5);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (6, 'Nisha', 'Singh', 'nisha.singh@example.com', '9876543215', 6);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (7, 'Vivek', 'Raj', 'vivek.raj@example.com', '9876543216', 7);

INSERT INTO managers (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (8, 'Anjali', 'Sharma', 'anjali.sharma@example.com', '9876543217', 8);










INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '1234567890', 1);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (2, 'Aditi', 'Patel', 'aditi.patel@example.com', '2345678901', 2);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (3, 'Advait', 'Kumar', 'advait.kumar@example.com', '3456789012', 3);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (4, 'Aishwarya', 'Gupta', 'aishwarya.gupta@example.com', '4567890123', 4);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (5, 'Amit', 'Singh', 'amit.singh@example.com', '5678901234', 5);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (6, 'Anika', 'Chakraborty', 'anika.chakraborty@example.com', '6789012345', 6);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (7, 'Anish', 'Rao', 'anish.rao@example.com', '7890123456', 7);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (8, 'Aparna', 'Desai', 'aparna.desai@example.com', '8901234567', 8);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (9, 'Arjun', 'Menon', 'arjun.menon@example.com', '9012345678', 1);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (10, 'Dhruv', 'Nair', 'dhruv.nair@example.com', '0123456789', 2);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (11, 'Isha', 'Shah', 'isha.shah@example.com', '9876543210', 3);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (12, 'Karan', 'Soni', 'karan.soni@example.com', '8765432109', 4);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (13, 'Krishna', 'Raj', 'krishna.raj@example.com', '7654321098', 5);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (14, 'Neha', 'Bhatia', 'neha.bhatia@example.com', '6543210987', 6);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (15, 'priya', 'Bhat', 'priya.bhat@example.com', '6554210987', 7);

INSERT INTO staff (id, first_name, last_name, email, phone_number, cafe_id)
VALUES (16, 'lalu', 'Bholu', 'lalu.bholu@example.com', '6543310987', 8);








INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (1, 101, 4, sysdate, 129);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (2, 102, 2, sysdate, 180);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (3, 103, 1, sysdate, 95);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (4, 104, 5, sysdate, 79);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (5, 105, 3, sysdate, 165);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (6, 106, 1, sysdate, 100);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (7, 107, 2, sysdate, 220);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (8, 108, 4, sysdate, 135);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (9, 109, 3, sysdate , 59);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (10, 110, 8, sysdate, 80);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (11, 111, 2, sysdate, 115);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (12, 112, 5, sysdate, 149);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (13, 113, 7, sysdate, 60);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (14, 114, 2, sysdate, 195);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (15, 115, 6, sysdate , 129);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (16, 116, 3, sysdate , 80);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (17, 115, 8, sysdate, 145);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (18, 106, 2, sysdate, 99);

INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (19, 112, 1, sysdate, 110);


INSERT INTO orders (id, customer_id, cafe_id, order_date, total_amount)
VALUES (20, 107, 7, sysdate, 150);









INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (1, 'Samosa', 'Fried or baked pastry with savory filling', 29, 1);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (2, 'Tandoori Chicken', 'Roasted chicken marinated in yogurt and spices', 209, 2);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (3, 'Butter Chicken', 'Chicken in a creamy tomato-based sauce', 210, 3);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (4, 'Biryani', 'Spiced rice dish with meat or vegetables', 109, 4);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (5, 'Chole Bhature', 'Spicy chickpeas with fried bread', 89, 5);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (6, 'Paneer Tikka', 'Grilled paneer with spices and vegetables', 129, 1);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (7, 'Masala Dosa', 'Crispy crepe filled with potatoes and spices', 69, 2);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (8, 'Aloo Gobi', 'Potato and cauliflower curry', 109, 3);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (9, 'Fish Curry', 'Fish in a spicy tomato-based sauce', 149, 4);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (10, 'Rogan Josh', 'Lamb in a spicy tomato-based sauce', 159, 5);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (11, 'Mutter Paneer', 'Paneer and peas in a tomato-based sauce', 119, 1);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (12, 'Samosa Chaat', 'Samosas topped with chickpeas, chutneys, and yogurt', 69, 2);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (13, 'Dal Makhani', 'Creamy lentil stew', 99, 3);

INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (14, 'Tandoori Fish', 'Fish marinated in yogurt and spices and grilled', 139, 4);


INSERT INTO menu (id, name, description, price, cafe_id) 
VALUES (15, 'Dal Tadka', 'Dal with tadka in aromatic flavour', 129, 5);