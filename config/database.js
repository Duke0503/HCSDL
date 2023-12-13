const config = require("./config");
const sql = require("mssql");

module.exports.connect = async () => {
  try {
    await sql.connect(config.config);
    console.log("Connect Success!");
  } catch (error) {
    console.log(error);
  }
}