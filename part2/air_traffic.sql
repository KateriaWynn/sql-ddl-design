-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region_id INTEGER REFERENCES regions
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries ON DELETE SET NULL,
  region_id INTEGER REFERENCES regions ON DELETE SET NULL,
  is_international BOOLEAN
);

CREATE TABLE flights 
(
  id SERIAL PRIMARY KEY,
  departure_time TIME NOT NULL,
  arrival_time TIME NOT NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE SET NULL,
  to_city_id INTEGER REFERENCES cities,
  from_city_id INTEGER REFERENCES cities,
  to_country_id INTEGER REFERENCES countries,
  from_country_id INTEGER REFERENCES countries
);

CREATE TABLE tickets 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights
);

INSERT INTO regions 
  (id, name)
VALUES
  (DEFAULT, 'Europe'),
  (DEFAULT, 'Africa'),
  (DEFAULT, 'Asia'),
  (DEFAULT, 'Middle East'),
  (DEFAULT, 'North America'),
  (DEFAULT, 'Australia & Pacific'),
  (DEFAULT, 'South America');

INSERT INTO countries 
  (id, name, region_id)
VALUES
  (DEFAULT, 'China', 3),
  (DEFAULT, 'France', 1),
  (DEFAULT, 'Ghana', 2),
  (DEFAULT, 'Mexico', 5);

INSERT INTO cities 
  (id, name, country_id)
VALUES
  (DEFAULT, 'Mexico City', 4),
  (DEFAULT, 'Accura', 3),
  (DEFAULT, 'Paris', 2),
  (DEFAULT, 'Shanghai', 1);

INSERT INTO airlines 
  (id, name, country_id, region_id, is_international)
VALUES
  (DEFAULT, 'Aeromexico', 4, 5, 'true'),
  (DEFAULT, 'Ghana Airways', 2, 2, 'true'),
  (DEFAULT, 'Air France', 2, 1, 'true'),
  (DEFAULT, 'Shanghai', 1, 3, 'true');

INSERT INTO flights 
  (id, departure_time, arrival_time, airline_id, to_city_id, from_city_id, to_country_id, from_country_id)
VALUES
  (DEFAULT, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1, 2, 4),
  (DEFAULT, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 2, 1, 2, 1, 3),
  (DEFAULT, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 2, 1, 2, 1, 3),
  (DEFAULT, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 3, 1, 3, 1, 2);

INSERT INTO tickets 
  (id, first_name, last_name, seat, flight_id)
VALUES
  (DEFAULT, 'Jennifer', 'Finch', '33B', 2),
  (DEFAULT, 'Thadeus', 'Gathercoal', '8B', 2),
  (DEFAULT, 'Jennifer', 'Finch', '18C', 4),
  (DEFAULT, 'Waneta', 'Skeleton', '23D', 1),
  (DEFAULT, 'Thadeus', 'Gathercoal', '9E', 3),
  (DEFAULT, 'Berkie', 'Wycliff', '32B', 2);


