const db = require("../db/dbConfig");

/*
CREATE TABLE careLogs (
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
*/

const getAllPlantLogs = async (plantId) => {
    try {
      const query = "SELECT * FROM careLogs WHERE plantId=$1;";
  
      const careLogs = await db.any(query, [plantId]);
  
      return careLogs;
    } catch (error) {
      console.error("Error finding careLogs:", error);
      throw error;
    }
};

module.exports = {
    getAllPlantLogs
}