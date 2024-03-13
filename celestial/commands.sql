CREATE DATABASE universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL UNIQUE PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  type VARCHAR(20) NOT NULL,
  age_in_billion NUMERIC (4, 1),
  distance_in_ly INT,
  size_in_ly INT,
  core INT,
  spherical BOOLEAN,
  has_pulsar BOOLEAN
);

INSERT INTO galaxy (
  name,
  type,
  age_in_billion,
  distance_in_ly,
  size_in_ly,
  core,
  spherical,
  has_pulsar
)
VALUES 
    ('Ehdan', 'Elliptical', 12.5, 35000, 200000, 1, FALSE, TRUE),
    ('Jorei', 'Spiral', 9.3, 42000, 150000, 0, TRUE, FALSE),
    ('Klondike', 'Irregular', 10.2, 28000, 180000, 0, FALSE, TRUE),
    ('Panmaru', 'Spiral', 11.8, 38000, 160000, 1, TRUE, TRUE),
    ('Schetlezz', 'Elliptical', 13.7, 40000, 220000, 1, FALSE, FALSE);

CREATE TABLE star (
  star_id SERIAL UNIQUE PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  type VARCHAR(20) NOT NULL,
  age_in_billion NUMERIC (4, 1),
  distance_in_ly INT,
  size_in_ly INT,
  temperature INT,
  is_binary BOOLEAN,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id)
);

INSERT INTO star (
  name, 
  type, 
  age_in_billion, 
  distance_in_ly, 
  size_in_ly, 
  temperature, 
  is_binary, 
  galaxy_id
)
VALUES 
  ('Dorma', 'G-type', 4.6, 0, 1, 5778, FALSE, 1),
  ('Endegar', 'A-type', 0.3, 8.6, 2, 9940, FALSE, 1),
  ('Sria', 'G-type', 6.4, 4.4, 1, 5790, FALSE, 1),
  ('Johann', 'K-type', 6.4, 4.4, 0.8, 5260, FALSE, 1),
  ('Cyril', 'M-type', 0.012, 4.24, 0.2, 3042, TRUE, 1),
  ('Cyrilla', 'M-type', 8.6, 643, 950, 3600, FALSE, 2),
  ('Zeroth', 'B-type', 8.9, 860, 70, 12100, FALSE, 2),
  ('Hadd', 'A-type', 0.455, 25, 2.7, 9602, FALSE, 3),
  ('Rorokan', 'F-type', 0.14, 433.8, 45, 6000, FALSE, 3),
  ('Matamata', 'K-type', 6.7, 65.1, 61.7, 3910, FALSE, 4),
  ('Cyanin', 'M-type', 12, 550, 883, 3500, FALSE, 4),
  ('Oreo', 'K-type', 7.1, 36.7, 25.4, 4286, FALSE, 4),
  ('Dewan', 'A-type', 8.5, 2600, 200, 8500, FALSE, 5);

CREATE TABLE planet (
  planet_id SERIAL UNIQUE PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  type VARCHAR(20) NOT NULL,
  category VARCHAR(30),
  age_in_billion NUMERIC (4, 1),
  distance_in_ly INT,
  size_in_ly INT,
  radius INT,
  is_habitable BOOLEAN,
  star_id INT NOT NULL,
  FOREIGN KEY (star_id) REFERENCES star (star_id)
);

