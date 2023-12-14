const express = require("express");
const router = express.Router();

const controller = require("../../controllers/storeowner/order.controller");

router.get("/:storeID", controller.index);
router.get("/:storeID/waiting", controller.waitingOrder);
router.get("/:storeID/confirmed", controller.confirmedOrder);
router.post("/:storeID/confirmOne", controller.confirmOne);
router.get("/:storeID/confirmAll", controller.confirmAllOrders);

module.exports = router;    
