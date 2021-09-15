-- in terminal:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE referees 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age TEXT NOT NULL,
  current_team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE season 
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE matches 
(
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES teams ON DELETE SET NULL, 
  away_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
  location TEXT NOT NULL,
  date DATE NOT NULL, 
  start_time TIME NOT NULL, 
  season_id INTEGER REFERENCES season ON DELETE SET NULL,
  referee_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE rankings 
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL, 
  match_id INTEGER REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE goals 
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES teams ON DELETE SET NULL, 
  match_id INTEGER REFERENCES matches ON DELETE SET NULL
);

INSERT INTO teams
  (id, name, city)
VALUES
  (DEFAULT, 'Manchester United', 'England'),
  (DEFAULT, 'Atletico Madrid', 'Spain'),
  (DEFAULT, 'FC Augsburg', 'Austria');

INSERT INTO referees
  (id, name)
VALUES
  (DEFAULT, 'Mike Dean'),
  (DEFAULT, 'Emilio Guruceta'),
  (DEFAULT, 'Christian Dingert');

INSERT INTO players
  (id, name, age, current_team_id)
VALUES
  (DEFAULT, 'Bernardo Silva', 19, 1),
  (DEFAULT, 'Lucas Torreira', 31, 2),
  (DEFAULT, 'Marek Suchy', 33, 3);

INSERT INTO season 
  (id, start_date, end_date)
VALUES
  (DEFAULT, '2020-9-12', '2021-5-23'),
  (DEFAULT, '2020-9-12', '2021-5-23'),
  (DEFAULT, '2020-9-12', '2021-5-15');

INSERT INTO matches 
  (id, home_team_id, away_team_id, location, date,start_time, season_id, referee_id)
VALUES
  (DEFAULT, 3, 1, 'Spain', '2021-5-23', '08:00:00', 1, 1),
  (DEFAULT, 1, 2, 'London', '2021-5-25', '08:00:00', 1, 2),
  (DEFAULT, 2, 3, 'France', '2021-5-29', '08:00:00', 1, 3);

INSERT INTO rankings
  (id, team_id, match_id)
VALUES
  (DEFAULT, 1, 1),
  (DEFAULT, 2, 2),
  (DEFAULT, 3, 3);

INSERT INTO goals
  (id, player_id, match_id)
VALUES
  (DEFAULT, 1, 1),
  (DEFAULT, 2, 2),
  (DEFAULT, 3, 3);