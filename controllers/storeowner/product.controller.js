const sql = require('mssql');

//////////////////////// PRODUCT //////////////////////////
// Select all products in a store
var selectProductStoreData = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('StoreID', sql.Int, id_store);
    q.query("SELECT * FROM [Product] WHERE id_store = @StoreID", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
  //[GET] /store/:storeID
module.exports.index = async (req, res) => {
  try {
    let storeID = req.params.storeID;  
    let storeProductData = await selectProductStoreData(storeID);  
    res.send(storeProductData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
};
  
// Select 1 product
var selectProductDetail = (id_product) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ProductID', sql.Int, id_product);
    q.query("SELECT * FROM [Product] WHERE id_product = @ProductID", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
//[GET] /store/:storeID/:productID
module.exports.productDetail = async (req, res) => {
  try {
    let productID = req.params.productID;  
    let productDetail = await selectProductDetail(productID);  
    res.send(productDetail);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
};
