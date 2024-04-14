const db = require("../db/dbConfig");

/*
CREATE TABLE careLogs (
    id SERIAL PRIMARY KEY,
    plantId INTEGER NOT NULL,
    careDate TEXT,
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
*/

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

const deletePlantLog = async (id) => {
  try {
    const query = `
      DELETE FROM careLogs
      WHERE id = $1
      RETURNING *;`;
    const deletedCareLogData=await db.one(query,[id]);
    return deletedCareLogData;
  } catch (error) {
    console.error("Error deleting plant care log:", error);
    throw error;
  }
}


module.exports = {
    getAllPlantLogs,
    getOnePlantLog,
    deletePlantLog
}