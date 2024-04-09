const db = require("../db/dbConfig");

const getAllUserPlants = async () => {
    try {
      const query = "SELECT * FROM plants";
  
      const plants = await db.any(query);
  
      return user;
    } catch (error) {
      console.error("Error finding plants:", error);
      throw error;
    }
};

module.exports = {
    getAllUserPlants
};