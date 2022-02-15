create database `travelling`;
use `travelling`;



create table if not exists PASSENGER(Passenger_name varchar(20), Category  varchar(20),Gender  varchar(20), Boarding_City  varchar(20), Destination_City  varchar(20),Distance int,Bus_Type  varchar(20));


create table if not exists PRICE (Bus_Type  varchar(20), Distance int, Price  int);

insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values('Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper');
insert into passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',350,434);
insert into price values('Sitting',500,620);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

select * from price;

SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END) Female FROM passenger WHERE Distance >=600;

SELECT MIN(price) FROM price WHERE Bus_Type = 'sleeper';

SELECT * FROM passenger WHERE Passenger_name LIKE 's%';

SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;

SELECT p1.Passenger_name, p1.Boarding_city, p1.Destination_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = 1000 and p1.Bus_type = 'Sitting' and p1.Distance = 1000 and p1.Bus_type = 'Sitting';

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;

SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;

SELECT Distance, price,
CASE
WHEN Price>= 1000 THEN 'Expensive'
WHEN Price< 1000 and price >=500 THEN 'Average cost'
ELSE 'cheap'
END AS distance
From Price;

call new_procedure();