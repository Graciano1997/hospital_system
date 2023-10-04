CREATE TABLE IF NOT EXISTS patients (
id SERIAL PRIMARY KEY,
name varchar(200),
date_of_birth date
);

CREATE TABLE IF NOT EXISTS medical_histories (
id SERIAL PRIMARY KEY,
admitted_at timestamp,
patient_id int,
status varchar(200),
CONSTRAINT fk_patient
FOREIGN KEY (patient_id)
REFERENCES patients(id)
);

