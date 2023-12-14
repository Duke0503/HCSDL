const sql = require('mssql');

var selectOrderWaitingData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT * FROM OrderItem oi JOIN [Order] o ON oi.id_order = o.id_order WHERE o.id_customer = @ID AND oi.status = \'Waiting\'', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

// [GET] /orders/:id
module.exports.index = async (req, res) => {
  try {
    const id_customer = req.params.id;
    const orders = await selectOrderWaitingData(id_customer);

    const Data = {
      orders: orders,
    }
    res.json(Data);
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
};
