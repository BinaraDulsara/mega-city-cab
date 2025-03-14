Mega City Cab
Mega City Cab is a Java-based web application designed to manage vehicle rentals and bookings within a city. It provides features for vehicle registration, user sign-up, booking management, and more—all in a simple, intuitive interface.

Features
Vehicle Management
Register new vehicles (cars, vans, buses, bikes) with details such as type, model, brand, seating capacity, and price.
User Management
Allow users to sign up, log in, and maintain their personal profiles.
Booking System
View available vehicles, make bookings, and track booking status.
Availability Control
Mark vehicles as available or unavailable for rent at any time.
Simple UI
Built with JSP and Bootstrap for a clean, responsive user experience.
Technologies Used
Java (Java EE)
JSP / Servlets
JDBC for database connectivity
MySQL as the primary database
HTML / CSS / Bootstrap for the frontend UI
Git / GitHub for version control
Getting Started
Clone the Repository

bash
Copy
Edit
git clone https://github.com/BinaraDulsara/mega-city-cab.git
cd mega-city-cab
Set Up the Database

Create a MySQL database (e.g., vehicle_rental_db).
Run the SQL script in db/vehicle_rental_db.sql (or whichever file you’re using) to create the vehicle table and insert sample data.
Update the database credentials in your DBconnect.java file.
Build and Deploy

Use a Java EE–compatible IDE (like Eclipse or IntelliJ) or Maven/Gradle to build the project.
Deploy the generated WAR file to a servlet container (e.g., Apache Tomcat).
Run the Application

Access the application at http://localhost:8080/mega-city-cab (adjust port or context path as necessary).
Register vehicles, manage bookings, and explore all features.
