-- Assignment 2 - Indexes

-- For Query 1
CREATE INDEX name_index ON
person(name);

CREATE INDEX vat_vet_index ON
consult(VAT_vet);

CREATE INDEX animal_vat_index ON
animal(VAT);

CREATE INDEX animal_name_index ON
animal(name);


-- For Query 2
CREATE INDEX units_index ON
indicator(units);
