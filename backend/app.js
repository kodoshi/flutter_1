const express = require("express");
const app = express();
const mongoose = require("mongoose");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const expressValidator = require("express-validator");
const cors = require("cors");

process.env.PORT = 4242;
process.env.NODE_ENV = "development";

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

const postRoutes = require("./routes/post"); //post routing
const authRoutes = require("./routes/auth"); //authentication routing
const userRoutes = require("./routes/user"); //user routing
//app.use("/api", express.static("docs/api_docs.json")); //API Routes Documentation
//app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(openApiDocumentation)); //API Routes Documentation v2

//middlewares
app.use(morgan("dev"));
app.use(bodyParser.json()); //express is depress-ion
app.use(cookieParser());
app.use(expressValidator());
app.use(cors());
app.use("/", postRoutes);
app.use("/", authRoutes);
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
