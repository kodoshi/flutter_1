const express = require("express");
const router = express.Router();
const userController = require("../controllers/user");
const authController = require("../controllers/auth");

/**
 * routes getting 'filtered' through middlewares
 */
router.put(
  "/user/follow",
  authController.requireSignin,
  userController.addFollowing,
  userController.addFollower
);

router.put(
  "/user/unfollow",
  authController.requireSignin,
  userController.removeFollowing,
  userController.removeFollower
);

router.get("/users", userController.allUsers);

router.get(
  "/user/:userId",
  authController.requireSignin,
  userController.getUser
);

router.put(
  "/user/:userId",
  authController.requireSignin,
  userController.hasAuthorization,
  userController.updateUser
);

router.delete(
  "/user/:userId",
  authController.requireSignin,
  userController.hasAuthorization,
  userController.deleteUser
);

router.get("/user/photo/:userId", userController.userPhoto);

router.get(
  "/user/tofollow/:userId",
  authController.requireSignin,
  userController.findPeople
); // who to follow

//userById() with be executed in routes that have :userId
router.param("userId", userController.userById);

module.exports = router;
