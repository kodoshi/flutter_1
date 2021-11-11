const User = require("../models/user");
const Playlist = require("../models/playlist");
const Community = require("../models/community");
const SingleDayStat = require("../models/single_day_stat");

/**
 * getAllPlaylists function, returns Playlists array ,queries and selections to/from db are made here with standart MongoDB methods, json response is being returned
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.getAllPlaylists = (req, res) => {
  const playlists = Playlist.find().exec((err, result) => {
    if (err) {
      return res.status(400).json({
        error: err,
      });
    }
    return res.status(200).json(result);
  });
};

/**
 * getCommunityPlaylists function,
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.getCommunityPlaylists = (req, res) => {
  const myId = "618bc598d0f8f553e44faaf5";
  const playlists = Community.findById(myId)
    .populate("pop_playlists")
    .populate("nature_playlists")
    .populate("instrumental_playlists")
    .exec((err, result) => {
      if (err) {
        return res.status(400).json({
          error: err,
        });
      }
      return res.status(200).json(result);
    });
};
