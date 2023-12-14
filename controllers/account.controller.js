const sql = require('mssql');

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
      else return resolve(rc.recordsets);
    });
  });
};

var selectAddressData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Address', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordsets);
    });
  });
};

var selectPnumData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Pnumber', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordsets);
    });
  });
};

// [GET] /admin/accounts
module.exports.index = async (req, res) => {
  try {
    let userData = await selectUserData();
    let emailData = await selectEmailData(); 
    let addData = await selectAddressData();
    let pNumData = await selectPnumData();

    userData.forEach(element => {
      element.email = [];
      element.address = [];
      element.pNum = []
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
      addData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.address.push(ele.address);
        };
      });
      pNumData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.pNum.push(ele.pNumber);
        };
      });
    });

    res.json({status: 200, data: userData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"})
  }
};

var selectUserName = (name) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('n', sql.NVarChar, `%${name}%`);
    q.query("SELECT * FROM Users WHERE name LIKE @n", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordsets);
    });
  });
};

// [GET] /admin/accounts/search/:name
module.exports.searchAccount = async (req, res) => {
  try {
    let name = req.params.name;
    let userData = await selectUserName(name);
    let emailData = await selectEmailData();
    let addData = await selectAddressData();
    let pNumData = await selectPnumData();
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
      addData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.address.push(ele.address);
        };
      });
      pNumData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.pNum.push(ele.pNumber);
        };
      });
    });
    console.log(userData);

    res.json({status: 200, data: userData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"})
  };
};

var selectUserType = (ty) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('t',sql.VarChar, ty);
    q.query("select * from Users where usertype = @t", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordsets);
    });
  });
};
// [GET] /admin/accounts/search/type/:ty
module.exports.searchType = async (req, res) => {
  try {
    let ty = req.params.ty;
    let userData = await selectUserType(ty);
    let emailData = await selectEmailData();
    let addData = await selectAddressData();
    let pNumData = await selectPnumData();
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
      addData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.address.push(ele.address);
        };
      });
      pNumData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.pNum.push(ele.pNumber);
        };
      });
    });

    res.json({status: 200, data: userData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"});
  };
};

var selectUserIf = (na, ty) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request()
      .input('n', sql.VarChar, `%${na}%`)
      .input('t', sql.VarChar, `%${ty}%`);

    q.query("select * from Users where name LIKE @n and usertype LIKE @t", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordsets);
    });
  });
};

// [GET] /admin/accounts/search/:name/:ty
module.exports.search = async (req, res) => {
  try {
    let na = req.params.name;
    let ty = req.params.ty;
    let userData = await selectUserIf(na, ty);
    let emailData = await selectEmailData();
    let addData = await selectAddressData();
    let pNumData = await selectPnumData();
    userData.forEach(element => {
      element.email = [];
      emailData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.email.push(ele.email);
        };
      });
      addData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.address.push(ele.address);
        };
      });
      pNumData.forEach(ele => {
        if (element.id_user == ele.id_user){
          element.pNum.push(ele.pNumber);
        };
      });
    });

    res.json({status: 200, data: userData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"});
  };
};

// [DELETE] /admin/delete/:id

var tryDeleteUser = (id) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request()
      .input('n', sql.VarChar, `%${id}%`);

    q.query("select * from Users where name LIKE @n and usertype LIKE @t", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};