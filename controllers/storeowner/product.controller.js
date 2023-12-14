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
  //[GET] /store/product/:storeID
module.exports.index = async (req, res) => {
  try {
    let storeID = req.params.storeID;  
    let storeProductData = await selectProductStoreData(storeID);  
    res.json({status: 200, products: storeProductData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"})
  };
};
  
// Select 1 product
var selectProductDetail = (id_product) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('productID', sql.Int, id_product);
    q.query("SELECT * FROM [Product] WHERE id_product = @productID", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
//[GET] /store/product/:productID
module.exports.productDetail = async (req, res) => {
  try {
    let productID = req.params.productID;  
    let productDetail = await selectProductDetail(productID);  
    res.json({status: 200, products: productDetail});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Module Failed"})
  };
};
// Create 1 Product
 // [POST] /store/product/:storeID/create
 module.exports.addProduct = (req, res) => {
  try {
    let newProduct = req.body;
    let id_store = req.params.storeID;
    console.log(newProduct);
    var q = new sql.Request().input('id_store', sql.Int, id_store);
    q.input('name', sql.NVarChar, newProduct.name);
    q.input('description', sql.NVarChar, newProduct.description);
    q.input('id_category', sql.Int, newProduct.id_category);
    q.input('imgLink', sql.VarChar, newProduct.imgLink);
    q.input('price', sql.Int, newProduct.price);
    q.input('quantity', sql.Int, newProduct.quantity);
    q.query("INSERT INTO [Product] (id_store, name, description, id_category, imgLink, price, quantity) VALUES (@id_store, @name, @description, @id_category, @imgLink, @price, @quantity)", (err) => {
      if (err) res.json({status: 501, message: "Query Failed"})
      else res.json({status: 200, message: "Insert Succesful"})
    });
  } catch(e) {
    console.log(e);
    res.json({status: 501, message: "Module Corrupted"})
  };
};

// [POST] /store/product/:store/modify
module.exports.modifyProduct = (req, res) => {
  try {
    let modifyData = req.body;
    var q = new sql.Request();
    q.input('id_product', sql.Int, modifyData.id_product);
    q.input('name', sql.NVarChar, modifyData.name);
    q.input('price', sql.Int, modifyData.price);
    q.input('quantity', sql.Int, modifyData.quantity);
    q.input('description', sql.NVarChar, modifyData.description);
    q.query("UPDATE [Product] SET name = @name, price = @price, quantity = @quantity, description = @description WHERE id_product = @id_product", (err) => {
      if (err) res.json({status: 501, message: "Query Error", error: err})
      else res.json({status: 200, message: "Modify Succesful"})
    });
  } catch(e) {
    console.log(e);
    res.json({status: 501, message: "Module Corrupted"})
  };
};

