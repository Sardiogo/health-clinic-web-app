-- Assignment 2 - Populate

--Populate the database
INSERT INTO person VALUES (577708490, 'John Smith', '998 Macpherson Circle', 'Cincinnati', 45254);
INSERT INTO person VALUES (789658446, 'Maritsa Tichner', '1 Lighthouse Bay Circle', 'Little Rock', 72204);
INSERT INTO person VALUES (246943762, 'Koenraad Rottenbury', '678 Manitowish Terrace', 'Chicago', 60619);
INSERT INTO person VALUES (680810229, 'Kim Garton', '30736 Elmside Center', 'Sunnyvale', 94089);
INSERT INTO person VALUES (827601181, 'Con McAusland', '5528 Basil Avenue', 'Honolulu', 96850);
INSERT INTO person VALUES (897771157, 'Frederick Girodier', '27070 Thompson Trail', 'Detroit', 48211);
INSERT INTO person VALUES (141597822, 'Lorette Fildes', '4079 Springs Road', 'Washington', 20067);
INSERT INTO person VALUES (287747154, 'Hardy Ollive', '46 Golden Leaf Park', 'Nashville', 37215);
INSERT INTO person VALUES (607945198, 'Elmo MacGuigan', '759 Nevada Terrace', 'New Orleans', 70149);
INSERT INTO person VALUES (135113869, 'Erika Bindon', '276 Hoepker Avenue', 'Saint Paul', 55108);
INSERT INTO person VALUES (241819611, 'Kalie Milmoe', '5 Elgar Lane', 'Richmond', 23289);
INSERT INTO person VALUES (633821481, 'Fabe St. Louis', '567 Haas Lane', 'Milwaukee', 53285);
INSERT INTO person VALUES (744022800, 'Vikky Mellem', '963 Reinke Court', 'Muskegon', 49444);
INSERT INTO person VALUES (794475858, 'Bartlet Lardiner', '983 Hoepker Hill', 'Phoenix', 85072);
INSERT INTO person VALUES (176716608, 'Hillary Oguz', '7 Elka Plaza', 'Grand Rapids', 49560);
INSERT INTO person VALUES (123456788, 'Bartlet Lardiner', '7 Elka Plaza', 'Grand Rapids', 49560);
INSERT INTO person VALUES (283275555,'Luke Gibson','Porttitor Avenue 1','Firenze', 85656);
INSERT INTO person VALUES (407363612,'Lee Bryant','Mauris Avenue 2','San Demetrio Corone', 52740);
INSERT INTO person VALUES (700170646,'Boris Clark','Dean Avenue 3','Cercepiccola', 76848);
INSERT INTO person VALUES (657289210,'Julian Riddle','Port Avenue 4','Radebeul', 37766);
INSERT INTO person VALUES (839906464,'John Smith', '765-4786 Tempus St.', 'Cleveland', 65944);
INSERT INTO person VALUES (849906464,'John Smith', '700-4000 Tempus St.', 'Cleveland', 60044);

INSERT INTO phone_number VALUES (577708490, 3979331174);
INSERT INTO phone_number VALUES (789658446, 8936220604);
INSERT INTO phone_number VALUES (246943762, 5271842306);
INSERT INTO phone_number VALUES (680810229, 4261969611);
INSERT INTO phone_number VALUES (827601181, 3597853857);
INSERT INTO phone_number VALUES (897771157, 2859362509);
INSERT INTO phone_number VALUES (141597822, 5993603401);
INSERT INTO phone_number VALUES (287747154, 5214220545);
INSERT INTO phone_number VALUES (607945198, 6367462510);
INSERT INTO phone_number VALUES (135113869, 2187887871);
INSERT INTO phone_number VALUES (241819611, 1247015695);
INSERT INTO phone_number VALUES (633821481, 3143426892);
INSERT INTO phone_number VALUES (744022800, 9156390911);
INSERT INTO phone_number VALUES (794475858, 6523906266);
INSERT INTO phone_number VALUES (176716608, 4732696800);
INSERT INTO phone_number VALUES (789658446, 1381350727);
INSERT INTO phone_number VALUES (141597822, 9131626460);
INSERT INTO phone_number VALUES (744022800, 1185107317);
INSERT INTO phone_number VALUES (123456788, 3798396280);
INSERT INTO phone_number VALUES (283275555, 237468988);
INSERT INTO phone_number VALUES (407363612, 620369640);
INSERT INTO phone_number VALUES (700170646, 337217347);
INSERT INTO phone_number VALUES (657289210, 335829218);
INSERT INTO phone_number VALUES (839906464, 890350122);

