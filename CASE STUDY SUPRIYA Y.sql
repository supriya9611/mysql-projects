use sakila;

------- task 1-----------
select first_name,last_name,actor_id,last_update from actor;

--------- task 2---------

---------- task 2.1--------

select concat(first_name,"    ",last_name) from actor;

---------- task 2.2 --------

select first_name,count(first_name) as totalrepeated
from actor
group by first_name;

----------- task 2.3 ---------
select last_name,count(last_name) as totalrepeated
from actor
group by last_name;

----------- task 3----------
select rating,count(title) as movies from film
group by rating;

---------- task 4 ----------
select rating,avg(rental_rate) as avg_rental_rate from film
group by rating;

----------- task 5 ---------
select title,replacement_cost from film 
where replacement_cost <=9;

select title,replacement_cost from film
where replacement_cost between 15 and 20 
order by replacement_cost;


select title,replacement_cost,rental_rate from film order by replacement_cost desc,rental_rate asc;

---------- task 6 ---------
SELECT film.title,count(film_actor.actor_id) as num_actors
from film
join film_actor on film.film_id=film_actor.film_id
group by film.film_id;

---------- TASK 7------------
SELECT title FROM film WHERE title LIKE 'K%';
SELECT title FROM film WHERE title LIKE 'Q%';

----------- TASK 8-----------
select group_concat(concat(actor.first_name," ",actor.last_name))
from actor
inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film.film_id=film_actor.film_id
where film.title="agent truman";

------------ task 9-----------
select film.title
from film
 inner join film_category on film.film_id=film_category.film_id
 inner join category on film_category.category_id=category.category_id
where category.name="family";

---------- task 10--------

select title,rental_rate,last_update from film order by rental_duration desc;

----------- task 11---------
select CATEGORY.name,count(*) as category_count
from category
inner join film_category
on category.category_id=film_category.category_id
inner join film on film_category.film_id=film.film_id
group by category.name
having avg(film.replacement_cost-film.rental_rate)>15;

------------- TASK 12--------------

SELECT CATEGORY.NAME, COUNT(*) AS movie_count FROM CATEGORY
inner JOIN FILM_CATEGORY
on CATEGORY.category_id=FILM_CATEGORY.category_id
GROUP BY CATEGORY.NAME having movie_count>=60 and movie_count<=70
ORDER BY movie_count DESC ;

