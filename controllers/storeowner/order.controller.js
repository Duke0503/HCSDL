const sql = require('mssql');

//////////////////////// ORDER //////////////////////////
// Select all ORDER in a store
var selectAllOrder = (id_store) => {
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