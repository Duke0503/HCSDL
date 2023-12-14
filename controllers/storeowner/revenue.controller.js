const sql = require("mssql");

/////////////////// REVENUE //////////////////
var revenueByProduct = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input("StoreID", sql.Int, id_store);
    q.query("SELECT * FROM revenue_byProduct(@StoreID)", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

var ratingByProduct = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input("StoreID", sql.Int, id_store);
    q.query(
      "SELECT P.[id_product], P.[productRating] FROM [Product] P WHERE P.[id_store] = @StoreID ",
      (err, rc) => {
        if (err) return reject(err);
        else return resolve(rc.recordset);
      }
    );
  });
};

var totalRevenue = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input("StoreID", sql.Int, id_store);
    q.query(
      "SELECT dbo.total_revenueStore(@StoreID) as TotalRevenue",
      (err, rc) => {
        if (err) return reject(err);
        else return resolve(rc.recordset);
      }
    );
  });
};
//[GET] ./store/revenue/:storeID
module.exports.index = async (req, res) => {
  try {
    let storeID = req.params.storeID;
    let productRevenue = await revenueByProduct(storeID);
    let productRating = await ratingByProduct(storeID);
    let tRevenue = await totalRevenue(storeID);
    // res.send(productRevenue);
    let st = {
      prod: productRevenue,
      rat: productRating,
      sum: tRevenue,
    };
    res.json({ status: 200, st });
    // res.send(tRevenue);
  } catch (e) {
    console.log(e);
    res.json({ status: 500, message: "Query Failed" });
  }
};
