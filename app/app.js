// express
const express = require("express");
const app = express();
app.use(express.json());

// middleware
const path = require("path");

// view engine : ejs
const ejs = require("ejs");
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Routes
const index_router = require("./routes/index.route")
app.use("/", index_router)
// static files
app.use(express.static(path.join(__dirname, "views")));

module.exports = app;
