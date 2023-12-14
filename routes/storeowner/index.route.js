const systemConfig = require("../../config/system");

const productRoutes = require("./product.route");
// const revenueRoutes = require("./revenue.route");
// const discountRoutes = require("./discount.route");
const orderRoutes = require("./order.route");

module.exports = (app) => {
  const PATH_STORE = '/store';

  app.use(PATH_STORE + "/product", productRoutes);
  // app.use(PATH_STORE + "/revenue", revenueRoutes);
  // app.use(PATH_STORE + "/discount", discountRoutes);
  app.use(PATH_STORE + "/order", orderRoutes);
};