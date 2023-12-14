const express = require("express");
const router = express.Router();

const controller = require("../../controllers/storeowner/product.controller");

router.get("/:storeID", controller.index);
router.get("/:storeID/:productID", controller.productDetail);
router.post("/:storeID/create", controller.addProduct);

router.post("/modify", controller.modifyProduct);

module.exports = router;