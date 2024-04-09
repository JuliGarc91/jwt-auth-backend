const express = require("express");
const { getAllUserPlants } = require("../queries/userPlants");
const userPlants = express.Router();

// userPlants.get("/", async (req, res) => {
//     const plant = await getAllUserPlants();
//     if (plant[0]) res.json({ plant });
// });

userPlants.get("/", async (req, res) => {
    const { userId } = req.params;

    try {
        const plants = await getAllUserPlants(userId);
        if (plants && plants.length > 0) {
            res.json({ plants });
        } else {
            res.status(404).json({ message: "No plants found for the user" });
        }
    } catch (error) {
        console.error("Error retrieving plants:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});


module.exports = userPlants;