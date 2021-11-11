const User = require("../models/user");

//saves us headaches by enabling the usage of findByIdAndUpdate
const myId = "618bb543fafdd93b9789d5c9"; 

/**
 * getAllActiveTiles function, returns Playlists array ,queries and selections to/from db are made here with standart MongoDB methods, json response is being returned
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.getAllActiveTiles = (req, res) => {
  const tiles = User.findById(myId)
    .populate("active_tiles")
    .select("active_tiles")
    .exec((err, tiles) => {
      if (err) {
        return res.status(400).json({
          error: err,
        });
      }
      return res.status(200).json(tiles);
    });
};

/**
 * addActiveTile function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.addActiveTile = (req, res) => {
  console.log(req.body);
  const tiles = User.findByIdAndUpdate(
    myId,
    {
      $push: { active_tiles: req.tileId },
    },
    { new: true }
  ).exec((err, user) => {
    if (err) {
      return res.status(400).json({
        error: err,
      });
    }
    return res.json({ message: "Tile was added" });
    //return res.status(200).json(user);
  });
};

/**
 * removeActiveTile function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.removeActiveTile = (req, res) => {
  const tiles = User.findByIdAndUpdate(myId, {
    $pull: { active_tiles: req.tileId },
  }).exec((err, user) => {
    if (err) {
      return res.status(400).json({
        error: err,
      });
    }
    //return res.status(200).json(user);
    return res.json({ message: "Tile was removed" });
  });
};

/**
 * getPersonalInfo function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.getPersonalInfo = (req, res) => {
  const info = User.findById(myId)
    .select("name surname email") //picture
    .exec((err, info) => {
      if (err) {
        return res.status(400).json({
          error: err,
        });
      }
      return res.status(200).json(info);
    });
};

/**
 * getStats function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.getStats = (req, res) => {
  const stats = User.findById(myId)
    .populate("stats") //picture
    .select("stats") //picture
    .exec((err, stats) => {
      if (err) {
        return res.status(400).json({
          error: err,
        });
      }
      return res.status(200).json(stats);
    });
};

/**
 * updatePersonalInfo function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.updatePersonalInfo = async (req, res) => {
  const user = await User.findByIdAndUpdate(
    myId,
    {
      name: req.body.name,
      surname: req.body.surname,
      email: req.body.email,
    },
    { new: true }
  ).exec((err, result) => {
    if (err) {
      return res.status(400).json({ error: err });
    } else {
      res.status(200).json({ message: "info update successful", user: result });
    }
  });
};

/**
 * tileById function, helper func
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @param {*} next allows the method to go to the next middleware
 * @param {string} id holds the ObjectID of the tile to be handled
 */
exports.tileById = (req, res, next, id) => {
  req.tileId = id;
  next();
};
