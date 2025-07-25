use musicstore;
-- 1. Who is the senior most employee based on job title? 
SELECT first_name, last_name, title
FROM Employees
ORDER BY title ASC
LIMIT 1;

-- 2. Which countries have the most Invoices? 
SELECT country, COUNT(*) AS invoice_count
FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
GROUP BY country
ORDER BY invoice_count DESC;

-- 3. What are the top 3 values of total invoice? 
SELECT total
FROM Invoices
ORDER BY total DESC
LIMIT 3;

-- 4. Which city has the best customers? - We would like to throw a promotional Music Festival in 
-- the city we made the most money. Write a query that returns one city that has the highest sum of 
-- invoice totals. Return both the city name & sum of all invoice totals 
SELECT billing_city, SUM(total) AS total_revenue
FROM Invoices
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

-- 5. Who is the best customer? - The customer who has spent the most money will be declared 
-- the best customer. Write a query that returns the person who has spent the most money
SELECT c.first_name, c.last_name, c.customer_id, SUM(i.total) AS total_spent
FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC LIMIT 1;

-- 6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A  
SELECT DISTINCT c.email, c.first_name, c.last_name, g.name AS genre
FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
JOIN InvoiceLines il ON i.invoice_id = il.invoice_id
JOIN Tracks t ON il.track_id = t.track_id
JOIN Genres g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock' and c.email LIKE 'A%'  ORDER BY c.email ASC;

-- 7. Let's invite the artists who have written the most rock music in our dataset. Write a query that 
-- returns the Artist name and total track count of the top 10 rock bands  
SELECT ar.name AS artist_name, COUNT(*) AS rock_track_count
FROM Artists ar
JOIN Albums al ON ar.artist_id = al.artist_id
JOIN Tracks t ON al.album_id = t.album_id
JOIN Genres g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY ar.artist_id, ar.name
ORDER BY rock_track_count DESC
LIMIT 10;

-- 8. Return all the track names that have a song length longer than the average song length.- 
-- Return the Name and Milliseconds for each track. Order by the song length, with the longest 
-- songs listed first 
SELECT name, milliseconds FROM Tracks
WHERE milliseconds > (SELECT AVG(milliseconds) FROM Tracks)
ORDER BY milliseconds DESC;

-- 9. Find how much amount is spent by each customer on artists? Write a query to return 
-- customer name, artist name and total spent  
SELECT concat(c.first_name,' ',c.last_name) AS customer_name,
ar.name AS artist_name,ROUND(SUM(il.unit_price * il.quantity), 2) AS total_spent
FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
JOIN InvoiceLines il ON i.invoice_id = il.invoice_id
JOIN Tracks t ON il.track_id = t.track_id
JOIN Albums al ON t.album_id = al.album_id
JOIN Artists ar ON al.artist_id = ar.artist_id
GROUP BY c.customer_id, ar.artist_id ORDER BY total_spent DESC;

-- 10. We want to find out the most popular music Genre for each country. We determine the most 
-- popular genre as the genre with the highest amount of purchases. Write a query that returns 
-- each country along with the top Genre. For countries where the maximum number of purchases 
-- is shared, return all Genres 
SELECT c.country, g.name AS genre, COUNT(*) AS purchases FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
JOIN InvoiceLines il ON i.invoice_id = il.invoice_id
JOIN Tracks t ON il.track_id = t.track_id
JOIN Genres g ON t.genre_id = g.genre_id
GROUP BY c.country, g.name order by purchases desc;

-- 11. Write a query that determines the customer that has spent the most on music for each 
-- country. Write a query that returns the country along with the top customer and how much they 
-- spent. For countries where the top amount spent is shared, provide all customers who spent this 
-- amount 
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,c.country,
SUM(i.total) AS total_spent FROM Customers c
JOIN Invoices i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.country order by total_spent desc;
