CREATE TABLE movie (
movie_id INT PRIMARY KEY,
movie_name VARCHAR(50) NOT NULL,
LANGUAGE VARCHAR(50),
duration INT,
release_date DATE
);

CREATE TABLE theatre (
theatre_id INT PRIMARY KEY,
theatre_name VARCHAR(50) NOT NULL,
location VARCHAR(50),
total_seats INT
);

CREATE TABLE bookings (
booking_id INT PRIMARY KEY,
movie_id INT,
theatre_id INT,
customer_name VARCHAR(50),
tickets INT,
booking_date DATE,
FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
FOREIGN KEY(theatre_id) REFERENCES theatre(theatre_id)
);

ALTER TABLE bookings MODIFY customer_name VARCHAR(50) NOT NULL;

INSERT INTO movie VALUES 
(1,"Leo","Tamil",165,'2023-10-19'),
(2,"Jawan","Hindi",169,'2023-09-07'),
(3,"Vikram","Tamil",175,'2022-06-03'),
(4,"RRR","Telugu",187,'2022-03-25'),
(5,"Master","Tamil",179,'2021-01-13'),
(6,"puspha","Telugu",179,'2021-12-17'),
(7,"jailer","Tamil",168,'2023-08-10'),
(8,"kantara","Kannada",148,'2022-09-30'),
(9,"3 idiots","Hindi",170,'2009-12-25'),
(10,"interstellar","English",169,'2014-11-07');

INSERT INTO theatre VALUES 
(101,'PVR Cinemas','Chennai',200),
(102,'INOX Cinemas','Chennai',180),
(103,'AGS Cinemas','Chennai',250),
(104,'Rohini Cinemas','Chennai',300),
(105,'SPI Palazoo','Chennai',220),
(106,'Vetri Cinemas','Chennai',280),
(107,'Kasi Theatre','Chennai',240),
(108,'Sathyam Cinemas','Chennai',200),
(109,'Ganga Cinemas','Coimbatore',180),
(110,'Big Cinemas','Maduari',180);

INSERT INTO bookings VALUES 
(1001,1,101,'Arun',2,'2026-11-20'),
(1002,2,102,'Abi',3,'2026-11-20'),
(1003,3,103,'Loki',4,'2026-11-21'),
(1004,1,104,'Jagan',2,'2026-11-21'),
(1005,5,105,'Raghul',5,'2026-11-21'),
(1006,4,106,'Sneha',3,'2026-11-22'),
(1007,3,107,'Vicky',2,'2026-11-22'),
(1008,6,108,'Hari',4,'2026-11-22'),
(1009,8,109,'Nithya',1,'2026-11-23'),
(1010,9,110,'Sanjay',2,'2026-11-23'),
(1011,2,101,'Meena',2,'2026-11-23'),
(1012,3,102,'Ajith',5,'2026-11-24'),
(1013,10,103,'Manoj',2,'2026-11-24'),
(1014,5,104,'Keerthi',3,'2026-11-25'),
(1015,1,105,'Alex',4,'2026-11-25');

SELECT * FROM movie;
SELECT * FROM theatre;
SELECT * FROM bookings;

SELECT m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name,b.tickets,b.booking_date 
FROM movie m 
JOIN bookings b ON m.movie_id = b.movie_id
JOIN theatre t ON b.theatre_id = t.theatre_id;

SELECT m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name,b.tickets,b.booking_date 
FROM movie m 
JOIN bookings b ON m.movie_id = b.movie_id
JOIN theatre t ON b.theatre_id = t.theatre_id
WHERE booking_date >= '2026-11-21';

SELECT m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name,b.tickets,b.booking_date 
FROM movie m 
JOIN bookings b ON m.movie_id = b.movie_id
JOIN theatre t ON b.theatre_id = t.theatre_id
WHERE booking_date >= '2026-11-21' and tickets >=4;

SELECT t.theatre_name,count(b.booking_id) as total_customers,b.tickets
FROM movie m 
JOIN bookings b ON m.movie_id = b.movie_id
JOIN theatre t ON b.theatre_id = t.theatre_id
group by t.theatre_name,b.tickets;

SELECT b.booking_id,t.theatre_name,t.location,m.movie_name,m.LANGUAGE,b.customer_name,b.tickets,b.booking_date
FROM movie m 
LEFT JOIN bookings b ON m.movie_id = b.movie_id
LEFT JOIN theatre t ON b.theatre_id = t.theatre_id
ORDER BY b.booking_date;

SELECT b.booking_id,b.tickets,b.booking_date,m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name
FROM bookings b 
RIGHT JOIN movie m  ON b.movie_id = m.movie_id 
RIGHT JOIN theatre t ON b.theatre_id = t.theatre_id
ORDER BY b.booking_date;

SELECT m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name,b.tickets,b.booking_date 
FROM movie m 
LEFT JOIN bookings b ON m.movie_id = b.movie_id
LEFT JOIN theatre t ON b.theatre_id = t.theatre_id
UNION
SELECT m.movie_name,m.LANGUAGE,t.theatre_name,t.location,b.customer_name,b.tickets,b.booking_date 
FROM movie m 
RIGHT JOIN bookings b ON m.movie_id = b.movie_id
RIGHT JOIN theatre t ON b.theatre_id = t.theatre_id;





