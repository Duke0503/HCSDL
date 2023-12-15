const express = require("express");
const router = express.Router();

const controller = require("../../controllers/client/order-history.controller");

router.get("/:id", controller.index);

router.get("/bills/:id", controller.getBill);

router.get("/prodPurchased/:id", controller.purchasedProd);

// router.get("/:id/bills", controller.tmp);

router.post("/addComment", controller.addComment);

router.patch("/editComment", controller.editComment);

router.delete("/deleteComment", controller.delComment);

module.exports = router;