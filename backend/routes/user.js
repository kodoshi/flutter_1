const express = require("express");
const router = express.Router();
const userController = require("../controllers/user");

/**
 * Tile routes
 */
router.get("/user/tiles", userController.getAllActiveTiles);
router.post("/user/tiles/:tileId", userController.addActiveTile);
router.delete("/user/tiles/:tileId", userController.removeActiveTile);

/**
 * Personal user routes
 */
router.get("/user/stats", userController.getStats);
router.put("/user/stats", userController.updateStats);

router.get("/user/personal", userController.getPersonalInfo);
router.put("/user/personal", userController.updatePersonalInfo);

router.post("/user/picture", userController.uploadProfilePicture);

router.param("tileId", userController.tileById);
module.exports = router;
