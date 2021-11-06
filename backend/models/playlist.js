const mongoose = require("mongoose");

const playlistSchema = new mongoose.Schema({
  id: {
    type: Number,
    default: 0,
  },

  description: {
    type: String,
    default: "Lorem Ipsum",
  },

  image: {
    data: Buffer, //binary data
    contentType: String, //will hold the format of the picture uploaded
  },

  songs: [{ type: mongoose.Schema.ObjectId, ref: "SingleSong" }],
});

module.exports = mongoose.model("Playlist", playlistSchema);
