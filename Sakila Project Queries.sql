USE sakila;


#Error 1055
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


#1) KPIS --
#Total Revenue , #Total Rentals, #Average Revenue per Customer, #Average Rental Duration, #Number of Active - Inactive Customers

SELECT 
    (select SUM(amount) FROM payment ) AS Total_Revenue ,
	(select count(*) from rental) as Total_Rentals,
	(select count(distinct(customer_id)) from payment )as Total_Customers, 
	(select round(sum(amount) / (count(distinct(customer_id))) , 2) from payment) as Average_Revenue_per_Customer,
	(SELECT AVG(DATEDIFF(return_date, rental_date))FROM rental WHERE return_date IS NOT NULL ) AS avg_rental_days,
    (SELECT SUM(active) from customer) AS Active_Customers,
    (Select COUNT(DISTINCT (customer_id)) - SUM(active) from customer) AS Inactive_Customers;


# 2) Total Revenue Per Store
SELECT s.store_id,
       SUM(p.amount) AS revenue
FROM payment p
JOIN staff st ON p.staff_id = st.staff_id
JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id;



#Top 10 Customers by Total Revenue
select 	c.customer_id,	
		c.first_name, 
		c.last_name,
        sum(p.amount) as Total_Revenue
from customer c 
join payment p on c.customer_id = p.customer_id
group by c.customer_id
order by Total_Revenue DESC
limit 10;

#Total Rentals by Film
select 	f.film_id,
		f.title,
        count(rental_id) as Total_Rentals
from film f
join inventory i on i.film_id = f.film_id 
join rental r on r.inventory_id = i.inventory_id
group by f.film_id
order by Total_Rentals DESC;


#Top Genres by Revenue
SELECT c.name AS genre,
       SUM(p.amount) AS revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY revenue DESC;


#Countries with the Most Customers
select 	count(c.customer_id) as Total_Customers,
		co.country
from customer c
join address a on a.address_id = c.address_id 
join city ci on ci.city_id = a.city_id
join country co on co.country_id = ci.country_id
group by co.country
order by Total_Customers desc;


#Best Customers Ranked in each Country (Window Function)
SELECT customer_id,
       name,
       country,
       total_spent,
       RANK() OVER (PARTITION BY country ORDER BY total_spent DESC) AS rank_in_country
FROM (
    SELECT co.country,c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS name,
           SUM(p.amount) AS total_spent
    FROM payment p
    JOIN customer c ON p.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
    GROUP BY co.country, c.customer_id
) x;



# Districts with the Most Customers 
SELECT 
    address_id,
    COUNT(district) AS Total_District_Customers,
    district
FROM
    sakila.address
GROUP BY district
ORDER BY Total_District_Customers DESC;


#Customer Lifetime Value (CLV)
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS name,
       SUM(p.amount) AS lifetime_value,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;


#Films with the highest replacement costs (> 25$)
SELECT title, replacement_cost 
FROM film 
WHERE replacement_cost > 25.00 
ORDER BY replacement_cost DESC;


#Most Profitable Actors
SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
       SUM(p.amount) AS total_revenue
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY a.actor_id
ORDER BY total_revenue DESC;




#Revenue per Film (Profit Proxy)
SELECT 
    f.title,
    COUNT(r.rental_id) AS rentals,
    SUM(p.amount) AS revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id
ORDER BY revenue DESC;





