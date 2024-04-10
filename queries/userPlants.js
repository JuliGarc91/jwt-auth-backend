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
      `SELECT plants.*, users.username FROM plants JOIN users ON plants.userId = users.id WHERE plants.userId=$1 AND plants.id=$2`,
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
      INSERT INTO plants (userId, name, species, careInstructions, imageUrl)
      VALUES ($1, $2, $3, $4, $5) RETURNING *;`;
    const newPlant= await db.one(query, [
      plant.userid, plant.name, plant.species, plant.careinstructions, plant.imageurl,
    ]);
    return newPlant;
  } catch (error) {
    console.error("Error adding new plant:", error);
    throw error;
  }
};

module.exports = {
    getAllUserPlants,
    getOneUserPlant,
    addUserPlant
};