INSERT INTO client VALUES (897771157);
INSERT INTO client VALUES (141597822);
INSERT INTO client VALUES (287747154);
INSERT INTO client VALUES (607945198);
INSERT INTO client VALUES (135113869);
INSERT INTO client VALUES (241819611);
INSERT INTO client VALUES (633821481);
INSERT INTO client VALUES (744022800);
INSERT INTO client VALUES (794475858);
INSERT INTO client VALUES (577708490);
INSERT INTO client VALUES (789658446);
INSERT INTO client VALUES (176716608);
INSERT INTO client VALUES (123456788);
INSERT INTO client VALUES (700170646);
INSERT INTO client VALUES (849906464);


INSERT INTO veterinary VALUES (577708490,'Surgery','Graduated in 2012 from University of Pennsylvania School of Veterinary Medicine. Works in the hospital since 2015.');
INSERT INTO veterinary VALUES (789658446,'Dermatology','Graduated in 2005 from LSU School of Veterinary Medicine.Works in the hiospital since 2009.');
INSERT INTO veterinary VALUES (246943762,'Internal Medicine','Graduated in 2011 from University of Pennsylvania School of Veterinary Medicine. Works in the hospital since 2012.');
INSERT INTO veterinary VALUES (680810229,'Anesthesia','Graduated in 2016 from LSU School of Veterinary Medicine.Works in the hiospital since 2015.');
INSERT INTO veterinary VALUES (827601181,'Radiology','Graduated in 2001 from UC Davis School of Veterinary Medicine. Works in the hospital since 2002.');

INSERT INTO assistant VALUES (176716608);
INSERT INTO assistant VALUES (123456788);
INSERT INTO assistant VALUES (283275555);
INSERT INTO assistant VALUES (407363612);
INSERT INTO assistant VALUES (700170646);
INSERT INTO assistant VALUES (657289210);
INSERT INTO assistant VALUES (839906464);

INSERT INTO species VALUES ('Fish', 'Saltwater or freshwater');
INSERT INTO species VALUES ('Mammal', 'Any small, medium our large sized mammal');
INSERT INTO species VALUES ('Dog', 'Mammal: 4 legs, medium size');
INSERT INTO species VALUES ('Cat', 'Mammal: 4 legs, small size');
INSERT INTO species VALUES ('Bird', 'Birds that can or cannot fly');
INSERT INTO species VALUES ('Reptile', 'Ectothermic and amniote vertebrates');
INSERT INTO species VALUES ('Snake', 'A legless reptile, can be venomous');
INSERT INTO species VALUES ('Golden Fish', 'Small freshwater fish' );
INSERT INTO species VALUES ('Rabbit', 'A domesticated mammal with long ears of the order Lagomorpha');
INSERT INTO species VALUES ('Iguana', 'A reptile from tropical regions');
INSERT INTO species VALUES ('Parrot', 'Vividly coloured bird with a strong and curved bill');
INSERT INTO species VALUES ('Cockatoo', 'Small vividly coloured bird with showy crests and curved bill');
INSERT INTO species VALUES ('Crossed Breed', 'A cross between cat or dog breeds. Can be small, medium or large sized');
INSERT INTO species VALUES ('Golden Retriever', 'Dog breed - Large Sized');
INSERT INTO species VALUES ('Bichon Frise', 'Dog Breed - Small Sized');
INSERT INTO species VALUES ('Border Collie', 'Dog Breed - Medium Sized');
INSERT INTO species VALUES ('Australian Shepherd', 'Dog Breed - Medium Sized');
INSERT INTO species VALUES ('Terrier', 'Dog Breed - Medium Sized');
INSERT INTO species VALUES ('Labrador', 'Dog Breed - Large Sized');
INSERT INTO species VALUES ('Siamese', 'Cat Breed - Short Hair Length');
INSERT INTO species VALUES ('Persian', 'Cat Breed - Long Hair Length');
INSERT INTO species VALUES ('Bengal', 'Cat Breed - Short Hair Length');
INSERT INTO species VALUES ('American Bobtail', 'Cat Breed - Long Hair Length');
INSERT INTO species VALUES ('Sphynx', 'Cat Breed - Short Hair Length');
INSERT INTO species VALUES ('Siberian', 'Cat Breed - Long Hair Length');
INSERT INTO species VALUES ('American Shorthair', 'Cat Breed - Short Hair Length');


