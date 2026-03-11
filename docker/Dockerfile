FROM postgres:15

# Meaning

This line tells Docker to use the official PostgreSQL version 15 image as the base image.

Docker images are pre-built environments.

postgres:15 already contains:

PostgreSQL server

required libraries

database configuration.

So instead of installing PostgreSQL manually, Docker downloads this ready-made image.

ENV POSTGRES_DB=taskmanager

# Meaning

This environment variable tells PostgreSQL to automatically create a database named taskmanager when the container starts.

Purpose in your project

This database will store:

users

tasks

comments

# Example 
Database: taskmanager

ENV POSTGRES_USER=admin

# Example Login
Example login
username = admin

ENV POSTGRES_PASSWORD=admin123

# This sets the password for the database user.

password = admin123

# Example Database 

Host: localhost
Port: 5432
Database: taskmanager
User: admin
Password: admin123

COPY init.sql /docker-entrypoint-initdb.d/

Meaning

This line copies a file called init.sql into the container.


# Location inside container 
/docker-entrypoint-initdb.d/
PostgreSQL automatically executes any .sql file placed in this folder when the container starts for the first time.
