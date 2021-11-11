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
  
  category:{
    type: String,
    default: "Nature",
  },

  image: {
    data: Buffer, //binary data
    contentType: String, //will hold the format of the picture uploaded
  },

  songs: [
    {
      type: String,
      default: "lofi.mp3",
    },
  ],
});

module.exports = mongoose.model("Playlist", playlistSchema);
