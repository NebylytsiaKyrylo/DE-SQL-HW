/*
 Завдання на SQL до лекції 03.
 */


/*
1.
Вивести кількість фільмів в кожній категорії.
Результат відсортувати за спаданням.

This query counts the number of films in each category by:
1. Joining film_category and category tables
2. Grouping results by category_id and name
3. Counting films per category
4. Sorting in descending order by film count
*/

SELECT c.category_id, name, COUNT(*) AS count_films
  FROM film_category AS fc
           INNER JOIN category AS c
           ON fc.category_id = c.category_id
 GROUP BY c.category_id, name
 ORDER BY count_films DESC;

/*
2.
Вивести 10 акторів, чиї фільми брали на прокат найбільше.
Результат відсортувати за спаданням.

This query finds top 10 most rented actors by:
1. Joining actor info with film_actor to get actor-film relationships
2. Joining with inventory and rental to get rental data
3. Counting total rentals per actor
4. Sorting by rental count and limiting to top 10
*/

SELECT fa.actor_id, a.first_name, a.last_name, COUNT(*) AS count_films
  FROM film_actor AS fa
           JOIN actor AS a
           ON fa.actor_id = a.actor_id
           JOIN inventory AS i
           ON i.film_id = fa.film_id
           JOIN rental AS r
           ON r.inventory_id = i.inventory_id
 GROUP BY fa.actor_id, a.first_name, a.last_name
 ORDER BY count_films DESC
 LIMIT 10;


/*
3.
Вивести категорія фільмів, на яку було витрачено найбільше грошей
в прокаті

This query finds the highest grossing film category by:
1. Joining payment data through rental and inventory tables
2. Connecting to film categories
3. Summing total payment amounts per category
4. Taking the top earning category
*/
SELECT fc.category_id, name, SUM(amount) AS total_amount
  FROM payment AS p
           JOIN rental AS r
           ON p.rental_id = r.rental_id
           JOIN inventory AS i
           ON r.inventory_id = i.inventory_id
           JOIN film_category AS fc
           ON i.film_id = fc.film_id
           JOIN category AS c
           ON fc.category_id = c.category_id
 GROUP BY name, fc.category_id
 ORDER BY total_amount DESC
 LIMIT 1;

-- Alternative approach using existing view for better performance
SELECT *
  FROM sales_by_film_category
 LIMIT 1;


/*
4.
Вивести назви фільмів, яких не має в inventory.
Запит має бути без оператора IN

This query finds films not in inventory by:
1. Using LEFT JOIN between film and inventory tables
2. Filtering for NULL inventory records
3. Alternative to using NOT IN operator
*/
SELECT f.film_id, title
  FROM film AS f
           LEFT JOIN inventory AS i
           ON f.film_id = i.film_id
 WHERE i.film_id IS NULL;


/*
5.
Вивести топ 3 актори, які найбільше зʼявлялись в категорії фільмів "Children".

This query finds top 3 actors in Children's films by:
1. Joining category, film_category, film_actor and actor tables
2. Filtering for 'Children' category using HAVING clause
3. Counting appearances and sorting to get top 3
*/

SELECT fa.actor_id, a.first_name, a.last_name, c.name AS category_name,
       COUNT(*) AS count_films
  FROM category AS c
           JOIN film_category AS fc
           ON fc.category_id = c.category_id
           JOIN film_actor AS fa
           ON fa.film_id = fc.film_id
           JOIN actor AS a
           ON fa.actor_id = a.actor_id
 GROUP BY fa.actor_id, a.first_name, a.last_name, c.name
HAVING c.name = 'Children'
 ORDER BY count_films DESC
 LIMIT 3;
;

-- More efficient version using WHERE clause instead of HAVING
SELECT fa.actor_id, a.first_name, a.last_name, c.name AS category_name,
       COUNT(*) AS count_films
  FROM category AS c
           JOIN film_category AS fc
           ON fc.category_id = c.category_id
           JOIN film_actor AS fa
           ON fa.film_id = fc.film_id
           JOIN actor AS a
           ON fa.actor_id = a.actor_id
 WHERE c.name = 'Children'
 GROUP BY fa.actor_id, a.first_name, a.last_name, c.name
 ORDER BY count_films DESC
 LIMIT 3;