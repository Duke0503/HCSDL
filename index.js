const express = require('express')
const bodyParser = require("body-parser");
const sql = require('mssql');

require("dotenv").config();

// Config Database
const config = {
  user: process.env.USER,
  password: process.env.PASSWORD,
  server: process.env.SERVER,  
  database: process.env.DATABASE,
  options: {
    encrypt: false,
    cryptoCredentialsDetails: {
      minVersion: 'TLSv1'
    }
  },
};

// Connect to Database
const pool = new sql.ConnectionPool(config);
const poolConnect = pool.connect();


const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Function to Fetch Data From [Users]
function fetchDataFromMySQL_users(callback) {
  poolConnect.then(() => {
    const request = new sql.Request(pool);

    request.query('SELECT * FROM dbo.Users', (err, result) => {
      if (err) {
        console.error('Error:', err);
        return callback(err, null);
      }

      callback(null, result.recordset); // Trả về dữ liệu bằng callback
    });
  }).catch(err => {
    console.error('Lỗi kết nối:', err);
    callback(err, null);
  });
}

// [GET] /users/data
app.get("/users/data", (req, res) => {
  fetchDataFromMySQL_users((err, data) => {
    if (err) {
      console.error("Error", err);
      res.status(500).json({ error: "Error" });
      return;
    }
    res.json({ data });
  });
});

// [POST] /users/register
app.post("/users/register", (req, res) => {
  const {
    username,
    pwd,
    dob,
    usertype,
    name,
    email,
    pNumber,
    address
  } = req.body;

  // Check the username has existed in dbo.Users
  const checkQuery = "SELECT * FROM dbo.Users WHERE username = ?";
  const checkValues = [username];
  
  pool.query(checkQuery, checkValues, (error, results, fields) => {
    if (error) {
      console.error("Error:", error);
      res.status(500).json({ error: "Error" });
      return;
    }

    if (results.length != 0) {
      // If the data has existed in dbo.Users
      res.status(400).json({ error: "Users has existed!" });
      return;
    }

    // Insert the User to the dbo.Users
    const insertQuery = 
      "INSERT INTO dbo.Users (name, dob, usertype, username, pwd) VALUES (?, ?, ?, ?, ?)";
    const values = [
      name,
      dob,
      usertype,
      username,
      pwd,
    ];

    pool.query(insertQuery, values, (error, results, fields) => {
      if (error) {
        console.error("Error:", error);
        res.status(500).json({ error: "Error" });
        return;
      }
      
      // Get The Newly Inserted User's ID
      const userId = results.recordset[0].id;

      // Inserted Email
      const insertEmailUser = "INSERTED INTO dbo.User_Email (id_user, email) VALUES (?, ?)";
      const valueEmail = [userId, email];
      pool.query(insertEmailUser, valueEmail, (error, emailResults, emailFields) => {
        if (error) {
          console.error("Error:", error);
          res.status(500).json({ error: "Error" });
        }
      });

      // Inserted Address
      const insertAddressUser = "INSERTED INTO dbo.User_Address (id_user, address) VALUES (?, ?)";
      const valueAddress = [userId, address];
      pool.query(insertAddressUser, valueAddress, (error, addressResults, addressFields) => {
        if (error) {
          console.error("Error:", error);
          res.status(500).json({ error: "Error" });
        }
      });
      
      // Inserted Phone Number
      const insertPnumberUser = "INSERTED INTO dbo.User_Pnumber (id_user, pNumber) VALUES (?, ?)";
      const valuePnumber = [userId, pNumber];
      pool.query(insertPnumberUser, valuePnumber, (error, pNumberResults, pNumberFields) => {
        if (error) {
          console.error("Error:", error);
          res.status(500).json({ error: "Error" });
        }

        res.json({ message: "User has been created successfully!" });
      });
    });
  });
});




app.get('/', (req, res)=>{ 
  res.status(200); 
  res.send("Welcome to root URL of Server"); 
}); 

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});