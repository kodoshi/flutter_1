const User = require("../models/user");
const Playlist = require("../models/playlist");
const Community = require("../models/community");
const SingleDayStat = require("../models/single_day_stat");

/**
 * createUser function
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.createUser = async (req, res) => {
  console.log(req.body);
  const user = new User(req.body);
  await user.save();
  res.status(200).json({ message: "User creation successful", user: user });
};

/**
 * createPlaylist function
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
exports.createPlaylist = async (req, res) => {
  console.log(req.body);
  const playlist = new Playlist(req.body);
  await playlist.save();
  res.status(200).json({ message: "Playlist creation successful", playlist: playlist });
};

/**
 * createCommunity function
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
 exports.createCommunity = async (req, res) => {
  console.log(req.body);
  const community = new Community(req.body);
  await community.save();
  res.status(200).json({ message: "community creation successful", community: community });
};

/**
 * createSingleDayStat function
 *
 * @param {object} req HTTP request from express
 * @param {object} res HTTP response from express
 */
 exports.createSingleDayStat = async (req, res) => {
  console.log(req.body);
  const stat = new SingleDayStat(req.body);
  await stat.save();
  res.status(200).json({ message: "stat creation successful", stat: stat });
};