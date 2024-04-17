const db = require("../db/dbConfig");

const getAllPlantLogs = async (plantId) => {
    try {
      const query = "SELECT * FROM careLogs WHERE plantId=$1;";
  
      const careLogs = await db.any(query, [plantId]);
  
      return careLogs;
    } catch (error) {
      console.error("Error finding plant care logs:", error);
      throw error;
    }
};

// probably not needed because chart view includes all the carelogs
const getOnePlantLog = async (plantId, id) => {
  try {
    const query = await db.oneOrNone(
      `SELECT careLogs.* 
       FROM careLogs 
       INNER JOIN plants ON careLogs.plantId = plants.id 
       WHERE plants.id=$1 AND careLogs.id=$2;`,
      [plantId, id]
    );
    return query;
  } catch (error) {
    console.error("Error finding plant care log:", error);
    throw error;
  }
};


const deletePlantLog = async (plantId, id) => {
  try {
    const query = `
      DELETE FROM careLogs
      WHERE id = $1
      AND plantId = $2
      RETURNING *;`;
    const deletedCareLogData = await db.one (query, [id, plantId]);
    return deletedCareLogData;
  } catch (error) {
    console.error("Error deleting plant care log:", error);
    throw error;
  }
};

// make a create and edit

/*
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
*/

const addPlantLog = async (plantLog, plantId, plantName) => {
  try {
    const query = `
      INSERT INTO careLogs (plantId, plantName, careDate, description, imageUrl, heightInInches, isPropagation, needsRepotting, wateringFrequencyPerWeek, sunlightHoursPerDay, soilMoisturePercentDaily, mLofWaterPerWeek, mLWaterAddedToday)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *`;
    const newPlantLog = await db.one(query, [
      plantId,
      plantName,
      plantLog.careDate,
      plantLog.description,
      plantLog.imageUrl,
      plantLog.heightInInches,
      plantLog.isPropagation,
      plantLog.needsRepotting,
      plantLog.wateringFrequencyPerWeek,
      plantLog.sunlightHoursPerDay,
      plantLog.soilMoisturePercentDaily,
      plantLog.mLofWaterPerWeek,
      plantLog.mLWaterAddedToday
    ]);
    return newPlantLog;
  } catch (error) {
    console.error("Error adding plant care log:", error);
    throw error;
  }
};


module.exports = {
    getAllPlantLogs,
    getOnePlantLog,
    deletePlantLog,
    addPlantLog
}