const sql = require('mssql');

// Query [Users]
var selectUserData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from Users', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// Query [User_Email]
var selectEmailData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Email', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// Query [User_Address]
var selectAddressData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Address', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// Query [User_Pnumber]
var selectPnumData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from User_Pnumber', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// [GET] /users
module.exports.users = async (req, res) => {
  try {
    let userData = await selectUserData();
    res.json(userData);
  } catch(e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
};

// [POST] /register
module.exports.registerPost = async (req, res) => {
  try {
    // Get user data from the request body
    let register = req.body;

    // Fetch existing user data
    let userData = await selectUserData();

    // Check if the username already exists
    const usernameExists = userData.some((element) => element.username === register.username);

    if (usernameExists) {
      console.log("Username already exists!");
      return res.status(409).send("Username already exists!");
    }

    // If username does not exist, proceed with the registration
    var q = new sql.Request();
    q.input('name', sql.NVarChar(50), register.name);
    q.input('dob', sql.Date, register.dob);
    q.input('usertype', sql.VarChar(12), register.usertype);
    q.input('username', sql.VarChar(50), register.username);
    q.input('pwd', sql.VarChar(50), register.pwd);
    q.input('email', sql.VarChar(50), register.email);
    q.input('address', sql.VarChar(255), register.address);
    q.input('pNumber', sql.Char(10), register.pNumber);
    q.input('nameStore', sql.NVARCHAR(50), register.nameStore);

    // Insert the new user into the [Users]
    const userResult = await q.query(`
      INSERT INTO [Users] (name, dob, usertype, username, pwd)
      OUTPUT INSERTED.id_user
      VALUES (@name, @dob, @usertype, @username, @pwd)
    `);
    
    const id_user = userResult.recordset[0].id_user;
    console.log(id_user);

    q.input('id_user', sql.Int, id_user);
    // Insert phone number into [User_Pnumber]
    await q.query("INSERT INTO [User_Pnumber] (id_user, pNumber) VALUES (@id_user, @pNumber)", {
      id_user: id_user,
      pNumber: register.pNumber,
    });

    // Insert phone number into [User_Address]
    await q.query("INSERT INTO [User_Address] (id_user, address) VALUES (@id_user, @address)", {
      id_user: id_user,
      address: register.address,
    });

    // Insert phone number into [User_Address]
    await q.query("INSERT INTO [User_Email] (id_user, email) VALUES (@id_user, @email)", {
      id_user: id_user,
      address: register.email,
    });

    // Check if nameStore is different from NULL and insert id_user and namestore to Store table
    if (register.nameStore) {
      await q.query("INSERT INTO [Store] (id_owner, name) VALUES (@id_user, @nameStore)", {
        id_user: id_user,
        nameStore: register.nameStore,
      });
    }

    res.json({ status: 200, message: "Register Successful!", id_user });

  } catch (e) {
    console.log("Error:", e);
    res.status(500).send("Error registering user");
  }
};

var selectStoreData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT * FROM [Store] WHERE id_owner = @ID', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};
// [POST] /login
module.exports.loginPost = async (req, res) => {
  try {
    let loginData = req.body;
    
    // Call selectUserData function to fetch user data
    let userData = await selectUserData();

    // Filter user data based on the provided username and password
    let userMatch = userData.find(
      (element) =>
        element.username === loginData.username &&
        element.pwd === loginData.pwd
    );
  
    if (!userMatch) {
      console.log("Username and password combination does not exist!");
      return res.status(401).send("Invalid username or password!");
    }

    const storeData = await selectStoreData(userMatch.id_user);
    
    // Fetch additional information for the logged-in user
    let emailData = await selectEmailData(userMatch.id_user);
    let addressData = await selectAddressData(userMatch.id_user);
    let pNumData = await selectPnumData(userMatch.id_user);

    // Construct the user information object
    const userInfo = {
      store: storeData,
      id_user: userMatch.id_user,
      name: userMatch.name,
      dob: userMatch.dob,
      usertype: userMatch.usertype,
      username: userMatch.username,
      email: emailData[0].email,
      address: addressData[0].address,
      pNumber: pNumData[0].pNumber,
    };

    // Log the user information to the console
    console.log("User Information:", userInfo);

    // Return the user information in the response
    res.json(userInfo);
  } catch (e) {
    console.log("Error:", e);
    res.status(500).send("Error retrieving user information");
  }
};
// End Query [Users]
