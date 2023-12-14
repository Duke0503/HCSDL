const sql = require('mssql');

var selectOrderData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT * FROM [Order] WHERE id_customer = @ID', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

var selectOrderItemWaitingData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.input('s', sql.Char,"Waiting");
    q.query('SELECT * FROM [OrderItem] WHERE id_order = @ID AND status = @s', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

// [GET] /orders/:id/
module.exports.index = async (req, res) => {
  try {
    const id_customer = req.params.id;
    const orders = await selectOrderData(id_customer);
    const DataQuery = []; // Initialize DataQuery as an array

    for (const order of orders) {
      const id_order = order.id_order;

      // Fetch data from OrderItem based on id_order
      const result = await selectOrderItemWaitingData(id_order);
    
      const resultWithDetails = {
        product: result,
        id_pMethod: order.id_pMethod,
        address: order.address,
        pNumber: order.pNumber,
      };

      // Push the result into DataQuery array
      DataQuery.push(resultWithDetails);
    }

    const Data = {
      orderItems: DataQuery,
    };

    res.json(Data);
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
};

var selectOrderItemConfirmedData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.input('s', sql.Char,"Confirmed");
    q.query('SELECT * FROM [OrderItem] WHERE id_order = @ID AND status = @s', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

// [GET] /orders/:id/bills
module.exports.bills = async (req, res) => {
  try {
    const id_customer = req.params.id;
    const orders = await selectOrderData(id_customer);
    const DataQuery = []; // Initialize DataQuery as an array

    for (const order of orders) {
      const id_order = order.id_order;
      
      // Fetch data from OrderItem based on id_order
      const result = await selectOrderItemConfirmedData(id_order);

      const resultWithDetails = {
        product: result,
        id_pMethod: order.id_pMethod,
        address: order.address,
        pNumber: order.pNumber,
      };

      // Push the result into DataQuery array
      DataQuery.push(resultWithDetails);
    }

    const Data = {
      orderItems: DataQuery,
    };

    res.json(Data);
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
};
