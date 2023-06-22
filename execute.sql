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
11) To Retrieve the total number of customers in each city:
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


12)Calculate the average order amount for each customer:

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
16)A procedure to update the customer address:

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
    DBMS_OUTPUT.PUT_LINE('Error updating customer address.');
END;
/
BEGIN
  update_customer_address(108, 'manipal');
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
18)The GetCustomerOrderDetails function takes a customerId as input and returns a concatenated string of order details for the given customer.
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION GetCustomerOrderDetails(customerId IN NUMBER) RETURN VARCHAR2
IS
  orderDetails VARCHAR2(4000);
BEGIN
  FOR orderRow IN (
    SELECT c.first_name, c.last_name, o.order_date, ca.name AS cafe_name, m.name AS menu_name, m.price
    FROM customers c
    JOIN orders o ON c.id = o.customer_id
    JOIN cafes ca ON o.cafe_id = ca.id
    JOIN menu m ON o.cafe_id = m.cafe_id
    WHERE c.id = customerId
    ORDER BY o.order_date
  ) LOOP
    orderDetails := orderDetails || orderRow.first_name || ' ' || orderRow.last_name || ', ' ||
                    orderRow.order_date || ', ' || orderRow.cafe_name || ', ' ||
                    orderRow.menu_name || ', ' || orderRow.price || '; ';
  END LOOP;
  
  RETURN orderDetails;
END;
/


DECLARE
  orderDetails VARCHAR2(4000);
BEGIN
  orderDetails := GetCustomerOrderDetails('&g');
  DBMS_OUTPUT.PUT_LINE(orderDetails);
END;
/


19)CREATE OR REPLACE FUNCTION GetTotalOrdersByCustomer(customerId IN INT) RETURN INT
IS
  totalOrders INT;
BEGIN
  SELECT COUNT(*) INTO totalOrders
  FROM orders
  WHERE customer_id = customerId;

  RETURN totalOrders;
END;
/

DECLARE
  customerId INT := 112; -- Replace with the desired customer ID
  totalOrders INT;
BEGIN
  totalOrders := GetTotalOrdersByCustomer(customerId);

  DBMS_OUTPUT.PUT_LINE('Total Orders: ' || totalOrders);
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




DECLARE
  customerId INT := 114; -- Replace with the desired customer ID
  totalOrders INT;
BEGIN
  totalOrders := GetTotalOrdersByCustomer(customerId);

  DBMS_OUTPUT.PUT_LINE('Total Orders: ' || totalOrders);
END;
/
