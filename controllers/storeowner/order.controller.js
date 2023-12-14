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

// Select all Waiting ORDER in a store
var selectAllWaitingOrder = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('StoreID', sql.Int, id_store);
    q.query("SELECT * FROM store_waitingOrderItem(@StoreID)", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
//[GET] /store/order/:storeID/waiting
module.exports.waitingOrder = async (req, res) => {
try {
  let storeID = req.params.storeID;  
  let waitingOrderData = await selectAllWaitingOrder(storeID);  
  res.send(waitingOrderData);
} catch(e) {
  console.log(e);
  res.status(500).send('Query Failed!');
};
};

// Select all Confirmed ORDER in a store
var selectAllConfirmedOrder = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('StoreID', sql.Int, id_store);
    q.query("SELECT * FROM store_confirmedOrderItem(@StoreID)", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
//[GET] /store/order/:storeID/confirmed
var selectAllConfirmedOrder = (id_store) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('StoreID', sql.Int, id_store);
    q.query("SELECT * FROM store_confirmedOrderItem(@StoreID)", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
}
module.exports.confirmedOrder = async (req, res) => {
try {
  let storeID = req.params.storeID;  
  let confirmedOrderData = await selectAllConfirmedOrder(storeID);  
  res.send(confirmedOrderData);
} catch(e) {
  console.log(e);
  res.json({status: 500, message: "Query Failed"})
};
};

//[GET] /store/order/:storeID/confirmAll
module.exports.confirmAllOrders = async (req, res) => {
  try {
    let storeID = req.params.storeID;  
    let q = new sql.Request().input('id_store', sql.Int, storeID)
    const re = await q.execute('update_allOrderItemStatus');
    console.log('Stored procedure executed successfully:', re);
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"})
  };
  };