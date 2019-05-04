-- Assignment 2 - Views

-- View #1
CREATE VIEW dim_date AS
  SELECT date_timestamp, day(date_timestamp) AS day, month(date_timestamp) AS month,year(date_timestamp) AS year
  FROM consult;


-- View #2
CREATE VIEW dim_animal AS
  SELECT name AS animal_name, VAT AS animal_vat, species_name AS species, year(current_date)-animal.birth_year AS age
  FROM animal;


-- View #3
CREATE VIEW facts_consults AS
  SELECT DISTINCT animal_name AS name, animal_vat AS vat, dim_date.date_timestamp AS timestamp, count(distinct P.num) AS num_procedures, count(distinct name_med) AS num_medications
  FROM procedure_consult P
  RIGHT OUTER JOIN
  consult ON (consult.name = P.name AND consult.VAT_owner = P.VAT_owner AND consult.date_timestamp = P.date_timestamp)
  LEFT OUTER JOIN
  prescription Prs ON (consult.name = Prs.name AND consult.VAT_owner = Prs.VAT_owner AND consult.date_timestamp = Prs.date_timestamp),
  dim_date, dim_animal
  WHERE animal_name = consult.name AND animal_vat = consult.VAT_owner AND dim_date.date_timestamp = consult.date_timestamp
  GROUP BY name, vat, timestamp;
