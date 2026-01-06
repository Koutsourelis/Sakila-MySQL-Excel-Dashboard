# Revenue and Customer Performance Dashboard using MySQL and Excel (Sakila Database)

This project presents a static executive dashboard built in Excel using data extracted from the Sakila database via MySQL queries.

### Background
Sakila represents a fictional DVD rental company that operates multiple stores and offers a wide variety of films in different genres. The company wants to better understand:

- Which film categories generate the most revenue
- Who their most valuable customers are
- Which stores perform better
- How rentals and revenue are changing over time

The management team asked the Data Analyst to explore the database and provide actionable insights that could help improve business decisions, marketing strategy, and inventory management.

## Tools Used
 SQL (MySQL , Sakila Database) :
- SQL joins
- Aggregations (SUM, COUNT, AVG)
- Window functions
- Grouping
- Sorting

Microsoft Excel :
- Executive Dashboard & Visualization

## Key KPIs
- Total Revenue
- Total Rentals
- Average Revenue per Customer
- Average Rental Duration
- Active vs Inactive Customers

## Key Insights
- Revenue is strongly correlated with the number of customers per country.
- Customer value is evenly distributed across the customer base.
- Movie rentals show balanced demand with no extreme concentration.
- The business model appears diversified and resilient.

## Business Recommendations
- Focus growth initiatives on countries with high customer volumes, as customer count strongly correlates with revenue.
- Maintain broad-based customer strategies, as customer value is evenly distributed.
- Continue supporting a diverse film catalog due to balanced rental demand.
- Leverage diversified revenue distribution to reduce business risk.
- Explore reactivation strategies for inactive customers to drive incremental growth.

## Data Source
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

## Dashboard Preview
![Alt Text]("C:\Users\giann\OneDrive\Υπολογιστής\Projects\Sakila Project\Sakila-MySQL-Excel-Dashboard\Screenshots\Sakila Excel  Dashboard Screenshot.png")

