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
// maybe will use to create a view to toggle edit form
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

const addPlantLog = async (plantLog, plantId, plantName) => {
  try {
    const query = `
      INSERT INTO careLogs (plantId, plantName, careDate, description, imageUrl, heightInInches, isPropagation, needsRepotting, sunlightHoursPerDay, soilMoisturePercentDaily, mLWaterAddedToday)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`;
    const newPlantLog = await db.one(query, [
      plantId,
      plantName,
      plantLog.caredate,
      plantLog.description,
      plantLog.imageurl,
      plantLog.heightininches,
      plantLog.ispropagation,
      plantLog.needsrepotting,
      plantLog.sunlighthoursperday,
      plantLog.soilmoisturepercentdaily,
      plantLog.mlwateraddedtoday
    ]);
    return newPlantLog;
  } catch (error) {
    console.error("Error adding plant care log:", error);
    throw error;
  }
};

const editPlantLog = async (id, editedLog) => {
  try {
    const query = `
      UPDATE careLogs
      SET plantId = $1, plantName = $2, careDate = $3, description = $4, 
          imageUrl = $5, heightInInches = $6, isPropagation = $7, 
          needsRepotting = $8, 
          sunlightHoursPerDay = $9, soilMoisturePercentDaily = $10, 
          mLWaterAddedToday = $11
      WHERE id = $12
      RETURNING *;`;
    const editedPlantLog = await db.one(query, [
      editedLog.plantid, editedLog.plantname, editedLog.caredate, 
      editedLog.description, editedLog.imageurl, editedLog.heightininches, 
      editedLog.ispropagation, editedLog.needsrepotting, editedLog.sunlighthoursperday, 
      editedLog.soilmoisturepercentdaily,
      editedLog.mlwateraddedtoday,
      id
    ]);
    return editedPlantLog;
  } catch (error) {
    console.error("Error editing plant log:", error);
    throw new Error("Error editing plant log: " + error.message);
  }
};

module.exports = {
    getAllPlantLogs,
    getOnePlantLog,
    deletePlantLog,
    addPlantLog,
    editPlantLog
}