const mongoose = require("mongoose");

const songSchema = new mongoose.Schema({
  id: {
    type: Number,
    default: 0,
  },
  content: {
    type: String,
    default: "lofi.mp3",
  },
});

module.exports = mongoose.model("SingleSong", songSchema);
