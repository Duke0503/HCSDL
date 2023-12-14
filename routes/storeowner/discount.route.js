const express = require("express");
const router = express.Router();

const controller = require("../../controllers/storeowner/discount.controller");

router.get("/:storeID", controller.index);

module.exports = router;