# DE-SQL-HW (Data Engineering SQL Homework)

This project provides a comprehensive working environment for SQL exercises using the Pagila database, a sample database for PostgreSQL widely used for learning purposes.

## Project Description

This project sets up a complete Docker-based environment that includes:
- A PostgreSQL database with pre-loaded Pagila schema and data
- A pgAdmin interface for easy database interaction and visualization
- SQL exercises to practice and improve your SQL skills

The Pagila database simulates a DVD rental store system, making it ideal for learning and practicing various SQL concepts from basic queries to complex joins and analytical functions.

## Prerequisites

- Docker and Docker Compose installed on your machine
- Basic knowledge of SQL concepts
- Git (for cloning the repository)
- A text editor or IDE for SQL (optional, as pgAdmin provides a query tool)

## Installation and Configuration

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/yourusername/DE-SQL-HW.git
   ```
2. Navigate to the project directory:
   ```
   cd DE-SQL-HW
   ```
3. Launch the Docker containers with the command:
   ```
   docker-compose up -d
   ```
   This will start both the PostgreSQL database and pgAdmin containers in detached mode.

## Database Access

### Via pgAdmin (Recommended for Beginners)

1. Access pgAdmin in your web browser: http://localhost:5050
2. Log in with the following credentials:
   - Email: admin@admin.com
   - Password: root
3. Add a new server with the following parameters:
   - Name: pagila (or any name of your choice)
   - Host: pagila
   - Port: 5432
   - Database: pagila
   - Username: postgres
   - Password: admin

pgAdmin provides a graphical interface to:
- Browse database objects (tables, views, functions)
- View table data and structure
- Execute SQL queries
- Visualize query results
- Export data in various formats

### Via Direct SQL Client

You can connect directly to the database with the following parameters:
- Host: localhost
- Port: 5432
- Database: pagila
- Username: postgres
- Password: admin

This is useful for connecting from:
- Command-line tools like psql
- Programming languages (Python, Java, etc.)
- Other SQL clients (DBeaver, DataGrip, etc.)

## SQL Exercises

The `ht_template` folder contains a file `home_task_queries.sql` with 5 SQL exercises to complete:

1. **Category Film Count**: Display the number of films in each category, sorted in descending order.
   - This exercise practices basic joins, grouping, and sorting.

2. **Top Rented Actors**: Display the top 10 actors whose films have been rented the most, sorted in descending order.
   - This exercise involves multiple joins across the actor, film, inventory, and rental tables.

3. **Highest Grossing Category**: Display the film category on which the most money has been spent on rentals.
   - This exercise combines joins with aggregate functions to analyze financial data.

4. **Films Not in Inventory**: Display the titles of films that are not in the inventory (without using the IN operator).
   - This exercise practices alternative join techniques and filtering.

5. **Top Actors in Children's Films**: Display the top 3 actors who appear most in the "Children" film category.
   - This exercise combines category filtering with counting and sorting.

Each exercise is accompanied by a commented solution explaining the approach used, including alternative implementations where applicable.

## Database Structure

The Pagila database is a comprehensive DVD rental store system that includes tables for:
- Films and categories (film, film_category, category)
- Actors and their roles (actor, film_actor)
- DVD inventory (inventory)
- Customers and rentals (customer, rental)
- Payments (payment)
- Store locations and staff (store, staff)
- Addresses and cities (address, city, country)
- And more

The database features a normalized structure with:
- Primary and foreign keys
- Check constraints
- Indexes for performance
- Views for common queries
- Functions and triggers for business logic

For more detailed information on the database schema, refer to the `pagila-schema.sql` and `pagila-data.sql` files, or explore the database structure using pgAdmin.

## Container Management

### Stopping Containers

To stop the Docker containers, use the command:
```
docker-compose down
```

### Removing Data

To also remove the volumes (which will erase all data), use:
```
docker-compose down -v
```

### Restarting with Clean Data

If you want to restart with a fresh database (reverting any changes you've made):
```
docker-compose down -v
docker-compose up -d
```

## Troubleshooting

- If you encounter connection issues, ensure ports 5432 and 5050 are not being used by other applications.
- If pgAdmin can't connect to the database, try using the container name "pagila" as the host.
- For any other issues, check the Docker logs with `docker-compose logs`.

## Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Pagila Database Information](https://github.com/devrimgunduz/pagila)
- [SQL Tutorial](https://www.w3schools.com/sql/)
