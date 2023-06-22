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






QUERIES

1) Gives the names of the customers on enetering their id:
select first_name,last_name from customers where id='&g';


2)Gives the phone number of the staff of the cafe on entering the name of the cafe
select s.phone_number from staff s , cafes c where s.cafe_id=c.id and c.name='&g';


3)Gives the names of customers whos total amount is>100:
select c.first_name, o.total_amount from customers c, orders o where c.id=o.customer_id and o.total_amount>100;


4)Gives the names of the manager and the corresponding staff managed by them on entering the cafe-id
select s.first_name, m.first_name from cafes c , staff s, managers m where c.id=s.cafe_id and c.id=m.cafe_id and c.id='&g';


5)Gives the details of the cafe on entering the city-id as 1:
SELECT *FROM cafes WHERE city_id = 1;


6)Retrieve the total number of orders and the total amount spent by each customer:
SELECT c.id, c.first_name, c.last_name, COUNT(o.id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name;



7)Retrieve the top 5 cities with the highest number of cafes:
SELECT c.name AS city_name, COUNT(ca.id) AS cafe_count
FROM cities c
LEFT JOIN cafes ca ON c.id = ca.city_id
GROUP BY c.name
ORDER BY cafe_count DESC
FETCH FIRST 5 ROWS ONLY;


8)Retrieve the customers who have placed orders at multiple cafes:
SELECT c.id, c.first_name, c.last_name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN cafes ca ON o.cafe_id = ca.id
GROUP BY c.id, c.first_name, c.last_name
HAVING COUNT(DISTINCT ca.id) > 1;


9)Retrieve the average price of menu items for each cafe:
SELECT ca.id, ca.name AS cafe_name, AVG(m.price) AS average_price
FROM cafes ca
LEFT JOIN menu m ON ca.id = m.cafe_id
GROUP BY ca.id, ca.name;


10)Retrieve the cafes that have managers and staff members with the same last name:
SELECT ca.id, ca.name AS cafe_name
FROM cafes ca
JOIN managers ma ON ca.id = ma.cafe_id
JOIN staff s ON ca.id = s.cafe_id
WHERE ma.last_name = s.last_name;




PL/SQL QUERIES
11)Retrieve the total number of customers in each city:
SET SERVEROUTPUT ON
DECLARE
  city_id NUMBER;
  city_name VARCHAR2(100);
  customer_count NUMBER;
BEGIN
  FOR city_rec IN (SELECT id, name FROM cities)
  LOOP
    city_id := city_rec.id;
    city_name := city_rec.name;
    
    SELECT COUNT(*) INTO customer_count
    FROM customers
    WHERE city_id = city_rec.id;
    
    DBMS_OUTPUT.PUT_LINE('City: ' || city_name || ', Customer Count: ' || customer_count);
  END LOOP;
END;
/


12)

SET SERVEROUTPUT ON
DECLARE
  customer_id NUMBER;
  first_name VARCHAR2(50);
  last_name VARCHAR2(50);
  average_amount NUMBER;
BEGIN
  FOR customer_rec IN (SELECT id, first_name, last_name FROM customers)
  LOOP
    customer_id := customer_rec.id;
    first_name := customer_rec.first_name;
    last_name := customer_rec.last_name;
    
    SELECT AVG(total_amount) INTO average_amount
    FROM orders
    WHERE customer_id = customer_rec.id;
    
    DBMS_OUTPUT.PUT_LINE('Customer: ' || first_name || ' ' || last_name || ', Average Order Amount: ' || average_amount);
  END LOOP;
END;
/



CURSORS
13)To Retrieve the details of all customers:
SET SERVEROUTPUT ON
DECLARE
  CURSOR customer_cursor IS
    SELECT id, first_name, last_name, email, phone_number, address, city_id
    FROM customers;
    
  customer_rec customer_cursor%ROWTYPE;
BEGIN
  OPEN customer_cursor;
  LOOP
    FETCH customer_cursor INTO customer_rec;
    EXIT WHEN customer_cursor%NOTFOUND;
    
    -- Process customer details
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_rec.id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || customer_rec.first_name || ' ' || customer_rec.last_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || customer_rec.email);
    DBMS_OUTPUT.PUT_LINE('Phone Number: ' || customer_rec.phone_number);
    DBMS_OUTPUT.PUT_LINE('Address: ' || customer_rec.address);
    DBMS_OUTPUT.PUT_LINE('City ID: ' || customer_rec.city_id);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;
  CLOSE customer_cursor;
END;
/



14)To Calculate the total revenue for each cafe:
SET SERVEROUTPUT ON
DECLARE
  CURSOR cafe_cursor IS
    SELECT id, name
    FROM cafes;
    
  cafe_rec cafe_cursor%ROWTYPE;
  total_revenue NUMBER;
