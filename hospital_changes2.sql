-- CHANGE 1
    -- Before CHANGE 1
    SELECT * FROM person ORDER BY name;
    SELECT * FROM person NATURAL JOIN client ORDER BY person.name;
    -- CHANGE 1
    UPDATE person
    SET address_street = 'Av. Rovisco Pais, 1049-001', address_city ='Lisboa'
    WHERE VAT IN (
        SELECT VAT FROM
            (SELECT VAT
            FROM person NATURAL JOIN client
            WHERE name = 'John Smith'
            ) AS person_client_vat
    ); 
    -- CHANGE 1 Results
    SELECT * FROM person ORDER BY name;
    SELECT * FROM person NATURAL JOIN client ORDER BY person.name;

-- CHANGE 2
    -- Before CHANGE 2
    SELECT * FROM produced_indicator where num = 1 ORDER BY indicator_name;
    SELECT name, reference_value, units FROM indicator ORDER BY name;
    --CHANGE 2
    UPDATE indicator
    SET reference_value = (reference_value + (reference_value*0.1))
    WHERE (name, units) IN (
        SELECT indicator.name, units FROM
            (SELECT indicator.name, units
            FROM indicator, produced_indicator
            WHERE units LIKE 'mg%' AND num = 1 
            AND indicator.name = produced_indicator.indicator_name
            ) AS blood_mg
    );
    -- CHANGE 2 Results
    SELECT name, reference_value, units FROM indicator ORDER BY name;

-- CHANGE 3
    -- Before change 3
    SELECT * FROM person ORDER BY name;
    SELECT * FROM person NATURAL JOIN client ORDER BY person.name;
    -- CHANGE 3
    DELETE FROM produced_indicator
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN
                        ( procedure_consult JOIN 
                            ( produced_indicator JOIN test_procedure USING (VAT_owner) ) 
                        USING (VAT_owner) )
                    USING (VAT_owner) ) ) )
        ) AS VAT_result 
    );
    DELETE FROM test_procedure
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN
                        ( procedure_consult JOIN test_procedure USING (VAT_owner) )
                    USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM radiography
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN
                        ( procedure_consult JOIN radiography USING (VAT_owner) )
                    USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM performed
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN
                        ( procedure_consult JOIN performed USING (VAT_owner) )
                    USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM procedure_consult
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN procedure_consult USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM prescription
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN
                        ( consult_diagnosis JOIN prescription USING (VAT_owner) )
                    USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM consult_diagnosis
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN consult_diagnosis USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM participation
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN  (
                SELECT DISTINCT VAT_owner 
                FROM (consult JOIN participation USING (VAT_owner) ) ) )
        ) AS VAT_result
    );
    DELETE FROM consult
    WHERE VAT_owner IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith'
            AND VAT IN ( SELECT DISTINCT VAT_owner FROM consult ) ) 
        ) AS VAT_result
    );
    UPDATE consult
    SET VAT_client = NULL
    WHERE VAT_client IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT
            FROM client NATURAL JOIN person
            WHERE person.name = 'John Smith') 
        ) AS VAT_result
    );
    DELETE FROM animal
    WHERE VAT IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM (animal JOIN person USING(VAT))  
            WHERE person.name = 'John Smith') 
        ) AS VAT_result
    );
    DELETE FROM phone_number
    WHERE VAT IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM client NATURAL JOIN person  
            WHERE person.name = 'John Smith') 
        ) AS VAT_result
    );
    DELETE FROM client
    WHERE VAT IN (
        SELECT VAT FROM(
            (SELECT DISTINCT VAT 
            FROM client NATURAL JOIN person  
            WHERE person.name = 'John Smith') 
        ) AS VAT_result
    );
    DELETE FROM person
    WHERE VAT NOT IN (SELECT VAT FROM veterinary)
    AND VAT NOT IN (SELECT VAT FROM assistant)
    AND VAT NOT IN (SELECT VAT FROM client)
    -- CHANGE 3 Results
    SELECT * FROM person ORDER BY name;
    SELECT * FROM person NATURAL JOIN client ORDER BY person.name;

