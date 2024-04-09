const express = require("express");
const { getAllUsers } = require("../queries/users.js");
const users = express.Router();

users.get("/", async (req, res) => {
    const user = await getAllUsers();
    if (user[0]) res.json({ users: user });
});

module.exports = users;