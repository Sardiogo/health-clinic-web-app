-- Assignment 3 - Functions, Triggers and Stored Procedures

-- 1 trigger
delimiter $$
CREATE TRIGGER update_age after insert ON consult for each row
  BEGIN

  UPDATE animal
  SET age = YEAR(CURRENT_DATE) - birth_year
  WHERE animal.name=new.name
  AND animal.VAT=new.VAT_owner;

  END$$

  delimiter ;

-- 2 triggers
delimiter $$
CREATE TRIGGER insert_assistant before insert ON assistant for each row
  BEGIN

    if new.VAT=(SELECT vat FROM veterinary where veterinary.vat= new.vat) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A veterinary doctor cannot simultaneously be an assistant in the hospital';
    END if;
  END$$

  delimiter ;

  delimiter $$
  CREATE TRIGGER insert_vet before insert ON veterinary for each row
    BEGIN

      if new.VAT=(SELECT vat FROM assistant where assistant.vat= new.vat) then
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An assistant in the hospital cannot simultaneously be a veterinary doctor';
      END if;
    END$$

    delimiter ;


    delimiter $$
    CREATE TRIGGER insert_assistant before update ON assistant for each row
      BEGIN

        if new.VAT=(SELECT vat FROM veterinary where veterinary.vat= new.vat) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A veterinary doctor cannot simultaneously be an assistant in the hospital';
        END if;
      END$$

      delimiter ;

      delimiter $$
      CREATE TRIGGER insert_vet before update ON veterinary for each row
        BEGIN

          if new.VAT=(SELECT vat FROM assistant where assistant.vat= new.vat) then
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An assistant in the hospital cannot simultaneously be a veterinary doctor';
          END if;
        END$$

        delimiter ;


-- 3 triggers
delimiter $$
create trigger insert_phonenumber before insert on phone_number for each row
  begin
    if new.phone = (SELECT phone from phone_number where phone=new.phone) then
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot have the same phone number';
    END if;
  end$$

  delimiter ;

  delimiter $$
  create trigger update_phonenumber before update on phone_number for each row
    begin
      if new.phone = (SELECT phone from phone_number where phone=new.phone) then
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot have the same phone number';
      END if;
    end$$

    delimiter ;

-- 4 Function
DELIMITER $$
DROP FUNCTION IF EXISTS TOTAL_CONSULTS $$
CREATE FUNCTION total_consults(
		animal_name varchar(255),
        vat INTEGER,
		date_year YEAR)
	RETURNS INTEGER
	BEGIN
		DECLARE counter INTEGER;
		SELECT COUNT(*) INTO counter
        FROM consult
		WHERE name = animal_name
			AND VAT_owner = vat
			AND EXTRACT(YEAR FROM date_timestamp) = date_year;
		RETURN counter;
	END$$
DELIMITER ;

-- 5 Procedure
DROP PROCEDURE IF EXISTS CHANGE_INDICATOR;
DELIMITER $$
CREATE PROCEDURE change_indicator ()
	BEGIN
		UPDATE produced_indicator
		SET VAT_owner = VAT_owner,
			date_timestamp = date_timestamp,
			num = num,
			indicator_name = indicator_name,
			value = value/10
		WHERE (VAT_owner, date_timestamp, num, indicator_name, value) IN (
			SELECT VAT_owner, date_timestamp, num, indicator_name, value
			FROM(
				SELECT VAT_owner, date_timestamp, num, indicator_name, value
				FROM produced_indicator JOIN indicator
					ON produced_indicator.indicator_name = indicator.name
				WHERE units like '%mg%') AS name_result);
		UPDATE indicator
		SET units = REPLACE(units,'mg', 'cg'),
			reference_value = reference_value/10
		WHERE units like '%mg%';
	END$$
DELIMITER ;