INSERT INTO planet (
  name, 
  type, 
  category, 
  age_in_billion, 
  distance_in_ly, 
  size_in_ly, 
  radius, 
  is_habitable, 
  star_id
)
VALUES 
  ('XE-45-01', 'Terran', 'Rocky', 4.5, 0, 1, 6371, TRUE, 1),
  ('Megadeth', 'Terran', 'Rocky', 4.6, 0, 0.53, 3389, FALSE, 1),
  ('Holowo', 'Terran', 'Rocky', 0.004, 4.24, 1.1, 6000, TRUE, 5),
  ('Kepler-22b', 'Gas Giant', 'Mini-Neptune', 6.1, 620, 2.4, 12441, FALSE, 7),
  ('HD 209458 b', 'Gas Giant', 'Hot Jupiter', 0.65, 153, 1.3, 71492, FALSE, 8),
  ('TrES-2b', 'Gas Giant', 'Hot Jupiter', 0.005, 700, 1.2, 12104, FALSE, 9),
  ('Gliese 581d', 'Terran', 'Super-Earth', 7.1, 20.3, 1.5, 7730, TRUE, 10),
  ('Gliese 581c', 'Terran', 'Rocky', 7.1, 20.3, 1.4, 5390, TRUE, 10),
  ('Mercury', 'Terran', 'Rocky', 4.5, 0, 0.38, 2439, FALSE, 1),
  ('Venus', 'Terran', 'Rocky', 4.5, 0, 0.95, 6052, FALSE, 1),
  ('Jupiter', 'Gas Giant', 'Jovian', 4.5, 0, 11.2, 69911, FALSE, 1),
  ('Saturn', 'Gas Giant', 'Jovian', 4.5, 0, 9.45, 58232, FALSE, 1),
  ('Uranus', 'Ice Giant', 'Jovian', 4.5, 0, 4, 25362, FALSE, 1),
  ('Neptune', 'Ice Giant', 'Jovian', 4.5, 0, 3.88, 24622, FALSE, 1),
  ('HD 189733 b', 'Gas Giant', 'Hot Jupiter', 0.625, 63, 1.1, 81000, FALSE, 7),
  ('WASP-12b', 'Gas Giant', 'Hot Jupiter', 0.0006, 870, 1.8, 185330, FALSE, 7),
  ('Kepler-186f', 'Terran', 'Rocky', 1.1, 492, 1.1, 6371, TRUE, 11),
  ('Kepler-62f', 'Terran', 'Rocky', 0.0136, 1200, 1.4, 7926, TRUE, 12),
  ('Kepler-438b', 'Terran', 'Rocky', 1.2, 470, 1.1, 6060, TRUE, 7),
  ('Gliese 876d', 'Terran', 'Rocky', 0.012, 15, 1.6, 7051, TRUE, 6),
  ('Gliese 876b', 'Terran', 'Rocky', 0.012, 15, 1.9, 11978, TRUE, 6),
  ('TRAPPIST-1e', 'Terran', 'Rocky', 0.002, 39.5, 1.1, 6371, TRUE, 5),
  ('TRAPPIST-1f', 'Terran', 'Rocky', 0.002, 39.5, 1.04, 6031, TRUE, 5),
  ('Kepler-442b', 'Terran', 'Rocky', 2.4, 1200, 1.3, 6927, TRUE, 5),
  ('Kepler-442c', 'Terran', 'Rocky', 2.4, 1200, 1.3, 7919, TRUE, 5),
  ('Kepler-452b', 'Terran', 'Rocky', 1.4, 1400, 1.6, 7874, TRUE, 5),
  ('Kepler-452c', 'Terran', 'Rocky', 1.4, 1400, 1.9, 11220, TRUE, 5);

CREATE TABLE moon (
  moon_id SERIAL UNIQUE PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  age_in_billion NUMERIC (4, 1),
  distance_in_ly INT,
  radius_in_km INT,
  siblings INT,
  spherical BOOLEAN,
  is_habitable BOOLEAN,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planet (planet_id)
);

INSERT INTO moon (
  name, 
  type, 
  age_in_billion, 
  distance_in_ly, 
  radius_in_km, 
  siblings, 
  spherical, 
  is_habitable, 
  planet_id
)
VALUES 
  ('Moon1', 'Rocky', 4.2, 1, 300, 0, TRUE, FALSE, 1),
  ('Moon2', 'Rocky', 4.0, 1, 250, 1, FALSE, FALSE, 1),
  ('Moon3', 'Rocky', 3.9, 1, 350, 2, FALSE, FALSE, 2),
  ('Moon4', 'Rocky', 4.1, 1, 280, 0, TRUE, FALSE, 2),
  ('Moon5', 'Rocky', 4.3, 1, 290, 1, TRUE, FALSE, 3),
  ('Moon6', 'Rocky', 3.8, 1, 320, 0, FALSE, FALSE, 3),
  ('Moon7', 'Rocky', 4.5, 1, 270, 2, TRUE, FALSE, 4),
  ('Moon8', 'Rocky', 4.4, 1, 310, 1, FALSE, FALSE, 4),
  ('Moon9', 'Rocky', 4.2, 1, 330, 0, TRUE, FALSE, 5),
  ('Moon10', 'Rocky', 4.1, 1, 260, 2, FALSE, FALSE, 6),
  ('Moon11', 'Rocky', 3.9, 1, 340, 1, TRUE, FALSE, 7),
  ('Moon12', 'Rocky', 4.0, 1, 290, 0, FALSE, FALSE, 7),
  ('Moon13', 'Rocky', 4.3, 1, 300, 2, FALSE, FALSE, 8),
  ('Moon14', 'Rocky', 4.2, 1, 270, 1, TRUE, FALSE, 9),
  ('Moon15', 'Rocky', 4.4, 1, 320, 0, TRUE, FALSE, 10),
  ('Moon16', 'Rocky', 4.1, 1, 280, 1, FALSE, FALSE, 11),
  ('Moon17', 'Rocky', 3.8, 1, 330, 2, TRUE, FALSE, 11),
  ('Moon18', 'Rocky', 4.5, 1, 290, 0, FALSE, FALSE, 12),
  ('Moon19', 'Rocky', 4.2, 1, 310, 1, TRUE, FALSE, 12),
  ('Moon20', 'Rocky', 4.3, 1, 300, 2, TRUE, FALSE, 13);

