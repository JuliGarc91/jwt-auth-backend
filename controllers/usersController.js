const express = require("express");
const { getAllUsers, findUserById } = require("../queries/users.js");
const { getAllUserPlants, getOneUserPlant, addUserPlant, editUserPlant, deleteUserPlant } = require("../queries/userPlants");
const { getAllPlantLogs } = require("../queries/plantLogs.js");
const users = express.Router();

users.get("/", async (req, res) => {
    try{
      const user = await getAllUsers();
    if (user[0]) res.json({ users: user });
  } catch (error) {
    console.error("Error finding all users", error);
    res.status(500).json({ message: "Internal server error"})}
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
      console.error("Error fetching user's plants:", error);
      res.status(500).json({ error: "Internal server error" });
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
    console.error("Error fetching user's plant:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// carelogs
// show all carelogs for selected plant added by logged in user
users.get("/:userId/userPlants/:plantId/carelogs", async (req, res) => {
  try {
    const { userId, plantId } = req.params;
    const plant = await getOneUserPlant(userId, plantId);
    if (plant) {
      const careLogs = await getAllPlantLogs(plantId);
      res.status(200).json({ plant, careLogs });
    } else {
      res.status(404).json({ message: "Plant not found" });
    }
  } catch (error) {
    console.error("Error fetching user's plant and care logs:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// add new plant as logged in user
users.post("/:userId/userPlants", async(req, res) => {
  const { userId } = req.params;
  try {
    const plant = await addUserPlant(...[req.body], userId);
    res.json({ plant });
  } catch (error) {
    console.error("Error adding user's plant:", error)
    res.status(500).json({ error: "Internal server error" });
  }
});

// edit existing plants of user (when logged in)
users.put("/:userId/userPlants/:id", async(req, res) => {
  const { userId, id } = req.params;
  try {
    const editedUserPlant = await editUserPlant(
      id,
      ...[req.body],
      userId
    );
    res.json({ userPlant: editedUserPlant});
  } catch (error) {
    console.error("Error editing user's plant:", error)
    res.status(500).json({ error: "Internal server error" });
  }
});

// delete user's plant from profile (dashboard)
users.delete("/:userId/userPlants/:id", async (req, res) => {
  const { userId, id } = req.params;
  try {
    await deleteUserPlant(id, userId);
    res.json({ message: "User's plant deleted successfully" });
  } catch (error) {
    console.error("Error deleting user's plant:", error)
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = users;