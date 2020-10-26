 ----------- Customer Table ----------
CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INT,
	email VARCHAR(50)
);

 ----------- Invoice Table ----------
CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	salesperson_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)			
);
 ----------- Salesperson Table ----------
CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INT
);
 ----------- Service Ticket Table ----------
CREATE TABLE service_ticket (
	ticket_id SERIAL PRIMARY KEY,
	expected_return_date INT,
	issue_with_car VARCHAR(150),	
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	service_to_mechanic_id INTEGER NOT NULL,
	parts_used_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	FOREIGN KEY (service_to_mechanic_id) REFERENCES service_to_mechanic(service_to_mechanic_id),
	FOREIGN KEY (parts_used_id) REFERENCES parts_used(part_id)

);
 ----------- Car Table ----------
CREATE TABLE car (
	car_id SERIAL PRIMARY KEY,
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INT,
	car_price INT
);
 ----------- Parts Used Table ----------
CREATE TABLE parts_used (
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_cost NUMERIC (5,2)
);
 ----------- Service to mechanic Table ----------
CREATE TABLE service_to_mechanic (
	service_to_mechanic_id SERIAL PRIMARY KEY,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100),
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (service_id) REFERENCES services (service_id),
	FOREIGN KEY (mechanic_id) REFERENCES mechanic (mechanic_id)
);
 ----------- Service History Table ----------
CREATE TABLE service_history (
	service_history_id SERIAL,
	date_fixed INT,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);
 ----------- Parts Table ----------
CREATE TABLE parts (
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_cost NUMERIC(5,2)
);
 ----------- Services Table ----------
CREATE TABLE services (
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100)
);
 ----------- Mechanic Table ----------
CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INT
);

SELECT *
FROM service_ticket


ALTER TABLE car
ADD car_price INT;