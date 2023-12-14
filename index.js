const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');

const moment = require("moment");

require('dotenv').config();

const database = require("./config/database");

const systemConfig = require("./config/system");

const routeAdmin = require("./routes/admin/index.route");
const route = require("./routes/client/index.route");
const routeStoreOwner = require("./routes/storeowner/index.route");

database.connect();

const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// App Locals Variables
app.locals.prefixAdmin = systemConfig.prefixAdmin;
app.locals.moment = moment;

app.use(express.static(`${__dirname}/public`));

// Routes
routeAdmin(app);
route(app);
routeStoreOwner(app);

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "http://localhost:4000");
  res.header(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});
