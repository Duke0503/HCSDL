const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/product.controller");

router.get("/", controller.index);

router.get("/search/:searchString/:id_category/:min_price/:max_price/:searchType", controller.filter);

router.get("/search/:searchString", controller.filter);

module.exports = router;