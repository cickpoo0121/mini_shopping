require('dotenv').config();
const router = require('express').Router();
const bcypt = require('bcrypt')
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
        bcypt.compare(password, result[0].password, (err, same) => {
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

        const { ProductImage, ProductTitle, ProductDescription, ProductPrice, ProductSize, Amount, ProductOwner, CategoryID } = req.body;
        const sql = "INSERT INTO `product` ( `ProductImage`, `ProductTitle`, `ProductDescription`, `ProductPrice`, `ProductSize`, `Amount`, `ProductOwner`, `CategoryID`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);"

        con.query(sql, [req.file.originalname, ProductTitle, ProductDescription, ProductPrice, ProductSize, Amount, ProductOwner, CategoryID], (err, result) => {
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
    let sql = 'SELECT * FROM `productorder` WHERE Status =?;'
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
    const { NameUser, UserEmail, UserTel, UserID } = req.body;
    let sql = 'UPDATE `user` SET `NameUser` = ?, `UserEmail` = ?, `UserTel` = ? WHERE `user`.`UserID` = ?;'
    con.query(sql, [NameUser, UserEmail, UserTel, UserID], (err, result) => {
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