INSERT INTO generalization_species VALUES ('Snake', 'Reptile');
INSERT INTO generalization_species VALUES ('Golden Fish', 'Fish');
INSERT INTO generalization_species VALUES ('Rabbit', 'Mammal');
INSERT INTO generalization_species VALUES ('Iguana', 'Reptile');
INSERT INTO generalization_species VALUES ('Parrot', 'Bird');
INSERT INTO generalization_species VALUES ('Cockatoo', 'Bird');
INSERT INTO generalization_species VALUES ('Crossed Breed', 'Mammal');
INSERT INTO generalization_species VALUES ('Golden Retriever', 'Dog');
INSERT INTO generalization_species VALUES ('Bichon Frise', 'Dog');
INSERT INTO generalization_species VALUES ('Border Collie', 'Dog');
INSERT INTO generalization_species VALUES ('Australian Shepherd', 'Dog');
INSERT INTO generalization_species VALUES ('Terrier', 'Dog');
INSERT INTO generalization_species VALUES ('Labrador', 'Dog');
INSERT INTO generalization_species VALUES ('Siamese', 'Cat');
INSERT INTO generalization_species VALUES ('Persian', 'Cat');
INSERT INTO generalization_species VALUES ('Bengal', 'Cat');
INSERT INTO generalization_species VALUES ('American Bobtail', 'Cat');
INSERT INTO generalization_species VALUES ('Sphynx', 'Cat');
INSERT INTO generalization_species VALUES ('Siberian', 'Cat');
INSERT INTO generalization_species VALUES ('American Shorthair', 'Cat');
INSERT INTO generalization_species VALUES ('Dog', 'Mammal');
INSERT INTO generalization_species VALUES ('Cat', 'Mammal');

