ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(name);
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

CREATE TABLE types(
  type_id INT PRIMARY KEY,
  type VARCHAR(40) NOT NULL
);
INSERT INTO types(type_id, type) VALUES(1, 'metal'), (2, 'metalloid'), (3, 'nonmetal');

ALTER TABLE properties ADD COLUMN type_id INT;
UPDATE properties SET type_id = 1 WHERE type = 'metal';
UPDATE properties SET type_id = 2 WHERE type = 'metalloid';
UPDATE properties SET type_id = 3 WHERE type = 'nonmetal';
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);

UPDATE elements SET symbol = INITCAP(symbol);

ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = TRIM(TRAILING '0' FROM CAST(atomic_mass AS TEXT))::DECIMAL;

INSERT INTO elements(atomic_number, symbol, name) 
VALUES
  (9, 'F', 'Fluorine'),
  (10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
VALUES
  (9, 'nonmetal', 18.998, -220, -188.1, 3),
  (10, 'nonmetal', 20.18, -248.6, -246.1, 3);

UPDATE elements SET name = 'Fluorine' WHERE atomic_number = 9;

ALTER TABLE properties DROP COLUMN type;
DELETE FROM elements WHERE atomic_number = 1000;
DELETE FROM properties WHERE atomic_number = 1000;

SELECT * FROM elements order by atomic_number;
SELECT * FROM properties order by atomic_number;
SELECT * FROM properties FULL JOIN types using(type_id) order by atomic_number;
SELECT * FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) order by atomic_number;
SELECT * FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) order by atomic_number;
