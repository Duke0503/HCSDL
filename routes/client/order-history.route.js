const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/order-history.controller");

router.get("/:id", controller.index);

module.exports = router;