BEGIN
  OPEN cafe_cursor;
  LOOP
    FETCH cafe_cursor INTO cafe_rec;
    EXIT WHEN cafe_cursor%NOTFOUND;
    
    -- Calculate total revenue for the cafe
    SELECT SUM(total_amount) INTO total_revenue
    FROM orders
    WHERE cafe_id = cafe_rec.id;
    
    -- Process cafe details
    DBMS_OUTPUT.PUT_LINE('Cafe: ' || cafe_rec.name);
    DBMS_OUTPUT.PUT_LINE('Total Revenue: ' || total_revenue);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;
  CLOSE cafe_cursor;
END;
/




15)To Retrieve the details of all staff members for a specific cafe:
SET SERVEROUTPUT ON
DECLARE
  v_cafe_id NUMBER := 1; -- Specify the desired cafe ID
  CURSOR staff_cursor(p_cafe_id NUMBER) IS
    SELECT id, first_name, last_name, email, phone_number, cafe_id
    FROM staff
    WHERE cafe_id = p_cafe_id;
    
  staff_rec staff_cursor%ROWTYPE;
BEGIN
  OPEN staff_cursor(v_cafe_id);
  LOOP
    FETCH staff_cursor INTO staff_rec;
    EXIT WHEN staff_cursor%NOTFOUND;
    
    -- Process staff member details
    DBMS_OUTPUT.PUT_LINE('Staff ID: ' || staff_rec.id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || staff_rec.first_name || ' ' || staff_rec.last_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || staff_rec.email);
    DBMS_OUTPUT.PUT_LINE('Phone Number: ' || staff_rec.phone_number);
    DBMS_OUTPUT.PUT_LINE('Cafe ID: ' || staff_rec.cafe_id);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;
  CLOSE staff_cursor;
END;
/




PROCEDURES
16)

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE update_customer_address(
  p_id INT,
  p_new_address VARCHAR2
) AS
BEGIN
  UPDATE customers
  SET address = p_new_address
  WHERE id = p_id;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Customer address updated successfully.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating customer address: ' || SQLERRM);
END;
/
BEGIN
update_customer_address(1,'manipal');
END;
/


17) Procedure to insert a new customer:
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE insert_customer(
  p_id INT,
  p_first_name VARCHAR2,
  p_last_name VARCHAR2,
  p_email VARCHAR2,
  p_phone_number VARCHAR2,
  p_address VARCHAR2,
  p_city_id INT
) AS
BEGIN
  INSERT INTO customers(id, first_name, last_name, email, phone_number, address, city_id)
  VALUES(p_id, p_first_name, p_last_name, p_email, p_phone_number, p_address, p_city_id);
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Customer inserted successfully.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error inserting customer: ' || SQLERRM);
END;
/
BEGIN
insert_customer(117,'alwin','tom','alwin@gmail.com',3433123441,'123 street kuwait',3);
END;
/




FUNCTIONS
18)Function to retrieve the full name of a customer given their ID:
 SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION get_customer_full_name(
  p_customer_id INT
) RETURN VARCHAR2 AS
  v_full_name VARCHAR2(100);
BEGIN
  SELECT first_name || ' ' || last_name INTO v_full_name
  FROM customers
  WHERE id = p_customer_id;

  RETURN v_full_name;
END;
/


BEGIN 
get_customer_full_name('&g');
END;
/





TRIGGERS
20)Trigger for checking the existence of a city when inserting or updating a customer
CREATE OR REPLACE TRIGGER check_city_exists_customer
BEFORE INSERT OR UPDATE ON customers
FOR EACH ROW
DECLARE
  city_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO city_exists FROM cities WHERE id = :NEW.city_id;
  IF city_exists = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: The city specified does not exist.');
    ROLLBACK;
  END IF;
END;
/

21)In this trigger, when inserting or updating a row in the customers table, it checks if the email value already exists in the table
CREATE OR REPLACE TRIGGER check_unique_email_customer
BEFORE INSERT OR UPDATE ON customers
FOR EACH ROW
DECLARE
  email_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO email_exists FROM customers WHERE email = :NEW.email;
  IF email_exists > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: The email specified is already in use.');
    :NEW.email := NULL; -- Set email to NULL to prevent the insertion or update
  END IF;
END;
/



22)In this trigger, when inserting or updating a row in the menu table, it checks if the price of the new or updated row is less than or equal to 0. If it is, it sets the price to a default value of 1. This ensures that the price is always positive and avoids any invalid or negative prices in the menu table.

CREATE OR REPLACE TRIGGER check_menu_price
BEFORE INSERT OR UPDATE ON menu
FOR EACH ROW
BEGIN
  IF :NEW.price <= 0 THEN
    :NEW.price := 1; -- Set price to a default value of 1 if it is less than or equal to 0
  END IF;
END;
/


