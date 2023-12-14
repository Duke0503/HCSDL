const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/home.controller");

router.get("/", controller.users);

router.post("/login", controller.loginPost);

router.post("/register", controller.registerPost);

module.exports = router