const mongoose = require("mongoose");

const playlistSchema = new mongoose.Schema({
  index: {
    type: Number,
    default: 0,
  },

  description: {
    type: String,
    default: "Lorem Ipsum",
  },

  category: {
    type: String,
    default: "Nature",
  },

  image: {
    type: String,
    default: "street_japan_night.jpg",
  },

  songs: [
    {
      type: String,
      default: "lofi.mp3",
    },
  ],

  meta: {
    title: { type: String, default: "Lo-Fi" },
    artist: { type: String, default: "Various Artists" },
    album: { type: String, default: "Instrumentals" },
  },
});

module.exports = mongoose.model("Playlist", playlistSchema);
