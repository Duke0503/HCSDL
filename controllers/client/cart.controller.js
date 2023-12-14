const sql = require('mssql');

var selectCartData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT ci.*, p.name AS product_name, p.description AS product_description, p.price AS product_price FROM CartItem ci INNER JOIN Product p ON ci.id_product = p.id_product WHERE ci.id_user = @ID', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// [GET] /:id
module.exports.index = async (req, res) => {
  try {
    // CartItem
    const id_user = req.params.id;
    if(!id_user) {
      return res.status(401).json({ error: 'User not authenticated' });
    }
    const products = await selectCartData(id_user);
    res.json(products);
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
}

// [POST] /cart