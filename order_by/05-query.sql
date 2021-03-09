
-- Find the count of payments per customer in descending order
SELECT customer_id, COUNT(*) AS payment_count
FROM payment
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

--Note difference in syntax 
SELECT customer_id, COUNT(*) AS payment_count
FROM payment
GROUP BY customer_id
ORDER BY payment_count DESC;

-- Find the top 5 customers who have spent the most money
SELECT customer_id, SUM(amount) AS total_payment_amount
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- Find the bottom 5 customers who have spent the least money
SELECT customer_id, SUM(amount) AS total_payment_amount
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) ASC
LIMIT 5;

-- Find the top 10 customers with the highest average payment
-- rounded to two decimal places
SELECT customer_id, ROUND(AVG(amount), 2) AS average_payment_amount
FROM payment
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 5;

-- view payment table
SELECT * FROM payment LIMIT 10;
-- view staff table
SELECT * FROM staff LIMIT 10;

-- BONUS 1: find the staff names and their number of customers serviced in descending order.
SELECT b.first_name, b.last_name, COUNT(customer_id) AS customer_count
FROM payment AS a
JOIN staff AS b ON a.staff_id = b.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(customer_id) DESC;

SELECT first_name, last_name, COUNT(customer_id) AS customer_count
FROM payment a
JOIN staff b ON a.staff_id = b.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(customer_id) DESC;

-- Old syntax 
SELECT first_name, last_name, COUNT(customer_id) AS customer_count
FROM payment, staff
WHERE payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(customer_id) DESC;

-- BONUS 2: determine the count of payments per day in descending order.
SELECT CAST(payment_date AS DATE) as payment_date, COUNT(*) as "Payments per Day"
FROM payment
GROUP BY CAST(payment_date AS DATE)
ORDER BY COUNT(*) DESC;
