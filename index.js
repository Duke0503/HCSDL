const express = require('express')
const bodyParser = require("body-parser");

require("dotenv").config();
const database = require("./config/database");

const pool = database.connect();

const app = express();
const PORT = process.env.PORT;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Register
function fetchDataFromMySQL_bill(callback) {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error:", err);
      return callback(err, null);
    }

    connect.query("SELECT * FROM ")
  })
}


app.get('/', (req, res)=>{ 
  res.status(200); 
  res.send("Welcome to root URL of Server"); 
}); 

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});