const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/product.controller");

router.get("/", controller.index);

router.get("/detail/:id", controller.detail);

router.get("/search/:searchString?/:id_category?/:min_price?/:max_price?/:searchType?", controller.filter);

module.exports = router;    