const db = require("../db/dbConfig");

// to get all plants for logged in user
const getAllUserPlants = async (userId) => {
    try {
      const query = "SELECT * FROM plants WHERE userId=$1;";
  
      const plants = await db.any(query, [userId]);
  
      return plants;
    } catch (error) {
      console.error("Error finding plants:", error);
      throw error;
    }
};

// to get one plant for logged in user
const getOneUserPlant = async (userId, id) => {
  try {
    const query = await db.oneOrNone(
      `SELECT plants.*, users.username FROM plants JOIN users ON plants.userId = users.id WHERE plants.userId=$1 AND plants.id=$2;`,
      [userId, id]
    );
    return query;
  } catch (error) {
    return `error: ${error}`;
  }
};
/*
INSERT INTO plants (userId, name, species, careInstructions, imageUrl)
VALUES 
(1, 'Spider Plant', 'Chlorophytum comosum', 'Keep soil evenly moist but not waterlogged. Prefers indirect sunlight.', 'img_url');
*/
const addUserPlant = async (plant) => {
  try {
    const query = `
      INSERT INTO plants (userId, name, species, color,
        planttype, isfloweringplant, soiltype,  careInstructions, imageUrl)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *;`;
    const newPlant= await db.one(query, [
      plant.userid, 
      plant.name, 
      plant.species,
      plant.color,
      plant.planttype,
      plant.isfloweringplant,
      plant.soiltype, 
      plant.careinstructions, 
      plant.imageurl,
    ]);
    return newPlant;
  } catch (error) {
    console.error("Error adding new plant:", error);
    throw error;
  }
};

const editUserPlant = async (plantId, editedPlant) => {
  try {
    const query = `
      UPDATE plants
      SET userId = $1, name = $2, species = $3, color = $4, plantType = $5, isFloweringPlant = $6,  soilType =$7, careInstructions = $8, imageUrl = $9
      WHERE id = $10
      RETURNING *;`;
    const editedUserPlant = await db.one(query, [
      editedPlant.userid,
      editedPlant.name, 
      editedPlant.species,
      editedPlant.color,
      editedPlant.planttype,
      editedPlant.isfloweringplant,
      editedPlant.soiltype, 
      editedPlant.careinstructions, 
      editedPlant.imageurl, 
      plantId
    ]);
    return editedUserPlant;
  } catch (error) {
    console.error("Error editing plant:", error);
    throw error;
  }
}

const deleteUserPlant = async (plantId) => {
  try {
    await db.none('DELETE FROM carelogs WHERE plantId = $1', [plantId]);
    const query = `
      DELETE FROM plants
      WHERE id = $1
      RETURNING *;`;
    const deletedUserPlantData = await db.one(query, [plantId]);
    return deletedUserPlantData
  } catch (error) {
    console.error("Error deleting plant:", error);
    throw error;
  }
}

module.exports = {
    getAllUserPlants,
    getOneUserPlant,
    addUserPlant,
    editUserPlant,
    deleteUserPlant
};