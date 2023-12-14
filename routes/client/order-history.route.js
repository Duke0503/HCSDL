const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/order-history.controller");

router.get("/:id", controller.index);

router.get("/:id/orders", controller.index);

router.get("/:id/bills", controller.bills);

module.exports = router;