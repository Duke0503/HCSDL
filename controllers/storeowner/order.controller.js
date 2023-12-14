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
  let waitingOrderData = await selectAllWaitingOrder(storeID); 
  res.json({status: 200, waitingOrders: waitingOrderData});
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
module.exports.confirmedOrder = async (req, res) => {
try {
  let storeID = req.params.storeID;  
  let confirmedOrderData = await selectAllConfirmedOrder(storeID); 
  res.json({status: 200, waitingOrders: confirmedOrderData});
} catch(e) {
  console.log(e);
  res.status(500).send('Query Failed!');
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

  module.exports.confirmOne = async (req, res) => {
    try {
      let orderItem = req.body;
      let q = new sql.Request();
      q.input('id_order', sql.Int, orderItem.id_order);
      q.input('id_product', sql.Int, orderItem.id_product);
      q.query("UPDATE OrderItem SET status = 'Confirmed' WHERE id_order = @id_order AND id_product = @id_product", (err) => {
      if (err) res.json({status: 500, message: "Query Failed"});
      else res.json({status: 200, message: "Confirm Succesfull"})
      });
    }
      catch(e) {
      console.log(e);
      res.json({status: 500, message: "Module crashed", error: e})
    };
    };