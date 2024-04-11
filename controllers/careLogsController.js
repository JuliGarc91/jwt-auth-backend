const express = require("express");
const careLogs = express.Router();
const { getAllPlantLogs } = require("../queries/plantLogs");


careLogs.get('/', async (req, res) => {

});

module.exports = careLogs;