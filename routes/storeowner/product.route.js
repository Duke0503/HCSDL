const express = require("express");
const router = express.Router();

const controller = require("../../controllers/storeowner/product.controller");

router.get("/:storeID", controller.index);
router.get("/:storeID/:productID", controller.productDetail);
router.get("/:storeID/create", controller.addProduct);

module.exports = router;