# 🎵 Music Store Data Analysis

SQL-driven retail music analytics using real-world relational data.  
A hands-on exploration of customer behavior, genre popularity, and artist impact.

## 📊 About the Project

This project analyzes a simulated music store database containing customer, invoice, track, and artist data. Using structured SQL queries and an ER diagram-based schema, the analysis uncovers key patterns in music consumption. Queries span joins, groupings, subqueries, and ranking techniques to answer strategic business questions and highlight top-performing entities across countries, genres, and cities.

## 🧠 Objectives

- Understand purchasing patterns by country, city, and customer
- Identify top revenue-generating genres and artists
- Explore genre preference across geographies
- Rank customers and invoices based on total spending
- Highlight standout tracks and artists for campaign targeting

## 🗃️ Dataset Schema

Entities include:

| Table         | Highlights                                        |
|--------------|---------------------------------------------------|
| `Customers`   | Location, contact info, support rep linkage      |
| `Invoices`    | Billing details, invoice totals                  |
| `Tracks`      | Genre, media type, duration, pricing             |
| `Albums`      | Track collections linked to artists              |
| `Artists`     | Artist details and track ownership               |
| `Genres`      | Music categories for segmentation                |
| `Employees`   | Support hierarchy for customer service           |
| `InvoiceLines`| Line-by-line purchase granularity                |
| `Playlists`   | Optional curated music groupings                 |

🖼️ See the full ER diagram in [`schema diagram.jpeg`](schema%20diagram.jpeg)

## ❓ Key Business Questions Solved

- 👔 Who is the most senior employee?
- 🌍 Which countries have the highest invoice counts?
- 🧾 What are the top 3 highest invoice totals?
- 🏙️ Which city has the most lucrative customers?
- 🥇 Who is the best customer globally?
- 🎸 Who listens to Rock music, filtered by email domain?
- 🤘 Which artists produced the most Rock tracks?
- ⏱️ Which songs are longer than the average?
- 🧾 How much do customers spend on each artist?
- 🌐 Which genres are popular per country?
- 🧍‍♂️ Who spent the most on music in each country?

## 📌 Noteworthy Insights

- **Top spender**: František Wichterlová from Czech Republic
- **Best city**: Prague with highest total revenue
- **Most dominant genre**: Rock (especially in USA, Canada, France)
- **Highest-spending customers by artist**: Hugh O'Reilly tops with Queen
- **Standout tracks**: "Occupation / Precipice" is the longest (5.2M ms)
- **Top Rock artists**: Led Zeppelin, U2, Deep Purple

## 🧗‍♂️ Challenges Faced

- Handling large datasets and multiple relational tables
- Managing null values during import and transformations
- Crafting accurate, business-relevant queries

## 🏁 Conclusion

This project demonstrates how thoughtful SQL analysis can drive insights in customer segmentation, music trends, and marketing potential. It blends technical skill with business intuition—delivering answers that can guide promotions, inventory, and partnerships.

## 🧠 Learn More

Explore detailed queries and visuals in:
- [`Music Store Data Analysis.sql`](Music%20Store%20Data%20Analysis.sql)
- [`music store qa.sql`](music%20store%20qa.sql)

---

🛠️ Built with: SQL  
📁 Repository: [`Sarvesh244/Music-Store-data-Analysis`](https://github.com/Sarvesh244/Music-Store-data-Analysis)

---