INSERT INTO animal VALUES('Lassie',897771157,'Labrador','Brown','Female',2015,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Pluto',897771157,'Dog','Black','Male',2010,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Peanut',897771157,'Terrier','Black','Male',2017,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Charlie',141597822,'Iguana','Green','Male',2017,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Buddy',287747154,'Mammal','Grey','Female',2013,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Peanut',607945198,'Parrot','Red','Male',2010,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Charlie',633821481, 'Cat','Yellow','Male',2015,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Bailey',633821481,'Persian','Grey','Female',2017,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Waffles',744022800,'Golden Fish','Red','Female',2014,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Simba',577708490,'Australian Shepherd','Black, White and brown','Male',2010,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Mufasa',789658446,'Siberian','Grey','Male',2015,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Pumba',176716608, 'Crossed Breed','Brown', 'Male', 2016, (YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Kiki',123456788, 'Cockatoo', 'Red, blue, yellow', 'Female', 2016, (YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Flipflop',123456788,'Border Collie','Black and white','Male',2017,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES('Yara',789658446,'Labrador','Brown','Male',2015,(YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Pocas', 700170646, 'Rabbit', 'White', 'Female', 2018, (YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Scooby',577708490, 'Golden Retriever', 'Brown', 'Male', 2014, (YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Scooby',141597822, 'Bichon Frise', 'Brown', 'Male', 2013, (YEAR(CURRENT_DATE) - birth_year));
INSERT INTO animal VALUES ('Sirius',849906464, 'Snake', 'Green', 'Male', 2015, (YEAR(CURRENT_DATE) - birth_year));




INSERT INTO consult VALUES('Lassie',897771157,'2017-11-06 09:30:00','Asthma','Obese','Loss of mobility, nose condition, asthamatic','Rigorous diet, daily walks, weekly gradually intense exercise',897771157,246943762,49);
INSERT INTO consult VALUES('Buddy',287747154,'2018-11-06 09:30:00','Asthma','Obese','Loss of mobility, lung condition, asthamatic, back muscle strain','Rigorous diet, daily walks, weekly gradually intense exercise',287747154,789658446,29);
INSERT INTO consult VALUES('Buddy',287747154,'2017-11-06 09:30:00','Asthma','Obese','Loss of mobility, lung condition, asthamatic, back muscle strain','Rigorous diet, daily walks, weekly gradually intense exercise',287747154,789658446,40);
INSERT INTO consult VALUES('Lassie',897771157,'2016-06-20 13:00:00', 'Skin lesions', 'Swollen Throat, Elevated Temperatura','Minor Infection','Antibiotic',141597822,789658446,23);
INSERT INTO consult VALUES('Peanut',897771157,'2017-11-20 11:00:00','Leg pain','Possible broken leg','Leg fracture','Leg orthopedic cast and rest',135113869,827601181,36);
INSERT INTO consult VALUES('Kiki',123456788,'2016-12-20 14:15:00', 'Dehydration','Diarrhea','Intestinal Virus','Diet, Antiviral',123456788,246943762, 0.5);
INSERT INTO consult VALUES('Waffles',744022800,'2017-12-20 15:30:00','Big ball in the head','Had brain tumor in 2015','Brain tumor','Surgery to remove the tumor',744022800,577708490,0.1);
INSERT INTO consult VALUES('Simba',577708490,'2017-08-15 10:30:00','Fatigue, Shortness of Breath','Fever, Member Swelling, Ammonia Breath','Uremia, Urinary Tract Infection, Kidney Failure','Antibiotic, Probiotic, Pain Killers',577708490,246943762, 15);
INSERT INTO consult VALUES('Flipflop',123456788,'2018-01-15 10:30:00','Asthma','Obese','Loss of mobility, lung condition, asthamatic, back muscle strain','Rigorous diet, daily walks, weekly gradually intense exercise',123456788,246943762,33);
INSERT INTO consult VALUES ('Bailey',633821481,'2018-01-15 12:30:00','Blood in nail','Never had problems','Broken Nail','Ice and spcecial glue.Stay at home for a week',633821481,577708490,8);
INSERT INTO consult VALUES('Yara',789658446,'2018-1-10 09:30:00','Asthma','Obese','Loss of mobility, nose condition, asthamatic','Rigorous diet, daily walks, weekly gradually intense exercise',607945198,789658446,51);
INSERT INTO consult VALUES('Yara',789658446,'2018-2-4 12:30:00','Dehydration','Diarrhea','Intestinal Virus','Diet, Antiviral',607945198,246943762,43);
INSERT INTO consult VALUES('Flipflop',123456788,'2018-2-4 15:30:00','Dehydration','Diarrhea','Intestinal Virus','Diet, Antiviral',607945198,246943762,28);
INSERT INTO consult VALUES('Flipflop',123456788,'2018-3-4 9:00:00','Dehydration','Diarrhea','Intestinal Virus','Diet, Antiviral',123456788,246943762,25);
INSERT INTO consult VALUES ('Scooby',577708490, '2015-05-17 11:30:00', 'Skin lesions', 'Swollen Throat, Elevated Temperatura', 'Minor Infection', 'Antibiotic', 577708490, 789658446, 12);
INSERT INTO consult VALUES ('Scooby',577708490, '2016-02-15 12:30:00', 'Leg pain', 'Possible broken leg', 'Leg fracture', 'Leg orthopedic cast and rest', 700170646,577708490, 10);
INSERT INTO consult VALUES ('Waffles',744022800,'2017-11-21 12:00:00','Fatigue, Shortness of Breath','Fever, Member Swelling, Ammonia Breath','Uremia, Urinary Tract Infection, Kidney Failure','Antibiotic, Probiotic, Pain Killers', 577708490, 789658446, 0.5);
INSERT INTO consult VALUES ('Scooby',141597822, '2018-01-22 15:30:00','Big ball in the head','Had brain tumor in 2015','Brain tumor','Surgery to remove the tumor',141597822,577708490, 13.1);
INSERT INTO consult VALUES ('Scooby',141597822, '2014-04-23 14:15:00', 'Dehydration','Diarrhea','Intestinal Virus','Diet, Antiviral',141597822,246943762, 13.5);


INSERT INTO participation VALUES('Buddy',287747154,'2017-11-06 09:30:00',176716608);
INSERT INTO participation VALUES('Peanut',897771157,'2017-11-20 11:00:00',176716608);
INSERT INTO participation VALUES('Simba',577708490,'2017-08-15 10:30:00',123456788);

INSERT INTO diagnosis_code VALUES('O-KF', 'Kidney Failure');
INSERT INTO diagnosis_code VALUES('B-Ob', 'Body - Obesity');
INSERT INTO diagnosis_code VALUES('b-BB', 'Bone - Broken Bone');
INSERT INTO diagnosis_code VALUES('I-GInf', 'Imunology - General Infection');
INSERT INTO diagnosis_code VALUES('I-IInf', 'Imunology - Intestinal Infection');
INSERT INTO diagnosis_code VALUES('T-B', 'Tumor - Brain Tumor');

INSERT INTO consult_diagnosis VALUES('B-Ob','Lassie',897771157,'2017-11-06 09:30:00');
INSERT INTO consult_diagnosis VALUES('b-BB','Peanut',897771157,'2017-11-20 11:00:00');
INSERT INTO consult_diagnosis VALUES('I-IInf','Kiki',123456788,'2016-12-20 14:15:00');
INSERT INTO consult_diagnosis VALUES('O-KF','Simba',577708490,'2017-08-15 10:30:00');
INSERT INTO consult_diagnosis VALUES('T-B','Waffles',744022800,'2017-12-20 15:30:00');
INSERT INTO consult_diagnosis VALUES('B-Ob','Flipflop',123456788,'2018-01-15 10:30:00');
INSERT INTO consult_diagnosis VALUES('B-Ob','Yara',789658446,'2018-1-10 09:30:00');
INSERT INTO consult_diagnosis VALUES('I-IInf','Yara',789658446,'2018-2-4 12:30:00');
INSERT INTO consult_diagnosis VALUES('I-IInf','Flipflop',123456788,'2018-2-4 15:30:00');
INSERT INTO consult_diagnosis VALUES('I-IInf','Flipflop',123456788,'2018-3-4 9:00:00');
INSERT INTO consult_diagnosis VALUES('O-KF','Scooby',141597822, '2014-04-23 14:15:00');


INSERT INTO medication VALUES('Ceftriaxone','AMSA Laboratories','1g/50mL');
INSERT INTO medication VALUES('Cefixime','Mediva','200mg/5mL');
INSERT INTO medication VALUES('PET Pectillin','Lambert Kay','118mL');
INSERT INTO medication VALUES('Vitamin C Tablets','Vitamedic','500mg');
INSERT INTO medication VALUES('Frontline Tri-Act','Merial','4mL');
INSERT INTO medication VALUES('Iodine','Benevolent','59mL');
INSERT INTO medication VALUES('Rimadyl', 'Pfizer', '25mg');
INSERT INTO medication Values('Zylkene','Vetoquinol','225mg');

INSERT INTO prescription VALUES('b-BB','Peanut',897771157,'2017-11-20 11:00:00','Vitamin C Tablets','Vitamedic','500mg','One tablet per day for 7 days');
INSERT INTO prescription VALUES('b-BB','Peanut',897771157,'2017-11-20 11:00:00','Zylkene','Vetoquinol','225mg','2 capsules per day for 15 days');
INSERT INTO prescription VALUES('I-IInf','Kiki',123456788,'2016-12-20 14:15:00','Cefixime','Mediva','200mg/5mL', '1 Injection per day for 5 days');
INSERT INTO prescription VALUES('O-KF','Simba',577708490,'2017-08-15 10:30:00','Vitamin C Tablets','Vitamedic','500mg', 'One tablet per day for 7 days');
INSERT INTO prescription VALUES('O-KF','Simba',577708490,'2017-08-15 10:30:00','Rimadyl', 'Pfizer', '25mg', '1 chewable capsule every 8 hours for 7 days');
INSERT INTO prescription VALUES('T-B','Waffles',744022800,'2017-12-20 15:30:00','Iodine','Benevolent','59mL','2mL 3 times a day during 2 months');
INSERT INTO prescription VALUES('O-KF','Scooby',141597822, '2014-04-23 14:15:00','Rimadyl', 'Pfizer', '25mg', '1 chewable capsule every 8 hours for 7 days');

INSERT INTO indicator VALUES ('Vitamin D',75,'ng/mL','Values between 20-100 ng/m are also acceptable');
INSERT INTO indicator VALUES ('Neutrophils',50,'% of WBC','Measured in percentage of white blood cells');
INSERT INTO indicator VALUES ('Lymphocytes',30,'% of WBC','Measured in percentage of white blood cells');
INSERT INTO indicator VALUES ('Monochytes',6,'% of WBC','Measured in percentage of white blood cells');
INSERT INTO indicator VALUES ('Creatinine level',100,'ng/ML','The value may be different for different animals');
INSERT INTO indicator VALUES ('Sodium',320,'mg/dL','Bigger animals can have a higher value');
INSERT INTO indicator VALUES ('Potassium',15,'mg/dL','Results can be affected by infusion of potassium-containing fluids or an infusion of glucose or insulin.');
INSERT INTO indicator VALUES ('Erythrocyte',40,'% of RBC','Measured in percentage of red blood cells. Normal values may vary depending on the individual laboratory and ages');
INSERT INTO indicator VALUES ('pH',7,'', 'Urine pH is a measure of the hydrogen ion concentration in urine');
INSERT INTO indicator VALUES ('Protein',50,'mg/dL', 'Trace amounts of protein can normally be found in urine');
INSERT INTO indicator VALUES ('Glucose',0,'mg/dL', 'Glucose is not normally found in the urine of dogs and cats');
INSERT INTO indicator VALUES ('Ketones',0,'mg/dL', 'Ketones are produced by lipolysis and are filtered by the glomerulus. Should be negative for Ketones');
INSERT INTO indicator VALUES ('Urobilinogen',0.6,'mg/dL', 'Intestinal bacteria convert conjugated bilirubin to urobilinogen');
INSERT INTO indicator VALUES ('Bilirubin',0.1,'mg/dL', 'Conjugated bilirubin will readily travel through the glomerulus into the filtrate. Dogs have low renal threshold for bilirubin');
INSERT INTO indicator VALUES ('Specific Gravity',1.030, 'mg/dL', 'Specific Gravity is a reflection of solute concentration');
INSERT INTO indicator VALUES ('Urine Clarity',2.5,'', 'In a scale from 1 to 5 in clarity. True reference for most animals, clear to slightly cloudy (Horses - 4, cloudy)');
INSERT INTO indicator VALUES ('Nitrites',110,'mg/dL', 'Abnormal values may indicate infection');
INSERT INTO indicator VALUES ('Benzodiazepinas',200,'mg/dL', 'Higher values indicate a possible risk of overdosage');

INSERT INTO procedure_consult VALUES('Peanut',897771157,'2017-11-20 11:00:00',1,'Radiography bone part 1 confirmed broken bone');
INSERT INTO procedure_consult VALUES('Peanut',897771157,'2017-11-20 11:00:00',2,'Radiography bone part 2 confirmed broken bone');
INSERT INTO procedure_consult VALUES('Lassie',897771157,'2017-11-06 09:30:00', 1, 'Blood Analysis');
INSERT INTO procedure_consult VALUES('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Urinalysis');
INSERT INTO procedure_consult VALUES('Buddy',287747154,'2017-11-06 09:30:00', 1, 'Blood Analysis');
INSERT INTO procedure_consult VALUES('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Urinalysis');
INSERT INTO procedure_consult VALUES('Waffles',744022800,'2017-12-20 15:30:00',1,'Surgical. Success');
INSERT INTO procedure_consult VALUES ('Simba',577708490,'2017-08-15 10:30:00',2,'Urinalysis');
INSERT INTO procedure_consult VALUES ('Simba',577708490,'2017-08-15 10:30:00',1,'Blood Analysis');
INSERT INTO procedure_consult VALUES ('Scooby',141597822,'2014-04-23 14:15:00',1,'Blood Analysis');

INSERT INTO performed VALUES('Peanut',897771157,'2017-11-20 11:00:00',1,176716608);
INSERT INTO performed VALUES('Peanut',897771157,'2017-11-20 11:00:00',2,176716608);
INSERT INTO performed VALUES('Waffles',744022800,'2017-12-20 15:30:00',1,176716608);
INSERT INTO performed VALUES('Waffles',744022800,'2017-12-20 15:30:00',1,123456788);

INSERT INTO radiography VALUES ('Peanut',897771157,'2017-11-20 11:00:00',1,'C:/Users/VetHospital/Radiography/Images/Peanut_20122017_p01.jpg');
INSERT INTO radiography VALUES ('Peanut',897771157,'2017-11-20 11:00:00',2,'C:/Users/VetHospital/Radiography/Images/Peanut_20122017_p02.jpg');

INSERT INTO test_procedure VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1, 'blood');
INSERT INTO test_procedure VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'urine');
INSERT INTO test_procedure VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1, 'blood');
INSERT INTO test_procedure VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'urine');
INSERT INTO test_procedure VALUES ('Simba',577708490,'2017-08-15 10:30:00',2,'urine');
INSERT INTO test_procedure VALUES ('Simba',577708490,'2017-08-15 10:30:00',1,'blood');
INSERT INTO test_procedure VALUES ('Scooby',141597822, '2014-04-23 14:15:00',1,'blood');