CREATE TABLE mobile_factory (
  factory_id SERIAL UNIQUE PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  faction VARCHAR(255),
  age_in_years INT,
  distance_in_km INT,
  size_in_m INT,
  child INT,
  is_production BOOLEAN,
  allow_repopulation BOOLEAN
);

ALTER TABLE mobile_factory
ALTER COLUMN name TYPE VARCHAR(255),
ALTER COLUMN type TYPE VARCHAR(255),
ALTER COLUMN faction TYPE VARCHAR(255);

INSERT INTO mobile_factory (
  name, 
  type, 
  faction, 
  age_in_years, 
  distance_in_km, 
  size_in_m, 
  child, 
  is_production, 
  allow_repopulation
)
VALUES 
  ('NovaTech Factory', 'Assembly Line', 'NovaTech Corporation', 5, 1000, 500, 0, TRUE, FALSE),
  ('IronForge Foundry', 'Forge', 'IronForge Industries', 10, 1500, 800, 2, TRUE, TRUE),
  ('EagleEye Electronics', 'Laboratory', 'EagleEye Research', 3, 800, 300, 1, TRUE, TRUE),
  ('Titanium Techworks', 'Manufacturing Plant', 'Titanium Corporation', 8, 1200, 700, 0, TRUE, FALSE),
  ('Quantum Creations', 'R&D Facility', 'Quantum Innovations', 6, 1100, 600, 1, TRUE, TRUE),
  ('Hyperion Robotics', 'Robotics Factory', 'Hyperion Enterprises', 4, 900, 400, 0, TRUE, FALSE),
  ('Starlight Semiconductors', 'Processing Plant', 'Starlight Technologies', 7, 1300, 750, 1, TRUE, TRUE),
  ('Omega Optics', 'Optical Workshop', 'Omega Corporation', 2, 700, 250, 0, TRUE, FALSE),
  ('Phoenix Plastics', 'Injection Molding Center', 'Phoenix Industries', 9, 1400, 850, 2, TRUE, TRUE),
  ('Apex Aerospace', 'Aerospace Facility', 'Apex Enterprises', 5, 1000, 500, 0, TRUE, FALSE),
  ('Xenon Xperimental', 'Experimental Lab', 'Xenon Research Institute', 3, 800, 300, 1, TRUE, TRUE),
  ('Vortex Vehicles', 'Vehicle Assembly Plant', 'Vortex Automotive', 8, 1200, 700, 0, TRUE, FALSE),
  ('Nebula Nanotech', 'Nanotechnology Lab', 'Nebula Technologies', 6, 1100, 600, 1, TRUE, TRUE),
  ('Galactic Generators', 'Power Plant', 'Galactic Energy Solutions', 4, 900, 400, 0, TRUE, FALSE),
  ('Cosmic Computers', 'Computer Manufacturing Facility', 'Cosmic Technologies', 7, 1300, 750, 1, TRUE, TRUE),
  ('Solar Solutions', 'Solar Panel Factory', 'Solar Systems Inc.', 2, 700, 250, 0, TRUE, FALSE),
  ('Lunar Labs', 'Research Facility', 'Lunar Science Institute', 9, 1400, 850, 2, TRUE, TRUE);

