# 🍿Revenue and Customer Performance Dashboard using MySQL and Excel (Sakila Database)
This project presentsa static executive dashboard built in Excel using data extracted from the Sakila database via MySQL queries.

<img width="1920" height="807" alt="Sakila Project Banner " src="https://github.com/user-attachments/assets/67f8f60f-aad7-49ed-aca3-72db1cc00f5d" />

## 📌Background
Sakila represents a fictional DVD rental company that operates multiple stores and offers a wide variety of films in different genres. The company wants to better understand:

- Which film categories generate the most revenue
- Who their most valuable customers are
- Which stores perform better
- How rentals and revenue are changing over time

The management team asked the Data Analyst to explore the database and provide actionable insights that could help improve business decisions, marketing strategy, and inventory management.

## 🛠Tools Used
 SQL (MySQL , Sakila Database) :
- SQL joins
- Aggregations (SUM, COUNT, AVG)
- Window functions
- Grouping
- Sorting

Microsoft Excel :
- Executive Dashboard & Visualization

## 📊Key KPIs
- Total Revenue
- Total Rentals
- Average Revenue per Customer
- Average Rental Duration
- Active vs Inactive Customers

## 🔍Key Insights
- Revenue is strongly correlated with the number of customers per country.
- Customer value is evenly distributed across the customer base.
- Movie rentals show balanced demand with no extreme concentration.
- The business model appears diversified and resilient.

## 🧠Business Recommendations
- Focus growth initiatives on countries with high customer volumes, as customer count strongly correlates with revenue.
- Maintain broad-based customer strategies, as customer value is evenly distributed.
- Continue supporting a diverse film catalog due to balanced rental demand.
- Leverage diversified revenue distribution to reduce business risk.
- Explore reactivation strategies for inactive customers to drive incremental growth.

## 📁Data Source
This project uses the **Sakila sample database** as a case study to demonstrate SQL data extraction and Excel-based performance reporting.

The database contains:


- `film` : Film details (title, rating, length, etc.)
- `category` & `film_category` : Film genres
- `inventory` : Film copies available in each store
- `rental` : Rental transactions
- `payment` : Customer payments*
- `customer` : Customer information
- `store` : Store data
- `staff` : Employee data

*We assume the amount from the payments table is measured in US Dollars ($)

## 📈Dashboard Preview

<img width="1897" height="799" alt="Sakila Excel  Dashboard Screenshot" src="https://github.com/user-attachments/assets/2e1d9a98-8010-40c4-9ebf-5f98736da128" />

<img width="1920" height="1032" alt="Sakila Project Queries Screenshot 1" src="https://github.com/user-attachments/assets/7031bce9-087d-4b29-b2e6-5ef18e52355b" />
<img width="1920" height="1032" alt="Sakila Project Queries Screenshot 2" src="https://github.com/user-attachments/assets/70c7dcbd-5fe1-4e7f-ba84-8efa71599f17" />
<img width="1920" height="1032" alt="Sakila Project Queries Screenshot 3" src="https://github.com/user-attachments/assets/4958c91c-2b27-4f47-9bfa-768f2ae61080" />
<img width="1920" height="1032" alt="Sakila Project Queries Screenshot 4" src="https://github.com/user-attachments/assets/f58abdf0-9ead-4baa-99f6-95a2ccd74276" />

