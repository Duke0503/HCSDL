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
    res.json({status: 200, allOrders: orderData});
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
  res.json({status: 200, waitingOrders: waitingOrderData});
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
  res.json({status: 200, confirmedOrders: confirmedOrderData});
} catch(e) {
  console.log(e);
  res.json({status: 500, message: "Query Failed"})
};
};

//[POST] /store/order/:storeID/confirmAll
module.exports.confirmAllOrders = async (req, res) => {
  try {
    let storeID = req.params.storeID;  
    let q = new sql.Request().input('id_store', sql.Int, storeID)
    q.query("EXEC update_allOrderItemStatus @id_store", (err) => {
      if (err) res.json({status: 501, message: "Query Error"})
      else res.json({status: 200, message: "Confirm Succesful"})
    });
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"})
  };
  };