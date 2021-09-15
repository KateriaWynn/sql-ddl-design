-- in terminal:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE regions 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users 
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  email TEXT NOT NULL, 
  password TEXT NOT NULL, 
  preferred_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE posts 
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  location TEXT NOT NULL,
  user_id INTEGER REFERENCES users ON DELETE SET NULL,
  region_id INTEGER REFERENCES regions,
  category_id INTEGER REFERENCES categories 
);

INSERT INTO regions
  (id, name)
VALUES
  (DEFAULT, 'South'),
  (DEFAULT, 'East'),
  (DEFAULT, 'Northwest'),
  (DEFAULT, 'Midwest');

INSERT INTO users 
  (id, username, email, password, preferred_region)
VALUES
  (DEFAULT, 'preston11', 'prestonculpepper@gmail.com', '3fc79ff6a81da0b5fc62499d6b6db7dbf1268328052d2da32badef7f82331dd6', 2),
  (DEFAULT, 'michael33', 'michaelcarter@gmail.com', 'd1e8a70b5ccab1dc2f56bbf7e99f064a660c08e361a35751b9c483c88943d082', 3),
  (DEFAULT, 'jessej66', 'jessejjones@yahoo.com', '0E6A48F765D0FFFFF6247FA80D748E615F91DD0C7431E4D9', 4);

INSERT INTO categories 
  (id, name)
VALUES
  (DEFAULT, 'Community'),
  (DEFAULT, 'Services'),
  (DEFAULT, 'Discussion forums'),
  (DEFAULT, 'Housing'),
  (DEFAULT, 'For sale'),
  (DEFAULT, 'Jobs'),
  (DEFAULT, 'Gigs'),
  (DEFAULT, 'Resumes');

INSERT INTO regions
  (id, name)
VALUES
  (DEFAULT, 'South'),
  (DEFAULT, 'East'),
  (DEFAULT, 'Northwest'),
  (DEFAULT, 'Midwest');

INSERT INTO posts
  (id, title, text, location, user_id, region_id, category_id)
VALUES
  (DEFAULT, 'Bike Rack - $105', 'Reese Hitch Bike Rack. Holds 4 Bikes. It folds down with your bikes on it to open your tailgate or hatch. It comes with a 2 inch ball and 1 7/8 inch ball.', 'Alachua', 1,  1, 5),
  (DEFAULT, '$1,825 / 1br - 793ft - 1Bd Condo-w/Amazing View!', 'Hurry and come view this beautiful condo in the John Ross Building. It will go quick! This partitioned one bedroom features stainless steel appliances, hardwood floors, 25th floor, amazing view, air conditioning, water, sewer, garbage and a parking space. This condo is near OHSU, restaurants, minutes from downtown, and conveniently located near the streetcar. This condo also comes with access to the fitness center(add. charge), bbq deck and a community rec room.', 'Portland', 2,  2, 4),
  (DEFAULT, 'Snow Removal Associate - (Boston & Cambridge)', 'Reese Hitch Bike Rack. Holds 4 Bikes. It folds down with your bikes on it to open your tailgate or hatch. It comes with a 2 inch ball and 1 7/8 inch ball.', 'Alachua', 1,  1, 5),
  (DEFAULT, 'Couch stanton sectional, like new! - $1,299', 'Hi I’m selling this high quality microfiber stanton sectional couch, great condition, only 2 years old, size 10ft by 7ft, (msrp $1899)', 'Portland', 2,  2, 5);