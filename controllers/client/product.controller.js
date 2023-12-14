const sql = require('mssql');

// Query [Product]
var selectProductData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from Product', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

var selectCategoryData = () => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request();
    q.query('select * from Category', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// [GET] /products
module.exports.index = async (req, res) => {
  try {
    let categoryData = await selectCategoryData();
    let productData = await selectProductData();

    const responseData = {
      Category: categoryData,
      Product: productData,
    };
    
    res.json(responseData);

  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  };
};

var selectProductDataDetail = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT * FROM Product WHERE id_product = @ID', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

var selectRatingData = (ID) => {
  return new Promise((resolve, reject) => {
    var q = new sql.Request().input('ID', sql.Int, ID);
    q.query('SELECT * FROM Rating WHERE id_product = @ID', (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });  
};

// [GET] products/detail/:id
module.exports.detail = async (req, res) => {
  try {
    const id_product = req.params.id;
    const productDetail = await selectProductDataDetail(id_product);
    const productRating = await selectRatingData(id_product);
    const data = {
      ProductDetail : productDetail,
      ProductRating :productRating,
    };
    res.json(data);
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
};

var selectFilter = (searchString, id_category, min_price, max_price, searchType) => {
  return new Promise ((resolve, reject) => {
    var q = new sql.Request();
    q.input('searchString', sql.NVarChar(255), `%${searchString}%` || null);
    q.input('id_category', sql.Int, isNaN(id_category) ? null : id_category);
    q.input('min_price', sql.Int, isNaN(min_price) ? null : min_price);
    q.input('max_price', sql.Int, isNaN(max_price) ? null : max_price);
    q.input('searchType', sql.VarChar(10), searchType || 'BestRating');
    q.query("SELECT * FROM filter_product(@searchString, @id_category, @min_price, @max_price, @searchType)", (err, rc) => {
      if (err) return reject(err);
      else return resolve(rc.recordset);
    });
  });
};

// [GET] /products/search/:searchString/:id_category/:min_price/:max_price/:searchType
module.exports.filter = async (req, res) => {
  try {
    let searchString = req.params.searchString;

    if(searchString === "null") {
      searchString = '';
    }
    
    let id_category = parseInt(req.params.id_category);
    let min_price = parseInt(req.params.min_price);
    let max_price = parseInt(req.params.max_price);
    let searchType = req.params.searchType;
    
    const products = await selectFilter(searchString, id_category, min_price, max_price, searchType);

    res.json({ products: products });
  } catch (e) {
    console.log(e);
    res.status(500).send('Query Failed!');
  }
};