-- CHANGE 4
    -- Before CHANGE 4
    SELECT * FROM diagnosis_code
    WHERE name LIKE 'Kidney Failure';

    INSERT INTO diagnosis_code 
    VALUES('ES-RD', 'End-stage - Renal disease');
    SELECT * FROM diagnosis_code;
    
    SELECT * FROM produced_indicator WHERE num =1 ORDER BY indicator_name;
    
    SELECT name, VAT_owner, num, indicator_name, value 
    FROM produced_indicator 
    WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1
    ORDER BY indicator_name;

    SELECT * FROM consult_diagnosis;

    SELECT * FROM consult_diagnosis
    WHERE (name, VAT_owner, date_timestamp) IN (
        SELECT * FROM
            (SELECT * FROM
                (SELECT name, VAT_owner, date_timestamp 
                FROM produced_indicator 
                WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1)
                AS proind_columns
            JOIN
                (SELECT name, VAT_owner, date_timestamp 
                FROM consult_diagnosis
                WHERE code = 'O-KF') AS cd_columns
            USING (name, VAT_owner, date_timestamp)) AS result_table
    );
    --CHANGE 4
    INSERT INTO consult_diagnosis
    SELECT 'ES-RD', name, VAT_owner, date_timestamp
    FROM consult_diagnosis
    WHERE (name, VAT_owner, date_timestamp) IN (
        SELECT DISTINCT * FROM
            (SELECT DISTINCT * FROM
                (SELECT name, VAT_owner, date_timestamp 
                FROM produced_indicator 
                WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1)
                AS proind_columns
            JOIN
                (SELECT name, VAT_owner, date_timestamp 
                FROM consult_diagnosis
                WHERE code = 'O-KF') AS cd_columns
            USING (name, VAT_owner, date_timestamp)) AS result_table
    );
    INSERT INTO prescription
    SELECT 'ES-RD', name, VAT_owner, date_timestamp, name_med, lab, dosage, regime 
    FROM prescription
    WHERE (name, VAT_owner, date_timestamp) IN (
        SELECT DISTINCT * FROM
            (SELECT DISTINCT * FROM
                (SELECT name, VAT_owner, date_timestamp 
                FROM produced_indicator 
                WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1)
                AS proind_columns
            JOIN
                (SELECT name, VAT_owner, date_timestamp 
                FROM consult_diagnosis
                WHERE code = 'O-KF') AS cd_columns
            USING (name, VAT_owner, date_timestamp)) AS result_table
    );
    SELECT code, name, VAT_owner, date_timestamp, name_med
    FROM prescription;

    DELETE FROM prescription
    WHERE (name, VAT_owner, date_timestamp, code) IN (
        SELECT DISTINCT * FROM
            (SELECT DISTINCT * FROM
                (SELECT name, VAT_owner, date_timestamp 
                FROM produced_indicator 
                WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1)
                AS proind_columns
            JOIN
                (SELECT code, name, VAT_owner, date_timestamp 
                FROM consult_diagnosis
                WHERE code = 'O-KF') AS cd_columns
            USING (name, VAT_owner, date_timestamp)) AS result_table
    );
    SELECT code, name, VAT_owner, date_timestamp, name_med
    FROM prescription;

    DELETE FROM consult_diagnosis
    WHERE (name, VAT_owner, date_timestamp, code) IN (
        SELECT DISTINCT * FROM
            (SELECT DISTINCT * FROM
                (SELECT name, VAT_owner, date_timestamp 
                FROM produced_indicator 
                WHERE num = 1 AND indicator_name = 'Creatinine level' AND value>1)
                AS proind_columns
            JOIN
                (SELECT code, name, VAT_owner, date_timestamp 
                FROM consult_diagnosis
                WHERE code = 'O-KF') AS cd_columns
            USING (name, VAT_owner, date_timestamp)) AS result_table
    );
    -- CHANGE 4 Results
    SELECT * FROM consult_diagnosis;
