-- db/schema.sql
DROP DATABASE IF EXISTS jwt_auth;

CREATE DATABASE jwt_auth;


\c jwt_auth

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS plants CASCADE;

CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  userId INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  species VARCHAR(255),
  color VARCHAR(255),
  plantType VARCHAR(255),
  isFloweringPlant BOOLEAN,
  soilType VARCHAR(255),
  careInstructions TEXT,
  imageUrl TEXT,
  FOREIGN KEY (userId) REFERENCES users(id)
);

DROP TABLE IF EXISTS careLog CASCADE;


CREATE TABLE careLogs (
  id SERIAL PRIMARY KEY,
  plantId INTEGER NOT NULL,
  plantName VARCHAR(255) NOT NULL,
  careDate TEXT,
  description TEXT,
  imageUrl TEXT,
  heightInInches INTEGER,
  soilIsMoist BOOLEAN,
  needsWaterToday BOOLEAN,
  pottedPlant BOOLEAN,
  isPropagation BOOLEAN,
  needsRepotting BOOLEAN,
  rootsHealthy BOOLEAN,
  wateringFrequencyPerWeek INTEGER,
  sunlightHoursPerDay INTEGER CHECK (sunlightHoursPerDay >= 1 AND sunlightHoursPerDay <= 24),
  soilMoisturePercentDaily INTEGER CHECK (soilMoisturePercentDaily >= 0 AND soilMoisturePercentDaily <= 100),
  mLofWaterPerWeek INTEGER,
  FOREIGN KEY (plantId) REFERENCES plants(id)
);