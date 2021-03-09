-- View our tables
SELECT * FROM customer;
SELECT * FROM customer_email;
SELECT * FROM customer_phone;

-- Attempt to insert a value with no foreign key for referential integrity
INSERT INTO customer_email
  (email, customer_id)
VALUES
  ('lucystern@gmail.com', 5);
  
-- Insert new record in customer table
INSERT INTO customer
  (first_name, last_name)
VALUES
  ('Lucy', 'Stern');

--Insert phone record for Lucy Stern
INSERT INTO customer_phone
  (phone, customer_id)
VALUES
  ('801-783-5019', 5);
  
-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.customer_id = email.customer_id
JOIN customer_phone AS phone
  ON customer.customer_id = phone.customer_id;
