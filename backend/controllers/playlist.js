const Playlist = require("../models/playlist");
const Community = require("../models/community");

/**
 * getAllPlaylists function, returns Playlists array
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
 * getCommunityPlaylists function, returns Playlists array organized in categories
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
