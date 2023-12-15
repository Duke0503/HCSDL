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


//[POST] /orders/addComment

module.exports.addComment = (req, res) => {
  try {
    let nComment = req.body;
    // console.log(nComment);
    // res.json(nComment);
    var q = new sql.Request()
      .input('id_user', sql.Int, nComment.id_user)
      .input('id_prod', sql.Int, nComment.id_product)
      .input('cmt', sql.NVarChar, nComment.comment)
      .input('star', sql.Float, nComment.star);
    q.query("insert into [Rating] (id_customer, id_product, detail, ratingStar) values (@id_user, @id_prod, @cmt, @star)", (err, sth) => {
      if (err) res.json({status: 501, message: "Inserted comment fail"});
      else res.json({status: 201, message: "Inserted"});
    });
  } catch(e) {
    console.log(e);
    res.json({status: 502, message: "Module Corrupted"});
  }
}

//[PATCH] /orders/editComment

module.exports.editComment = (req, res) => {
  try {
    let updRating = req.body;
    var q = new sql.Request()
    .input('id_user', sql.Int, updRating.id_user)
    .input('id_prod', sql.Int, updRating.id_product)
    .input('cmt', sql.NVarChar, updRating.comment)
    .input('star', sql.Float, updRating.star);
    
    q.query("update [Rating] set detail = @cmt, ratingStar = @star where id_product = @id_prod and id_customer = @id_user", (err, st) => {
      if (err) res.json({status: 505, message: "Updated comment fail"});
      else res.json({status: 205, message: "Updated"});
    });

  } catch (e) {
    console.log(e);
    res.json({status: 502, message: "Module Corrupted"});
  }
}

//[DELETE] /orders/deleteComment

module.exports.delComment = (req, res) => {
  try {
    let idenCmt = req.body;
    var q = new sql.Request()
    .input('id_user', sql.Int, idenCmt.id_user)
    .input('id_prod', sql.Int, idenCmt.id_product);

    q.query("delete from [Rating] where id_customer = @id_user and id_product = @id_prod", (err, st) => {
      if (err) res.json({status: 504, message: err});
      else res.json({status: 205, message: "Deleted"});
    })

  } catch(e) {
    console.log(e);
    res.json({status: 502, message: "Module Corrupted"});
  }
}