-- in terminal:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS  medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

CREATE TABLE patients 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  phone_number TEXT NOT NULL,
  has_insurance BOOLEAN
);

CREATE TABLE appointments 
(
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  time TIME NOT NULL,
  patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
  doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL
);

CREATE TABLE diseases 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE diagnosis 
(
  id SERIAL PRIMARY KEY,
  notes TEXT NOT NULL,
  appointment_id INTEGER REFERENCES appointments ON DELETE SET NULL,
  disease_id INTEGER REFERENCES diseases ON DELETE SET NULL
);


INSERT INTO doctors 
  (id, name, specialty)
VALUES
  (DEFAULT, 'Leon', 'Obstetrician'),
  (DEFAULT, 'Kay', 'Neurologist'),
  (DEFAULT, 'Keith', 'Emergency');

INSERT INTO patients
  (id, name, phone_number, has_insurance)
VALUES
  (DEFAULT, 'Manuel', '573-375-7370', true),
  (DEFAULT, 'Lynn', '602-380-2737', false),
  (DEFAULT, 'Nancy', '254-744-2820', true);

INSERT INTO appointments
  (id, doctor_id, patient_id, date, time)
VALUES
  (DEFAULT, 1, 2, '2021-1-22', '08:00:00'),
  (DEFAULT, 2, 1, '2021-1-22', '13:30:00'),
  (DEFAULT, 3, 2, '2021-2-9', '17:00:00'),
  (DEFAULT, 3, 3, '2021-2-9', '10:15:00'),
  (DEFAULT, 1, 2, '2021-2-10', '11:30:00');

INSERT INTO diseases
  (id, name, description)
VALUES
  (DEFAULT, 'Rosacea', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  (DEFAULT, 'Fibromyalgia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  (DEFAULT, 'High blood pressure', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'), 
  (DEFAULT, 'Migraines', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'), 
  (DEFAULT, 'Diabetes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

INSERT INTO diagnosis
  (id, appointment_id, disease_id, notes)
VALUES
  (DEFAULT, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  (DEFAULT, 2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  (DEFAULT, 3, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'), 
  (DEFAULT, 3, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'), 
  (DEFAULT, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');