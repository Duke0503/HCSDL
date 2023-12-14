const express = require("express");
const router = express.Router();

const controller = require("../../controllers/storeowner/discount.controller");

router.get("/", controller.index);

router.post("/create", controller.addDiscount);

module.exports = router;