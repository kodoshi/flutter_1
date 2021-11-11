const mongoose = require("mongoose");

const singleDaySchema = new mongoose.Schema({
  pop: {
    type: Number,
  },

  nature: {
    type: Number,
  },

  instrumental: {
    type: Number,
  },
  
  total_play_time: {
    type: Number,
  },
});

module.exports = mongoose.model("SingleDayStat", singleDaySchema);
