const sql = require('mssql');

//////////////////////// ORDER //////////////////////////
// Select all ORDER in a store
var selectAllOrder = (id_store) => {
    return new Promise((resolve, reject) => {
      var q = new sql.Request().input('StoreID', sql.Int, id_store);
      q.query("SELECT * FROM store_allOrderItem(@StoreID)", (err, rc) => {
        if (err) return reject(err);
        else return resolve(rc.recordset);
      });
    });
  }
  //[GET] /store/order/:storeID
module.exports.index = async (req, res) => {
  try {
    let storeID = req.params.storeID;  
    let orderData = await selectAllOrder(storeID);  
    res.send(orderData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
};