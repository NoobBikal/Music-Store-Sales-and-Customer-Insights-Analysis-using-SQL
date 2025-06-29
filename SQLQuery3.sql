
-- Set 1 Easy 
--1 Who is hte senior most employee based on job title? 
SELECT * FROM employee
ORDER BY levels DESC;

--2 Country with most invoice.
SELECT COUNT(*) AS M, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY M DESC;

--3 Top 3 values of total invoice.
SELECT TOP 3 total FROM invoice 
ORDER BY total desc

--4 Which city has the best customers? Returning 1 city that has the highest sum of invoice totals.
SELECT TOP(1) billing_city, SUM(total) as total_sum  FROM invoice
GROUP BY billing_city
ORDER BY total_sum DESC;


--5 Customer that spend the most money. 
SELECT * FROM customer

SELECT * FROM invoice

SELECT TOP(1) C.customer_id, C.first_name, C.last_name, SUM(I.total) AS Total
FROM customer AS C
INNER JOIN invoice AS I
ON C.customer_id = I.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY Total DESC;







-- Set 2 Moderate
--1 Returning email, first name, last name and Genre with Rock Order by email. 
SELECT * FROM invoice

SELECT DISTINCT email, first_name, last_name
FROM Customer AS C
JOIN invoice AS I
ON C.customer_id = I.customer_id
JOIN invoice_line AS AL
ON  I.invoice_id = AL.invoice_id
WHERE track_id IN(

SELECT track_id FROM Track AS T
JOIN genre AS G
ON T.genre_id = G.genre_id
where G.name LIKE 'Rock'

)
ORDER BY email; 


--2 Returning Top 10 artist name and track count of rock bands. 
SELECT * FROM artist
SELECT * FROM album2
SELECT * FROM track


SELECT TOP(10) A.artist_id, A.name, COUNT(A.artist_id) AS Total_count
FROM track AS T
JOIN album2 AS AA
ON T.album_id = AA.album_id
JOIN artist AS A
ON A.artist_id = AA.artist_id
JOIN genre AS G
ON G.genre_id = T.genre_id
WHERE G.name LIKE 'Rock'
GROUP BY A.artist_id, A.name
ORDER BY Total_count DESC;


--3 Return all the track names that have a song length longer than the average song length.
--  Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 
SELECT * FROM track

SELECT name, milliseconds
FROM track
WHERE milliseconds > (
SELECT AVG(milliseconds) as avg_value FROM track) 
ORDER BY milliseconds desc;







-- Set 3 Advance
--1 Find how much amount spent by each customers on artists? Write a query to return customer name, artist name and total spent
SELECT * FROM invoice_line


WITH best_seller AS (

SELECT TOP(1)A.artist_id, A.name, SUM(IL.quantity * IL.unit_price) AS Total_money
FROM invoice_line AS IL
JOIN track AS T
ON IL.track_id = T.track_id
JOIN album2 AS AA
ON T.album_id = AA.album_id
JOIN artist AS A 
ON AA.artist_id	 = A.artist_id
GROUP BY A.artist_id, A.name
ORDER BY Total_money DESC
)

SELECT C.customer_id, C.first_name, C.last_name,BS.name, SUM(IL.quantity * IL.unit_price) AS Total_money
FROM invoice AS I 
JOIN customer AS C
ON I.customer_id = C.customer_id
JOIN invoice_line AS IL
ON IL.invoice_id = I.invoice_id
JOIN track AS T 
ON IL.track_id = T.track_id
JOIN album2 AS AA
ON T.album_id = AA.album_id
JOIN best_seller AS BS 
ON AA.artist_id = BS.artist_id
GROUP BY C.customer_id, C.first_name, C.last_name, BS.name
ORDER BY Total_money DESC; 



--2 We want to find out the most popular music Genre for each country. 
-- (We determint he most popular game as the genre with the highest amount of purchases)
WITH popular_genre AS (
SELECT COUNT(IL.quantity)AS purchases, C.country, G.genre_id, G.name,
ROW_NUMBER() OVER(PARTITION BY C.country ORDER BY COUNT(IL.quantity)DESC) AS ROW_NUM
FROM customer AS C
JOIN invoice as I
ON C.customer_id = I.customer_id
JOIN invoice_line AS IL
ON I.invoice_id = IL.invoice_id
JOIN track AS T
ON IL.track_id = T.track_id 
JOIN Genre AS G
ON T.genre_id = G.genre_id
GROUP BY C.country, G.genre_id, G.name
)
SELECT * FROM popular_genre WHERE ROW_NUM <=1
ORDER BY purchases DESC




-- 3 Write a query that determines the customer that has spent the most on music for each country. 
--   Write a query that returns the country along with the top customer and how much they spent. 
--   For countries where the top smaount spent is shared, provide all the customers who spent theis amount. 
with customer_with_country AS(
  SELECT C.customer_id, C.first_name, C.last_name, I.billing_country, SUM(I.total) AS total_spending, 
  ROW_NUMBER() OVER(PARTITION BY I.billing_country ORDER BY SUM(I.total)DESC) as ROW_NUM
  FROM invoice AS I 
  JOIN customer AS C
  ON C.customer_id = I .customer_id
  GROUP BY C.customer_id, C.first_name, C.last_name, I.billing_country
)
SELECT * FROM customer_with_country WHERE ROW_NUM <=1; 







