const express = require("express");
const router = express.Router();

const controller = require("../../controllers/admin/account.controller");

router.get("/", controller.index);

router.get("/search/:name", controller.searchAccount);

router.get("/search/type/:ty", controller.searchType);

router.get("/search/:name/:ty", controller.search);

router.delete("/deleteUser/:id", controller.tmpDelete);

module.exports = router;
