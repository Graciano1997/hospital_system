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


CREATE TABLE IF NOT EXISTS invoices (
id SERIAL PRIMARY KEY,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
medical_history_id int,
CONSTRAINT fk_history
FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id)
);

CREATE TABLE IF NOT EXISTS invoice_items (
id SERIAL PRIMARY KEY,
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int,
treatment_id int,
CONSTRAINT fk_invoice
FOREIGN KEY(invoice_id)
REFERENCES invoices(id),
CONSTRAINT fk_treatment
FOREIGN KEY(treatment_id)
REFERENCES treatments(id)
);

CREATE INDEX idx_fk_patient ON medical_histories(patient_id);

CREATE INDEX idx_fk_treatment ON medical_histories_link_treatments(treatment_id)

CREATE INDEX idx_fk_history ON invoices(medical_history_id);

CREATE INDEX idx_fk_invoice ON invoice_items(invoice_id);

CREATE INDEX idx_fk_treatment ON invoice_items(treatment_id);

CREATE INDEX idx_fk_history ON medical_histories_link_treatments(medical_history_id)
