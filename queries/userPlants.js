const db = require("../db/dbConfig");

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

module.exports = {
    getAllUserPlants
};