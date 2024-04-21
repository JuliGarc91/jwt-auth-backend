// DEPENDENCIES
const cors = require("cors");
const express = require("express");
// const cron = require("node-cron");
const cookieParser = require("cookie-parser");

// controllers
const authController = require("./controllers/authController");
const usersController = require("./controllers/usersController");
// const careLogsController = require("./controllers/careLogsController")

// CONFIGURATION
const app = express();

// cron job to attempt to prevent render from sleeping
// cron.schedule("*/5 * * * *", () => {
//   const currentTime = new Date().toLocaleString("en-US", {
//     timeZone: "America/New_York",
//   });
//   console.log(`Running a task every 5 minutes. Current time: ${currentTime}`);
// });

// MIDDLEWARE change origin to your frontend netlify address for deployment
app.use(
  cors({
    origin: [
      "http://localhost:3000",
      "https://gardennook.netlify.app/"
    ]
  })
);

app.use(express.json());
app.use(cookieParser());

app.use("/api/auth", authController);
app.use("/api/users", usersController);
// app.use("/api/carelogs", careLogsController);

// ROUTES
app.get("/", (_req, res) => {
  res.send("Welcome to JWT Auth!");
});

// 404 PAGE
app.get("*", (_req, res) => {
  res.status(404).send("Page not found");
});

// EXPORT
module.exports = app;
