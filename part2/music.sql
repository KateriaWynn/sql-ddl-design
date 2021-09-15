-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  producers TEXT[] NOT NULL,
  artists TEXT[] NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album TEXT[] NOT NULL
);

INSERT INTO producers
  (name)
VALUES
  ('Walter Afanasieff'), 
  ('Mariah Carey'), 
  ('Dave Hall'), 
  ('Jermaine Dupri'), 
  ('Manuel Seal'), 
  ('David Morales'), 
  ('Benjamin Rice'),
  ('Babyface'),
  ('Boyz II Men'),
  ('Jheryl Busby'),
  ('Tim & Bob'),
  ('The Characters'),
  ('Brian McKnight'),
  ('Quincy Jones');

INSERT INTO artists
  (name)
VALUES
  ('Michael Jackson'), 
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Maroon 5');

INSERT INTO albums
  (title, release_date, producers, artists)
VALUES
  ('Thriller', '1982-11-30', '{4}','{1}'), 
  ('Daydream', '1995-10-02', '{1, 2, 3, 4, 5, 6}', '{2, 3}'),
  ('Boyz II Men II', '1995-1-30', '{8, 9, 10, 11, 12, 13}','{9}'),
  ('The Blueprint 3', '2009-7-24', '{9, 10, 1, 4, 7}','{4, 5}'),
  ('Thriller 25', '2008-2-08', '{9, 10, 1, 4, 7}', '{4, 5}'),
  ('V', '2014-08-29', '{3, 5, 6}', '{6}');

INSERT INTO songs
  (title, duration_in_seconds, album)
VALUES
  ('Beat It', 258, '{1}'), 
  ('Fantasy', 244, '{2}'),
  ('Thank You', 274,'{3}'),
  ('Run This Town', 267,'{4}'),
  ('Thriller', 357,'{1, 5}'),
  ('Maps', 189,'{5}');

