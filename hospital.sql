DROP TABLE IF EXISTS produced_indicator;
DROP TABLE IF EXISTS indicator;
DROP TABLE IF EXISTS test_procedure;
DROP TABLE IF EXISTS radiography;
DROP TABLE IF EXISTS performed;
DROP TABLE IF EXISTS procedure_consult;
DROP TABLE IF EXISTS prescription;
DROP TABLE IF EXISTS medication;
DROP TABLE IF EXISTS consult_diagnosis;
DROP TABLE IF EXISTS diagnosis_code;
DROP TABLE IF EXISTS participation;
DROP TABLE IF EXISTS consult;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS generalization_species;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS assistant;
DROP TABLE IF EXISTS veterinary;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS phone_number;
DROP TABLE IF EXISTS person;

CREATE TABLE person
  (VAT INTEGER,
   name VARCHAR(255),
   address_street VARCHAR(255),
   address_city VARCHAR(255),
   address_zip INTEGER,
   PRIMARY KEY (VAT));

CREATE TABLE phone_number
  (VAT INTEGER,
   phone BIGINT,
   PRIMARY KEY (VAT,phone),
   FOREIGN KEY (VAT) REFERENCES person(VAT));

CREATE TABLE client
  (VAT INTEGER,
   PRIMARY KEY (VAT),
   FOREIGN KEY (VAT) REFERENCES person(VAT));

CREATE TABLE veterinary
   (VAT INTEGER,
   specialization VARCHAR(255),
   bio VARCHAR(255),
   PRIMARY KEY (VAT),
   FOREIGN KEY (VAT) REFERENCES person(VAT));

CREATE TABLE assistant
  (VAT INTEGER,
   PRIMARY KEY (VAT),
   FOREIGN KEY (VAT) REFERENCES person(VAT));

CREATE TABLE species
  (name VARCHAR(255),
   description VARCHAR(255),
   PRIMARY KEY (name));

CREATE TABLE generalization_species
  (name1 VARCHAR(255),
   name2 VARCHAR(255),
   PRIMARY KEY (name1),
   FOREIGN KEY (name1) REFERENCES species(name),
   FOREIGN KEY (name2) REFERENCES species(name));

CREATE TABLE animal
  (name VARCHAR(255),
   VAT INTEGER,
   species_name VARCHAR(255),
   colour VARCHAR(255),
   gender VARCHAR(255),
   birth_year YEAR,
   age INTEGER,
   PRIMARY KEY (name,VAT),
   FOREIGN KEY (VAT) REFERENCES client(VAT),
   FOREIGN KEY (species_name) REFERENCES species(name));

CREATE TABLE consult
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   s VARCHAR(255),
   o VARCHAR(255),
   a VARCHAR(255),
   p VARCHAR(255),
   VAT_client INTEGER,
   VAT_vet INTEGER,
   weight FLOAT(255,4),
   PRIMARY KEY (name, VAT_owner, date_timestamp),
   FOREIGN KEY (name,VAT_owner) REFERENCES animal(name,VAT),
   FOREIGN KEY (VAT_client) REFERENCES client(VAT),
   FOREIGN KEY (VAT_vet) REFERENCES veterinary(VAT),
   CHECK(weight > 0));

CREATE TABLE participation
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   VAT_assistant INTEGER,
   PRIMARY KEY (name, VAT_owner, date_timestamp,VAT_assistant),
   FOREIGN KEY (name,VAT_owner,date_timestamp) REFERENCES consult(name,VAT_owner,date_timestamp),
   FOREIGN KEY (VAT_assistant) REFERENCES assistant(VAT));

CREATE TABLE diagnosis_code
  (code VARCHAR(255),
   name VARCHAR(255),
   PRIMARY KEY (code));

CREATE TABLE consult_diagnosis
  (code VARCHAR(255),
   name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   PRIMARY KEY (code, name,VAT_owner, date_timestamp),
   FOREIGN KEY (name,VAT_owner,date_timestamp) REFERENCES consult(name,VAT_owner,date_timestamp),
   FOREIGN KEY (code) REFERENCES diagnosis_code(code));

CREATE TABLE medication
  (name VARCHAR(255),
   lab VARCHAR(255),
   dosage VARCHAR(255),
   PRIMARY KEY(name, lab, dosage));

CREATE TABLE prescription
  (code VARCHAR(255),
   name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   name_med VARCHAR(255),
   lab VARCHAR(255),
   dosage VARCHAR(255),
   regime VARCHAR(255),
   PRIMARY KEY(code, name, VAT_owner, date_timestamp,name_med, lab, dosage),
   FOREIGN KEY (code,name, VAT_owner, date_timestamp) REFERENCES consult_diagnosis(code, name, VAT_owner, date_timestamp),
   FOREIGN KEY (name_med,lab,dosage) REFERENCES medication(name,lab,dosage));

CREATE TABLE procedure_consult
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   num INTEGER,
   description VARCHAR(255),
   PRIMARY KEY(name, VAT_owner, date_timestamp, num, description),
   FOREIGN KEY (name,VAT_owner,date_timestamp) REFERENCES consult(name,VAT_owner, date_timestamp));

CREATE TABLE performed
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   num INTEGER,
   VAT_assistant INTEGER,
   PRIMARY KEY(name, VAT_owner,date_timestamp,num, VAT_assistant),
   FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES procedure_consult(name,VAT_owner,date_timestamp,num),
   FOREIGN KEY (VAT_assistant) REFERENCES assistant(VAT));

CREATE TABLE radiography
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   num INTEGER,
   file VARCHAR(255),
   PRIMARY KEY(name, VAT_owner,date_timestamp,num),
   FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES procedure_consult(name,VAT_owner,date_timestamp,num));

CREATE TABLE test_procedure
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   num INTEGER,
   type VARCHAR(255), CHECK(type IN('blood','urine')),
   PRIMARY KEY(name, VAT_owner,date_timestamp,num),
   FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES procedure_consult(name,VAT_owner,date_timestamp,num));

CREATE TABLE indicator
  (name VARCHAR(255),
   reference_value FLOAT(255,4),
   units VARCHAR(255),
   description VARCHAR(255),
   PRIMARY KEY (name));

CREATE TABLE produced_indicator
  (name VARCHAR(255),
   VAT_owner INTEGER,
   date_timestamp TIMESTAMP,
   num INTEGER,
   indicator_name VARCHAR(255),
   value FLOAT(255,4),
   PRIMARY KEY(name, VAT_owner,date_timestamp,num, indicator_name),
   FOREIGN KEY (name,VAT_owner,date_timestamp,num) REFERENCES test_procedure(name,VAT_owner, date_timestamp,num),
   FOREIGN KEY (indicator_name) REFERENCES indicator(name));