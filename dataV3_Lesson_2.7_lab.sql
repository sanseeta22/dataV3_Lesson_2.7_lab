use sakila;

SELECT * FROM film_category;

SELECT * from payment;

-- 1 How many films are there for each of the 
-- categories in the category table. Use appropriate 
-- join to write this query.

SELECT 
    c.name AS category, 
    COUNT(fc.film_id) AS num_films
FROM 
    category c
INNER JOIN 
    film_category fc ON c.category_id = fc.category_id

GROUP BY 
    c.name;
    
    
-- 2 Display the total amount rung up by each 
-- staff member in August of 2005.

SELECT s.staff_id,
CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
SUM(p.amount) as total_amount
FROM payment p
JOIN staff s ON s.staff_id=p.staff_id
WHERE p.payment_date >= '2005-08-01' AND p.payment_date <= '2005-08-31'
GROUP BY 
    s.staff_id, s.first_name, s.last_name;
    
-- 3 Which actor has appeared in the most films?

SELECT 
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(fa.film_id) AS film_count
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    film_count DESC
LIMIT 1; 

-- 4 Most active customer
-- (the customer that has rented the most number of films)

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS rental_count
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    rental_count DESC
LIMIT 1;

-- 5 Display the first and last names,
--  as well as the address, of each staff member.

SELECT 
    s.first_name,
    s.last_name,
    a.address
FROM 
    staff s
JOIN 
    address a ON s.address_id = a.address_id;
    
-- 6 List each film and the number of actors who are listed for that film.

SELECT 
    film.title AS film_title,
    COUNT(film_actor.actor_id) AS actor_count
FROM 
    film
JOIN 
    film_actor ON film.film_id = film_actor.film_id
GROUP BY 
    film.film_id, film.title;
    
-- 7  list the total paid by each customer.
--  List the customers alphabetically by last name.
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_paid
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    c.last_name, c.first_name;

-- 8 List the titles of films per category.

SELECT 
    c.name AS category_name,
    f.title AS film_title
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
ORDER BY 
    c.name, f.title;
    
    


