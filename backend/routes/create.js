const express = require("express");
const router = express.Router();
const createController = require("../controllers/create");

/**
 * The routes below are not used by the mobile app, but just as an entry point to db objects
 */
router.post("/create/user", createController.createUser);
router.post("/create/playlist", createController.createPlaylist);
router.post("/create/community", createController.createCommunity);
router.post("/create/stat", createController.createSingleDayStat);

module.exports = router;