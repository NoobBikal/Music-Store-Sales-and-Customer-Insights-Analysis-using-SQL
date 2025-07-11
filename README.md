# Music Store Sales and Customer Insights Analysis using SQL
##  Project Objective
To analyze music store data using SQL and uncover insights on customer spending, sales trends, top artists, and popular genres.
## Questions (KPIs)
- Who is the senior most employee based on job title?
- Which countries have the most Invoices?
- What are top 3 values of total invoice?
- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one     city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
- Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent   the most money.
- Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with   A
- Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top     10 rock bands
- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song     length with the longest songs listed first.
- Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent
- We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases.     Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.
- Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top       customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount

#  Process 
- Connected to the music database in SSMS.
- Queried key tables: customer, invoice, track, genre, artist, and album.
- Used JOINs to combine related data.
- Applied aggregate functions and filtering.
- Used CTEs and ROW_NUMBER () for ranking.
- Extracted insights on top customers, artists, and genres.

# Project Insights:
-	Queen was the top-selling artist, generating the highest revenue among all artists.
-	The United States and Canada had the most invoices and customer purchases.
-	Rock was the most popular genre in multiple countries.
-	The platform’s top customers contributed significantly to revenue, especially in specific countries.
-	Tracks longer than average was identified, useful for premium content strategy.
-	Genre preferences varied by country, offering insights for targeted promotions.

# Conclusion:
This project used SQL to uncover key insights from the Chinook music store database. It identified Queen as the best-selling artist, highlighted top-spending customers, and revealed country-wise genre trends. These insights support strategic decisions in marketing, sales, and customer engagement.

