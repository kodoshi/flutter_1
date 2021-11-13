const mongoose = require("mongoose");

const singleDaySchema = new mongoose.Schema({
  day: {
    type: String,
    default: "Monday",
  },

  pop: {
    percentage: { type: Number, default: 0, },
    playtime: { type: Number, default: 0, },
  },

  nature: {
    percentage: { type: Number, default: 0, },
    playtime: { type: Number, default: 0, },
  },

  instrumental: {
    percentage: { type: Number, default: 0, },
    playtime: { type: Number, default: 0, },
  },

  total_playtime: {
    type: Number,
    default: 0,
  },
});

module.exports = mongoose.model("SingleDayStat", singleDaySchema);
