-- Assignment 2 - Queries


-- Query #1
SELECT DISTINCT animal.name as animal_name, powner.name as owner_name, species_name, year(current_date)-animal.birth_year as age
FROM person powner, person pvet, animal, consult
WHERE consult.VAT_vet = pvet.vat
AND pvet.name = 'John Smith'
AND consult.VAT_owner = animal.VAT
AND animal.VAT = powner.VAT
AND consult.name=animal.name;
/*
---- 1º query --- Alternative

SELECT animal.name, person.name AS owner, species_name, (year(current_date) - birth_year) AS age
FROM (client NATURAL JOIN person) JOIN animal USING(VAT)
WHERE (person.VAT, animal.name) IN
        (SELECT DISTINCT VAT_owner, name
         FROM consult
         WHERE VAT_vet IN (SELECT VAT FROM person WHERE name ='John Smith')
         OR VAT_client IN (SELECT VAT FROM person WHERE name ='John Smith'));

SELECT name, VAT_owner, VAT_client, VAT_vet FROM consult order by name;
SELECT VAT, name FROM person order by name;
SELECT animal.name, VAT AS owner, species_name, (year(current_date) - birth_year) AS age FROM animal;
*/

-- Query #2
SELECT DISTINCT name, reference_value
FROM indicator
WHERE units like '%mg%'
AND reference_value > 100
ORDER BY reference_value DESC;


-- Query #3
SELECT DISTINCT animal.name as animal_name, person.name as person_name, species_name, year(current_date)-animal.birth_year as age
FROM animal, consult c, person
WHERE animal.name = c.name
AND c.VAT_owner = person.VAT
AND (o like '%obese%' or o like '%obesity%')
AND weight > 30
AND date_timestamp IN (SELECT MAX(date_timestamp)
                      FROM consult d
                      WHERE c.name = d.name
                      group by d.name);


-- Query #4
SELECT DISTINCT person.name, client.VAT, address_street, address_city, address_zip
FROM person, client
WHERE client.VAT = person.VAT
AND client.VAT NOT IN (SELECT DISTINCT client.VAT
                       FROM client, animal
                       WHERE client.VAT = animal.VAT);


-- Query #5
SELECT DISTINCT consult_diagnosis.code, count(distinct prescription.name_med) as count_medication
FROM consult_diagnosis, prescription
WHERE consult_diagnosis.code = prescription.code
GROUP BY consult_diagnosis.code
ORDER BY count_medication asc;


-- Query #6
SELECT avg(Assistants), avg(Procedures), avg(Diagnostics), avg(Prescriptions)
FROM (SELECT consult.date_timestamp, count(participation.date_timestamp) as Assistants
FROM consult LEFT OUTER JOIN participation
ON consult.date_timestamp = participation.date_timestamp
AND consult.VAT_owner = participation.VAT_owner
GROUP BY consult.date_timestamp, consult.VAT_vet
HAVING YEAR(consult.date_timestamp) = '2017') CA,

(SELECT consult.date_timestamp, count(procedure_consult.date_timestamp) as Procedures
FROM consult LEFT OUTER JOIN procedure_consult
ON consult.date_timestamp = procedure_consult.date_timestamp
AND consult.VAT_owner = procedure_consult.VAT_owner
GROUP BY consult.date_timestamp, consult.VAT_vet
HAVING YEAR(consult.date_timestamp) = '2017') CP,

(SELECT consult.date_timestamp, count(consult_diagnosis.date_timestamp) as Diagnostics
FROM consult LEFT OUTER JOIN consult_diagnosis
ON consult.date_timestamp = consult_diagnosis.date_timestamp
AND consult.VAT_owner = consult_diagnosis.VAT_owner
GROUP BY consult.date_timestamp, consult.VAT_vet
HAVING YEAR(consult.date_timestamp) = '2017') CD,

(SELECT consult.date_timestamp, count(prescription.date_timestamp) as Prescriptions
FROM consult LEFT OUTER JOIN prescription
ON consult.date_timestamp = prescription.date_timestamp
AND consult.VAT_owner = prescription.VAT_owner
GROUP BY consult.date_timestamp, consult.VAT_vet
HAVING YEAR(consult.date_timestamp) = '2017') CPr;


-- Query #7
SELECT Species, Most_Common_Diagnosis
FROM (SELECT Species, D1.name as Most_Common_Diagnosis, MAX(count_diagnosis)
      FROM (SELECT species_name as Species, diagnosis_code.name, count(consult_diagnosis.code) as count_diagnosis
            FROM animal, generalization_species, consult_diagnosis, diagnosis_code
            WHERE (species_name LIKE '%dog%' OR (name1 = species_name AND name2 LIKE '%dog%'))
            AND animal.VAT=consult_diagnosis.VAT_owner
            AND animal.name = consult_diagnosis.name
            AND diagnosis_code.code = consult_diagnosis.code
            GROUP BY species_name, diagnosis_code.name
            ORDER BY count_diagnosis DESC) D1
      GROUP BY Species) D2;


-- Query #8
(SELECT name
FROM client NATURAL JOIN veterinary NATURAL JOIN person)
UNION
(SELECT name
FROM client NATURAL JOIN assistant NATURAL JOIN person);


-- Query #9
SELECT person.name, address_street, address_city, address_zip
FROM person, animal, generalization_species
WHERE species_name LIKE '%bird%'
OR (name1 = species_name AND name2 LIKE '%bird%')
AND animal.VAT = person.VAT
and animal.vat not in ( SELECT person.vat
                        FROM animal, generalization_species, person
                        WHERE animal.species_name NOT LIKE '%bird%'
                        AND (name1 = species_name AND name2 NOT LIKE '%bird%')
                        AND animal.VAT = person.VAT);
