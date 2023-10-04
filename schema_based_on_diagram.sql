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

CREATE TABLE IF NOT EXISTS treatments (
id SERIAL PRIMARY KEY,
type varchar(200),
name varchar(200)
);

CREATE TABLE IF NOT EXISTS medical_histories_link_treatments (
medical_history_id int,
treatment_id int,
CONSTRAINT fk_treatment
FOREIGN KEY(treatment_id)
REFERENCES treatments(id),
CONSTRAINT fk_history
FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id)
);
