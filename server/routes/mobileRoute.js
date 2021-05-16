require('dotenv').config();
const router = require('express').Router();
const bcrypt = require('bcrypt')
const con = require('../config/db')
const jwt = require('jsonwebtoken');
const checkUserMobile = require('./checkUserMobile')
const multer = require('multer')

const storageOption = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/uploads')
    },

    filename: function (req, file, cb) {
        cb(null, new Date().toISOString() + file.originalname
        )
    }
})

const upload = multer({ storage: storageOption }).single('photo');


// Login
router.post('/mobile/login', (req, res) => {
    const { username, password } = req.body;
    const sql = 'SELECT userID,password FROM user WHERE username=?'
    con.query(sql, [username], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Server error')
        }
        if (result.length != 1) {
            return res.status(400).send('Username does not exist')
        }

        // check password
        bcrypt.compare(password, result[0].password, (err, same) => {
            if (err) {
                console.log(err);
                return res.status(500).send('Authen server error')
            }

            if (same) {
                const playload = { userID: result[0].userID, username: username };
                const token = jwt.sign(playload, process.env.JWT_KEY, { expiresIn: '1d' })

                res.send(token);
            }
            else {
                res.status(400).send('Wrong username or password')
            }
        })

    })

});

// Register
router.post("/mobile/register", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const email = req.body.email;
    const phone = req.body.phone;
 
    //checked existing username
    let sql = "SELECT UserID FROM user WHERE UserName=?";
    con.query(sql, [username], function (err, result, fields) {
        if (err) {
            console.error(err.message);
            res.status(500).send("Database server error");
            return;
        }
 
        const numrows = result.length;
        //if repeated username
        if (numrows > 0) {
            res.status(400).send("Sorry, this username exists");
        }
        else {
            //new user
            //generate encrypted password and add to DB
            bcrypt.hash(password, 10, function (err, hash) {
                //return hashed password, 60 characters
                sql = "INSERT INTO user(UserName, Password, NameUser, UserEmail, UserTel) VALUES (?,?,?,?,?)";
                con.query(sql, [username, hash, name, email, phone], function (err, result, fields) {
                    if (err) {
                        console.error(err.message);
                        res.status(500).send("Database server error");
                        return;
                    }
 
                    const numrows = result.affectedRows;
                    if (numrows != 1) {
                        res.status(500).send("Insert failed");
                    }
                    else {
                        res.send("Register done");
                    }
                });
            });
        }
    });
});



// ============================= Admin =========================
// show own product with category
router.get('/myProduct/:category', checkUserMobile, (req, res) => {
    // const ProductOwner = req.body.ProductOwner;
    const CategoryID = req.params.category;
    let sql = 'SELECT * FROM `product` WHERE ProductOwner=? AND CategoryID=? AND Status=1'
    con.query(sql, [req.afterDecoded.userID, CategoryID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// add new product
router.post('/product/new', checkUserMobile, (req, res) => {

    upload(req, res, err => {
        console.log(req.file)

        if (err) {
            console.log(err)
            return res.status(500).send('server error')
        }

        const { ProductImage, ProductTitle, ProductDescription, ProductPrice, ProductSize, Amount, CategoryID } = req.body;
        const sql = "INSERT INTO `product` ( `ProductImage`, `ProductTitle`, `ProductDescription`, `ProductPrice`, `Amount`, `ProductOwner`, `CategoryID`) VALUES ( ?, ?, ?, ?, ?, ?, ?);"

        con.query(sql, [ProductImage, ProductTitle, ProductDescription, ProductPrice, Amount,1, CategoryID], (err, result) => {
            if (err) {
                console.log(err)
                return res.status(500).send('Database error')
            }
            if (result.affectedRows != 1) {
                return res.status(500).send('Delete failed')
            }
            res.send('Add Success')
        })
    })

})


// ============================= User =========================
// ************ Product ***********
// get product by category
router.get('/product/:category', checkUserMobile, (req, res) => {
    // const ProductOwner = req.body.ProductOwner;
    const CategoryID = req.params.category;
    let sql = 'SELECT * FROM `product` WHERE CategoryID=? AND Amount > 0 AND Status=1'
    con.query(sql, [CategoryID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// get product by product id
router.post('/product/detail', checkUserMobile, (req, res) => {
    const ProductID = req.body.ProductID;
    let sql = 'SELECT * FROM `product` WHERE ProductID=? '
    con.query(sql, [ProductID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// decrease product amount
router.put('/product/sell', checkUserMobile, (req, res) => {
    const ProductID = req.body.ProductID;
    let sql = 'UPDATE product SET Amount= Amount-1 WHERE ProductID IN (?)'
    con.query(sql, [ProductID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// product status (1 is have product, 0 is out of product )
router.put('/prodect/:status', checkUserMobile, (req, res) => {
    const ProductID = req.body.ProductID;
    const status = req.params.status;
    let sql = 'UPDATE `product` SET `Status` = ? WHERE ProductID = ?;'
    con.query(sql, [status, ProductID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})


// ********** Order (Delivery) ***********
// new Order
router.post('/order/new', checkUserMobile, (req, res) => {
    const { ProductID, Amount, Size } = req.body;
    let sql = 'INSERT INTO `productorder` ( `ProductID`, `BuyerID`, `Amount`, `Size`) VALUES ?'
    con.query(sql, [ProductID, req.afterDecoded.userID, Amount, Size], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// show deliver or on road (Status 0 is on road, 1 is delivery successed)
router.get('/order/:status', checkUserMobile, (req, res) => {
    const status = req.params.status;
    let sql = 'SELECT productorder.OrderID,productorder.BuyerID,productorder.Status,productorder.Amount as Order_amount,productorder.Size, product.ProductImage,product.ProductTitle,product.ProductDescription,product.ProductPrice,product.ProductOwner,product.Amount as Product_Amount,product.ProductID FROM productorder,product WHERE productorder.Status =? AND product.ProductID=productorder.ProductID'
    con.query(sql, [status], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// change status of delivery 
router.put('/order/:status', checkUserMobile, (req, res) => {
    const status = req.params.status;
    const OrderID = req.body.OrderID;
    console.log('status=========='+status)
    console.log('orderID=========='+OrderID)
    let sql = 'UPDATE `productorder` SET `Status` = ? WHERE `OrderID` = ?;'
    con.query(sql, [status, OrderID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})


// ********* Profile ***********
// change status of delivery 
router.put('/profile/edit', checkUserMobile, (req, res) => {
    const { NameUser, UserEmail, UserTel } = req.body;
    let sql = 'UPDATE `user` SET `NameUser` = ?, `UserEmail` = ?, `UserTel` = ? WHERE `user`.`UserID` = ?;'
    con.query(sql, [NameUser, UserEmail, UserTel, 1], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})


// change status of delivery 
router.get('/profile/show', checkUserMobile, (req, res) => {
    
    let sql = 'SELECT * FROM `user` WHERE UserID = ?;'
    con.query(sql, [1], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})



// ********* Profile ***********
// get Voucher
router.post('/voucher', checkUserMobile, (req, res) => {
    const VoucherCode = req.params.VoucherCode;
    let sql = 'SELECT * FROM `voucher` WHERE VoucherCode = ?'
    con.query(sql, [VoucherCode], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

module.exports = router;
