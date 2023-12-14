const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/cart.controller");

router.get("/:id", controller.index);

router.post("/add", controller.addCart);

module.exports = router;