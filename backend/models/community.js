const mongoose = require("mongoose");

const playlistSchema = new mongoose.Schema({
  pop_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

  nature_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],
  
  instrumental_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],
});

module.exports = mongoose.model("Playlist", playlistSchema);
