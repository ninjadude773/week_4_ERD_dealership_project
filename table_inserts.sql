-- car table inserts --

INSERT INTO car(car_id,car_color,car_make,car_model,car_year,car_price)
VALUES(0,'matte_black','jeep','track_hawk','2021','89145' );

INSERT INTO car(car_id,car_color,car_make,car_model,car_year,car_price)
VALUES(1,'green','dodge','charger','2019','13000' );

INSERT INTO car(car_id,car_color,car_make,car_model,car_year,car_price)
VALUES(2,'blacked_out_thang','X model','Tesla','2020','79990' );

-- customer table inserts --

INSERT INTO customer(customer_id,first_name,last_name,phone_number,email)
VALUES(0,'Keanu','Reeves','773-202-2103','kreeves@gmail.com' );

INSERT INTO customer(customer_id,first_name,last_name,phone_number,email)
VALUES(1,'Jelisha','Montgomery','312-432-1234','pooquish@gmail.com' );

INSERT INTO customer(customer_id,first_name,last_name,phone_number,email)
VALUES(2,'Tyrese','Gibson','615-443-2090','tgib2020@hotmail.com' );



-- invoice table inserts --

INSERT INTO invoice(invoice_id,invoice_date,salesperson_id,car_id,customer_id)
VALUES(0, now(),0,1,1);

INSERT INTO invoice(invoice_id,invoice_date,salesperson_id,car_id,customer_id)
VALUES(1, now(),1,2,2);

------- mechanic inserts -------

INSERT INTO mechanic(mechanic_id,first_name,last_name,phone_number)
VALUES(0, 'Ice','Cube',347-460-4409);

INSERT INTO mechanic(mechanic_id,first_name,last_name,phone_number)
VALUES(1, 'Teyana','Taylor', 937-567-6904);

INSERT INTO mechanic(mechanic_id,first_name,last_name,phone_number)
VALUES(2, 'LeBron','James',551-224-2230);

-------- parts insert -------------

INSERT INTO parts(part_id,part_name,part_cost)
VALUES('1A', 'BrakePads',60.00);

INSERT INTO parts(part_id,part_name,part_cost)
VALUES('1B', 'BrakeRotors',120.00);

INSERT INTO parts(part_id,part_name,part_cost)
VALUES('1C', 'Brake Caliper',75.00);

------- parts used --------

INSERT INTO parts_used(part_id,part_name,part_cost)
VALUES(00, 'Hemi_Engine',600.00);

INSERT INTO parts_used(part_id,part_name,part_cost)
VALUES(01, 'Wheel_Control_Arm',110.00);

INSERT INTO parts_used(part_id,part_name,part_cost)
VALUES(02, 'Alternator',140.00);



----------- salesperson inserts ----------
INSERT INTO salesperson(salesperson_id,first_name,last_name,phone_number)
VALUES(0, 'Denzel','Washington',847-930-0291);

INSERT INTO salesperson(salesperson_id,first_name,last_name,phone_number)
VALUES(1, 'Jhene','Aiko',847-930-0291);

-------------- service history -------------

INSERT INTO service_history(service_history_id,date_fixed,car_id)
VALUES('2A', '2020-10-25',0);

INSERT INTO service_history(service_history_id,date_fixed,car_id)
VALUES('2B', '2020-10-26',1);

INSERT INTO service_history(service_history_id,date_fixed,car_id)
VALUES('2C', '2020-10-27',2);

-------------- service ticket inserts ------------- values not yet inserted --------

INSERT INTO service_ticket(ticket_id,expected_return_date,issue_with_car,customer_id,car_id,service_to_mechanic_id,parts_used_id)
VALUES ('2A','2020-10-30','Broken Brake Light',0,0,0,00);


INSERT INTO service_ticket(ticket_id,expected_return_date,issue_with_car,customer_id,car_id,service_to_mechanic_id,parts_used_id)
VALUES('2B', '2020-11-07','Leaking Brake Line',1,1,1,01);



INSERT INTO service_ticket(ticket_id,expected_return_date,issue_with_car,customer_id,car_id,service_to_mechanic_id,parts_used_id)
VALUES('2C', '2020-11-10','Blown Electrical Fuse',2,2,2,02);

select *
from service_ticket
            ------ STORED PROCEDURE for service ticket inserts -----
CREATE OR REPLACE PROCEDURE amountUpdate(
	customer INTEGER,
	increaseAmount DECIMAL
)
language plpgsql
as $$
begin
	-- Adding more money to customer payment amount
	UPDATE payment
	SET amount = amount + increaseAmount
	WHERE customer_id = customer;
	
	commit;
end;$$

------------------------- service to mechanic inserts ----stored procedure below ----
INSERT INTO service_to_mechanic (service_to_mechanic_id,service_name,hourly_rate,service_id,mechanic_id)
VALUES (00,
		'Tune-Up', 
		'23.00/hr',
		0,
		0
);
INSERT INTO service_to_mechanic (service_to_mechanic_id,service_name,hourly_rate,service_id,mechanic_id)
VALUES (01,
		'Muffler-Replacement', 
		'23.00/hr',
		1,
		1
);
INSERT INTO service_to_mechanic (service_to_mechanic_id,service_name,hourly_rate,service_id,mechanic_id)
VALUES (02,
		'Paint_Job', 
		'23.00/hr',
		2,
		2
);


           ------ STORED PROCEDURE for service to mechanics ------
CREATE OR REPLACE PROCEDURE priceReduction(
	car_color VARCHAR(50),
	car_model VARCHAR(50)
)
language plpgsql
as $$
begin
	-- Adding more money to customer payment amount
	UPDATE car
	SET car_color = 'Neon_Green'
	WHERE car_color = 'Matte Black';
	
	commit;
end;$$



-------------- services insert --------------

INSERT INTO services (service_id, service_name, hourly_rate)
VALUES (0,
		'Tune-Up',
		'23.00/hr'
);
INSERT INTO services (service_id, service_name, hourly_rate)
VALUES (1,
		'Wheel-Alignment',
		'25.00/hr'
);

INSERT INTO services (service_id, service_name, hourly_rate)
VALUES (2,
		'Tire-Rotation',
		'30.00/hr'
);




---------------------------------------------------------------------
select *
from service_to_mechanic

alter table service_ticket
alter column ticket_id type varchar(4)



update mechanic
set phone_number = '347-460-4409'
where mechanic_id = 0;

update mechanic
set phone_number = '937-567-6904'
where mechanic_id = 1;

update mechanic
set phone_number = '551-224-2230'
where mechanic_id = 2;

alter table service_history
alter column date_fixed type varchar(10)

select *
from service_history