INSERT INTO produced_indicator VALUES('Lassie',897771157,'2017-11-06 09:30:00',1,'Vitamin D',79);
INSERT INTO produced_indicator VALUES('Lassie',897771157,'2017-11-06 09:30:00', 1,'Neutrophils',45);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Lymphocytes',40);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Monochytes',10);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Creatinine level',0.5);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Sodium',325);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Potassium',13);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 1,'Erythrocyte',40);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'pH', 6);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Protein', 50);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Glucose', 10);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Ketones', 0.01);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Urobilinogen', 0.5);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Bilirubin', 0.1);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Specific Gravity', 1);
INSERT INTO produced_indicator VALUES ('Lassie',897771157,'2017-11-06 09:30:00', 2, 'Urine Clarity', 3.25);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Vitamin D',60);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Neutrophils',55);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Lymphocytes',42);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Monochytes',10);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Creatinine level',2);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Sodium',318);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Potassium',18);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 1,'Erythrocyte',49);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'pH', 7);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Protein', 55);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Glucose', 7);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Ketones', 0.05);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Urobilinogen', 0.5);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Bilirubin', 0.1);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Specific Gravity', 1.020);
INSERT INTO produced_indicator VALUES ('Buddy',287747154,'2017-11-06 09:30:00', 2, 'Urine Clarity', 3);
INSERT INTO produced_indicator VALUES('Simba',577708490,'2017-08-15 10:30:00',2, 'Urine Clarity', 3.25);
INSERT INTO produced_indicator VALUES('Simba',577708490,'2017-08-15 10:30:00',2,'pH', 6);
INSERT INTO produced_indicator VALUES('Simba',577708490,'2017-08-15 10:30:00',1,'Creatinine Level', 3);
INSERT INTO produced_indicator VALUES('Scooby',141597822, '2014-04-23 14:15:00',1,'Creatinine Level', 3);
