-- Assignment 2 - Changes

-- Change #1
UPDATE person
SET address_street = 'Av. Rovisco Pais, 1049-001', address_city ='Lisboa'
WHERE VAT IN (
    SELECT VAT FROM
        (SELECT VAT
         FROM person NATURAL JOIN client
         WHERE name = 'John Smith'
        ) AS person_client_vat
);

-- Change #2
UPDATE indicator
SET reference_value = reference_value * 1.1
WHERE units LIKE '%mg%'
AND name IN (SELECT indicator_name
             FROM produced_indicator NATURAL JOIN test_procedure
             WHERE type='blood');


-- Change #3
DELETE FROM client
WHERE VAT IN (SELECT VAT FROM person WHERE name = 'John Smith');

DELETE FROM person
WHERE VAT NOT IN (SELECT VAT FROM veterinary)
AND VAT NOT IN (SELECT VAT FROM assistant)
AND VAT NOT IN (SELECT VAT FROM client);


-- Change #4
SELECT code
FROM diagnosis_code
WHERE name LIKE '%kidney failure%';

INSERT INTO diagnosis_code VALUES('O-ESRD', 'End-Stage Renal Disease');

UPDATE consult_diagnosis
SET code = (SELECT code FROM diagnosis_code WHERE name LIKE '%End-Stage Renal Disease%'),
    name = name,
    VAT_owner = VAT_owner,
    date_timestamp = date_timestamp
WHERE code = (SELECT code FROM diagnosis_code WHERE name LIKE '%kidney failure%')
AND (name, VAT_owner, date_timestamp) IN (SELECT name, VAT_owner,date_timestamp
                                          FROM produced_indicator
                                          WHERE indicator_name LIKE '%creatinine level%'
                                          AND value > 1);
