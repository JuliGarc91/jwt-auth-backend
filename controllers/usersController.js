const express = require("express");
const { getAllUsers, findUserById } = require("../queries/users.js");
const { getAllUserPlants, getOneUserPlant } = require("../queries/userPlants");
const users = express.Router();

users.get("/", async (req, res) => {
    const user = await getAllUsers();
    if (user[0]) res.json({ users: user });
});

users.get("/:id", async (req, res) => {
    try {
    const { id } = req.params;

    const user = await findUserById(id);

    if (user) {
      res.status(200).json({ user });
    } else {
      res.status(404).json({ message: "user not found" });
    }
  } catch (error) {
    console.error("Error finding user by id:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});
// one user can have many plants
// shows all plants for one user
users.get("/:userId/userPlants", async (req, res) => {
    try {
      const { userId } = req.params;
      const userPlants = await getAllUserPlants( userId );
      res.json({ userPlants });
    } catch (error) {
      return `route error: ${error}`;
    }
});

users.get("/:userId/userPlants/:id", async (req, res) => {
  try {
    const { userId, id } = req.params;
    const plant = await getOneUserPlant(userId, id);
    if (plant) {
      res.status(200).json({ plant });
    } else {
      res.status(404).json({ message: "plant not found" });
    }
  } catch (error) {
    console.error("Error fetching plant:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = users;