const express = require("express");
const router = express.Router();
const playlistController = require("../controllers/playlist");

/**
 * Playlist routes
 */
router.get("/playlists", playlistController.getAllPlaylists);
router.get("/playlists/community", playlistController.getCommunityPlaylists);

module.exports = router;