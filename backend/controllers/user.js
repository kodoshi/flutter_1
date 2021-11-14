const User = require("../models/user");
const fs = require("fs");
const SingleDayStat = require("../models/single_day_stat");

//saves us headaches by enabling the usage of findByIdAndUpdate
const myId = "618bb543fafdd93b9789d5c9";

/**
 * getAllActiveTiles function, returns Playlists array, used for the Home Screen in app
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} array of 'playlist' objects
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
 * addActiveTile function, used in Specific Playlist screen when adding a tile to Home Screen
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} success message
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
    return res.status(200).json({ message: "Tile was added" });
    //return res.status(200).json(user);
  });
};

/**
 * removeActiveTile function, removes a 'playlist' object from the active tiles array
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} success message
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
    return res.status(200).json({ message: "Tile was removed" });
  });
};

/**
 * getPersonalInfo function, returns user information
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} user object with only personal fields
 */
exports.getPersonalInfo = (req, res) => {
  const info = User.findById(myId)
    .select("name surname email image")
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
 * getStats function, return user playtime statistics
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} user object with only stats fields
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
      if(stats.stats.length==0)
      {
        return res.status(300).json({ message: "Stats array empty" });
      }
      return res.status(200).json(stats);
    });
};

/**
 * updateStats function, udates user playtime statistics based on category and day
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} success message
 */
exports.updateStats = async (req, res) => {
  const user = await User.findById(myId).populate("stats");

  user.stats.forEach(async function (stat) {
    if (stat.day == req.body.day) {
      let stat_object = await SingleDayStat.findById(stat._id);

      let old_playtime = stat_object.total_playtime;
      stat_object.total_playtime += parseInt(req.body.playtime);
      let coefficient = old_playtime / stat_object.total_playtime;

      if (req.body.category == "instrumental") {
        stat_object.nature.percentage *= coefficient;
        stat_object.pop.percentage *= coefficient;

        stat_object.instrumental.playtime += parseInt(req.body.playtime);
        stat_object.instrumental.percentage =
          (stat_object.instrumental.playtime * 100) /
          stat_object.total_playtime;
      } else if (req.body.category == "nature") {
        stat_object.instrumental.percentage *= coefficient;
        stat_object.pop.percentage *= coefficient;

        stat_object.nature.playtime += parseInt(req.body.playtime);
        stat_object.nature.percentage =
          (stat_object.nature.playtime * 100) / stat_object.total_playtime;
      } else if (req.body.category == "pop") {
        stat_object.instrumental.percentage *= coefficient;
        stat_object.nature.percentage *= coefficient;

        stat_object.pop.playtime += parseInt(req.body.playtime);
        stat_object.pop.percentage =
          (stat_object.pop.playtime * 100) / stat_object.total_playtime;
      }

      const result = stat_object.save((err) => {
        if (err) {
          console.log(err);
        }
      });
    }
  });
  return res.status(200).json({ message: "Stats updated" });
};

/**
 * updatePersonalInfo function, updates user personal information, doesnt hold picture field
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} success message
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
 * uploadProfilePicture function, updates user picture field only
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 * @returns {json} success message
 */
exports.uploadProfilePicture = async (req, res) => {
  const user = await User.findByIdAndUpdate(
    myId,
    {
      image: req.body.image, //base64 string
    },
    { new: true }
  ).exec((err, result) => {
    if (err) {
      return res.status(400).json({ error: err });
    } else {
      res
        .status(200)
        .json({ message: "image update successful", user: result });
    }
  });
};

/**
 * tileById function, inserts tileId query param into request object
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
