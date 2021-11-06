const mongoose = require("mongoose");
//const uuidv1 = require("uuid/v1");  deprecated?
const { v1: uuidv1 } = require("uuid");
const crypto = require("crypto");

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
    data: Buffer,
    contentType: String,
  },

  active_tiles: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

  stats: {
    monday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    tuesday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    wednesday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    thursday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    friday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    saturday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
    sunday: {
      type: mongoose.Schema.ObjectId,
      ref: "SingleDayStat",
    },
  },
});

module.exports = mongoose.model("User", userSchema);
