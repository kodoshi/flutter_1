const express = require("express");
const app = express();
const mongoose = require("mongoose");
require('dotenv').config();
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");

// Mongoose DB connection
mongoose.connect(process.env.DB_CFG, {
  useUnifiedTopology: true,
  useNewUrlParser: true,
});
let db = mongoose.connection;

//Check connection
db.once("open", function () {
  console.log("Connection to MongoDB successful");
});

//Check DB errors
db.on("error", function (err) {
  console.log(err);
});

const createRoutes = require("./routes/create"); //post routing
const userRoutes = require("./routes/user"); //user routing


//middlewares
app.use(morgan("dev"));
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());
app.use(cors());
app.use("/", createRoutes);
app.use("/", userRoutes);

//custom middleware to give cleaner missing auth error
app.use(function (err, req, res, next) {
  if (err.name === "UnauthorizedError") {
    res.status(401).json({ error: "Unauthorized" });
  }
});

app.listen(process.env.SERVER_PORT, () => {
  console.log(`Node server active on port ${process.env.PORT}`);
});
