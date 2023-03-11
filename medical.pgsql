DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center
CREATE TABLE doctors (
    id serial PRIMARY KEY,
    name text NOT NULL,
    practice text NOT NULL,
    email text NOT NULL UNIQUE
);

CREATE TABLE patients (
    id serial PRIMARY KEY,
    name text NOT NULL,
    date_of_birth date NOT NULL,
    email text NOT NULL UNIQUE,
    address text,
    city text,
    state text,
    country text,
    postal_code text
);

CREATE TABLE visits (
    id serial PRIMARY KEY,
    doctor_id serial NOT NULL,
    patient_id serial NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors (id),
    FOREIGN KEY (patient_id) REFERENCES petients (id)
);

CREATE TABLE diagnoses (
    id serial PRIMARY KEY,
    visit_id serial NOT NULL,
    disease text[],
    FOREIGN KEY (visit_id) REFERENCES visits (id)
);

