const homeRoutes = require("./home.route");
const productRoutes = require("./product.route");
const cartRoutes = require("./cart.route");
const orderRoutes = require("./order-history.route")

module.exports = (app) => {
  app.use("/", homeRoutes);

  app.use("/products", productRoutes);

  app.use("/cart", cartRoutes);

  app.use("/orders", orderRoutes);
};