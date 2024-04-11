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
  name VARCHAR(255),
  species VARCHAR(255),
  careInstructions TEXT,
  imageUrl TEXT,
  FOREIGN KEY (userId) REFERENCES users(id)
);

DROP TABLE IF EXISTS careLog CASCADE;

CREATE TABLE careLog (
  id SERIAL PRIMARY KEY,
  plantId INTEGER NOT NULL,
  careDate TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  description TEXT,
  imageUrl TEXT,
  soilIsMoist BOOLEAN,
  needsWaterToday BOOLEAN,
  pottedPlant BOOLEAN,
  needsRepotting BOOLEAN,
  rootsHealthy BOOLEAN,
  wateringFrequencyPerWeek INTEGER,
  sunlightHoursPerDay INTEGER,
  FOREIGN KEY (plantId) REFERENCES plants(id)
);
