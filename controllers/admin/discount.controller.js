const sql = require('mssql');

var selectDiscount = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query("select * from Discount", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// [GET] /admin/discount
module.exports.index = async (req, res) => {
  try {
    let discountData = await selectDiscount();

    res.json({status: 200, data: discountData});
  } catch(e) {
    console.log(e);
    res.json({status: 500, message: "Query Failed"});
  };
};

// [POST] /admin/discount/create
module.exports.addDiscount = (req, res) => {
  try {
    let nDiscount = req.body;
    console.log(nDiscount);
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
      if (err) res.json({status: 501, message: "Insert Failed"});
      else res.json({status: 201, message: "Inserted"});
    });
  } catch(e) {
    console.log(e);
    res.json({status: 502, message: "Module Corrupted"});
  };
};
