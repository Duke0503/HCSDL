const express = require('express');
const bodyParser = require('body-parser');
const sql = require('mssql');

require('dotenv').config();

const database = require("./config/database");

database.connect();

const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

////////////////////////////////// Admin ///////////////////////////
var selectUserData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from Users', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

var selectEmailData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Email', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

app.get("/admin", async (req, res) => {
  try {
    let userData = await selectUserData();
    let emailData = await selectEmailData(); 

    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
    });

    res.json(userData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
});

var selectUserName = (name) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('n',sql.VarChar, name);
    q.query("select * from Users where name = @n", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

app.get("/admin/search/:name", async (req, res) => {
  try {
    let name = req.params.name;
    let userData = await selectUserName(name);
    let emailData = await selectEmailData();
    
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
    });

    res.send(userData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
});

var selectUserType = (ty) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('t',sql.VarChar, ty);
    q.query("select * from Users where usertype = @t", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

app.get("/admin/search/type/:ty", async (req, res) => {
  try {
    let ty = req.params.ty;
    let userData = await selectUserType(ty);
    let emailData = await selectEmailData();
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
    });

    res.send(userData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
});

var selectUserIf = (na, ty) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('n', sql.VarChar, na).input('t',sql.VarChar, ty);
    q.query("select * from Users where name = @n and usertype = @t", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};


app.get("/admin/search/:name/:ty", async (req, res) => {
  try {
    let na = req.params.name;
    let ty = req.params.ty;
    let userData = await selectUserIf(na, ty);
    let emailData = await selectEmailData();
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
    });

    res.send(userData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
});

// var findUserById = async (id) => {
//   return new Promise((resolve, reject) => {
//     var check1, check2;
//     var q1 = new sql.Request().input('id', sql.Int, id);
//     check1 = await () => {q1.query("select * from Users where id_user = @id", (err, rc) => {
//       if (err) return reject(err);
//       else return rc.rowsAffected;
//     });};
//     var q2 = new sql.Request().input('id', sql.Int, id);
//     q1.query("select * from Order where id_customer = @id", (err, rc) => {
//       if (err) return reject(err);
//       else check2 = rc.rowsAffected;
//     });
//     if (check1 == [0] && check2 == [0]) return resolve(false);
//     else return resolve(true); 
//   });
// };

// var deleteUserById = (id) => {
//   return new Promise((resolve, reject) => {
//     var q = new sql.Request().input('id', sql.Int, id);
//     q.query("delete from Users where id_user = @id", (err, rc) => {
//       if (err) return reject(err);
//       else return resolve(true);
//     });
//   });
// };

// app.get('/admin/delete/:id', async (req, res) => {
//   try {
//     let id = req.params.id;
//     let delStat = await findUserById(id);
//     res.send(delStat);
//   } catch(e) {
//     console.log(e);
//     res.status(500).send('Query Failed!');
//   };
// });

var selectDiscount = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query("select * from Discount", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

app.get("/admin/discountList", async (req, res) => {
  try {
    let discountData = await selectDiscount();

    res.send(discountData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
});

let discountID = 400000006;

app.post("/admin/addDiscount", (req, res) => {
  try {
    let nDiscount = req.body;
    nDiscount.id = discountID++;
    var q = new sql.Request().input('id', sql.Int, nDiscount.id);
    q.input('id_category', sql.Int, nDiscount.id_category);
    q.input('dateStart', sql.Date, nDiscount.dateStart);
    q.input('dateEnd', sql.Date, nDiscount.dateEnd);
    q.input('discountPercent', sql.Decimal(3, 2), nDiscount.discountPercent);
    q.input('discountMoney', sql.Int, nDiscount.discountMoney);
    q.input('maxDiscount', sql.Int, nDiscount.maxDiscount);
    q.input('minBill', sql.Int, nDiscount.minBill);
    q.input('quantity', sql.Int, nDiscount.quantity);
    console.log(nDiscount);
    q.query("INSERT INTO [Discount] (id_category, dateStart, dateEnd, discountPercent, discountMoney, maxDiscount, minBill, quantity) VALUES (@id_category, @dateStart, @dateEnd, @discountPercent, @discountMoney, @maxDiscount, @minBill, @quantity)", (err, st) => {
      if (err) res.send.log(err);
      else res.send("Insert OK");
    });
  } catch(e) {
    console.log(e);
    res.status(501).send("Insert Data Failed");
  };
});

////////////////////////////// End Admin ///////////////////////////

app.get('/', (req, res) => {
  res.status(200);
  res.send('Welcome to the root URL of Server');
});

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});
