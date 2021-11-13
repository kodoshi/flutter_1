const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    default: "John",
  },

  surname: {
    type: String,
    default: "Smith",
  },

  email: {
    type: String,
    default: "test@email.com",
  },

  image: {
    type: String, //base64 encoded
  },

  active_tiles: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

  stats: [
    {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
  ],
});

module.exports = mongoose.model("User", userSchema);
