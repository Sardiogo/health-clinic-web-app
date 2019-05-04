-- FUNCTION total_consults
	SELECT TOTAL_CONSULTS('yara', '789658446', 2018);
	SELECT TOTAL_CONSULTS('yara', '789658446', 2015);
	SELECT TOTAL_CONSULTS('Scooby', '577708490', 2015);
	SELECT TOTAL_CONSULTS('Scooby', '141597822', 2015);

-- Procedure change_indicator
	SELECT value, units, indicator.name, reference_value
	FROM produced_indicator JOIN indicator 
		ON produced_indicator.indicator_name = indicator.name;
		
	CALL change_indicator();

	SELECT value, units, indicator.name, reference_value
	FROM produced_indicator JOIN indicator 
		ON produced_indicator.indicator_name = indicator.name;

-- 1 Trigger insert_assistant
	INSERT INTO animal VALUES ('Scooby',849906464, 'Bichon Frise', 'Brown', 'Male', 2013, 2);
	SELECT * FROM animal;
	INSERT INTO consult VALUES ('Scooby',849906464, '2018-05-17 11:30:00', 'Skin lesions', 'Swollen Throat, Elevated Temperatura', 'Minor Infection', 'Antibiotic', 577708490, 789658446, 12);
	SELECT * FROM animal;


-- 2 Trigger insert_assistant
	SELECT * FROM veterinary;
	INSERT INTO assistant VALUES (827601181);

-- 3 Trigger insert_assistant
	SELECT * FROM phone_number;
	INSERT INTO phone_number VALUES (897771157, 890350122);