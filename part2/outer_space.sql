-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  planet_orbits_around_id INTEGER REFERENCES planets
);

INSERT INTO galaxies
  (name, type)
VALUES
  ('Milky Way', 'Spiral'),
  ('Andromeda Galaxy', 'Spiral'),
  ('Centaurus A', 'Polar Ring'),
  ('Messier 101', 'Spiral');

INSERT INTO stars
  (name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Supernovae', 4),
  ('Beta Andromedae', 2),
  ('Proxima Centauri', 3);

INSERT INTO planets
  (name, orbital_period, galaxy_id)
VALUES
  ('Earth', '365 days', 1),
  ('Gliese 667 C', '28 days', 2),
  ('Qatar-4b', '43 hours', 4),
  ('Upsilon Andromedae b', '5 days', 1);

INSERT INTO moons
  (name, planet_orbits_around_id)
VALUES
  ('The Moon', 1),
  ('Gliese 667 Cc', 2),
  ('Qatar-3b', 3);