require('dotenv').config();
const router = require('express').Router();
const bcrypt = require('bcrypt')
const con = require('../config/db')
const jwt = require('jsonwebtoken');
const checkUserMobile = require('./checkUserMobile')
const multer = require('multer')
var fs = require('fs');
var upload = multer({ dest: 'uploads/' })



// Login
router.post('/mobile/login', (req, res) => {
    const { username, password } = req.body;
    const sql = 'SELECT userID,password,UserEmail FROM user WHERE username=?'
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
                const playload = { userID: result[0].userID, username: username, userEmail: result[0].UserEmail };
                const token = jwt.sign(playload, process.env.JWT_KEY, { expiresIn: '1d' })

                res.send(token);
                console.log('Sended token')
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
    console.log(req.afterDecoded.userID)
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
router.post('/product/new', [checkUserMobile, upload.single("picture")], (req, res) => {
    const { ProductTitle, ProductDescription, ProductPrice, Amount, CategoryID } = req.body;
    console.log("Received file" + req.file.originalname);

    console.log(req.afterDecoded.userID)

    var src = fs.createReadStream(req.file.path);
    var dest = fs.createWriteStream('uploads/' + req.file.originalname);
    src.pipe(dest)
        ; res.writeContinue()
    src.on('end', function () {
        fs.unlinkSync(req.file.path);
        res.json('OK: received ' + req.file.originalname);
    });
    src.on('error', function (err) { res.json('Something went wrong!'); });

    const sql = "INSERT INTO `product` ( `ProductImage`, `ProductTitle`, `ProductDescription`, `ProductPrice`, `Amount`, `ProductOwner`, `CategoryID`) VALUES ( ?, ?, ?, ?, ?, ?, ?);"

    con.query(sql, [req.file.originalname, ProductTitle, ProductDescription, ProductPrice, Amount, req.afterDecoded.userID, CategoryID], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        if (result.affectedRows != 1) {
            return res.status(500).send('Delete failed')
        }
        console.log('add success')

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
    var ProductID = req.body.ProductID;
    var arr = ProductID.split(',');
    console.log(ProductID)
    console.log(arr)
    let sql = 'SELECT * FROM `product` WHERE ProductID IN (?) '
    var mysqll = con.query(sql, [arr], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)

    })
    console.log(mysqll.sql)
})

// decrease product amount
router.put('/product/sell', checkUserMobile, async (req, res) => {
    const ProductInfo = req.body.ProductID;
    // var arr = ProductID.split(',');
    // console.log(ProductInfo);

    for (var i = 0; i < ProductInfo.length; i++) {
        // console.log('Product ID ' + ProductInfo[i].productID);
        // console.log('Product Amount' + ProductInfo[i].amount);

        // check stock 
        // let sqlcheck = 'SELECT Amount FROM `product`WHERE ProductID=?'
        // con.query(sqlcheck, [ProductInfo[i].productID], (err, result) => {
        //     if (err) {
        //         console.log(err)
        //         return res.status(500).send('Database error')
        //     }
        //     // console.log(result[0].Amount)

        //     if(result[0].Amount<productID[i].Amount){}

        // })

        let sql = 'UPDATE product SET Amount= Amount-? WHERE ProductID IN (?)'
        await con.query(sql, [ProductInfo[i].amount, ProductInfo[i].productID], (err, result) => {
            if (err) {
                console.log(err)
                return res.status(500).send('Database error')
            }
            console.log('selled')
            // res.json(result)
            // return;
        })
    }
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
router.post('/order/new', checkUserMobile, async (req, res) => {
    const ProductInfo = req.body.ProductID;
    console.log('new order run')
    const user = req.afterDecoded.userID

    for (var i = 0; i < ProductInfo.length; i++) {

        let sql = 'INSERT INTO `productorder` ( `ProductID`, `BuyerID`, `Amount`, `Size`) VALUES (?, ? ,?, ?)'
        await con.query(sql, [ProductInfo[i].productID, user, ProductInfo[i].amount, ProductInfo[i].productSize], (err, result) => {
            if (err) {
                console.log(err)
                return res.status(500).send('Database error')
            }
            res.json(result)
            console.log('new order')
        })
    }

})

// show deliver or on road (Status 0 is on road, 1 is delivery successed)
router.get('/order/:status', checkUserMobile, (req, res) => {
    const status = req.params.status;
    let sql = 'SELECT productorder.OrderID,productorder.BuyerID,productorder.Status,productorder.Amount as Order_amount,productorder.Size, product.ProductImage,product.ProductTitle,product.ProductDescription,product.ProductPrice,product.ProductOwner,product.Amount as Product_Amount,product.ProductID FROM productorder,product WHERE productorder.Status =? AND product.ProductID=productorder.ProductID AND productorder.BuyerID=?'
    con.query(sql, [status,req.afterDecoded.userID], (err, result) => {
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
    console.log('status==========' + status)
    console.log('orderID==========' + OrderID)
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
    con.query(sql, [req.afterDecoded.userID], (err, result) => {
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


// ********* Favorite ***********
// get favorite
router.get('/getfavoriteOfUser', checkUserMobile, (req, res) => {
    const user = req.afterDecoded.userID
    let sql = 'SELECT * FROM `favorite`, product WHERE favorite.User_id = ? AND product.ProductID = favorite.Product_ID'
    con.query(sql, [user], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        }
        res.json(result)
    })
})

// get info by product
router.post('/getfavoritebyid', checkUserMobile, (req, res) => {
    const productid = req.body.productid
    const user = req.afterDecoded.userID
    let sql = 'SELECT * FROM `favorite`, product WHERE favorite.User_id = ? AND favorite.Product_ID = ?'
    con.query(sql, [user, productid], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        } console.log(result.length)
        if (result.length > 0) {
            res.send('1')
        } else (
            res.send('0')
        )


    })
})


//add remove favorite
router.post('/updatefavoriteOfUser', checkUserMobile, (req, res) => {
    const productid = req.body.productid
    const user = req.afterDecoded.userID

    let sql = 'SELECT * FROM `favorite` WHERE Product_ID = ? AND User_id = ?'
    con.query(sql, [productid, user], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).send('Database error')
        } else {
            numrows = result.length
            if (numrows == 0) {
                sqlins = "INSERT INTO favorite(Product_ID, User_id) VALUES (?,?)";
                con.query(sqlins, [productid, user], (err, result) => {
                    if (err) {
                        console.log(err)
                        return res.status(500).send('Database error')
                    } else {

                    }
                    console.log("insert+")
                })
            } else {
                let sqlde = 'DELETE FROM `favorite` WHERE Product_ID = ? AND User_id = ?'
                con.query(sqlde, [productid, user], (err, result) => {
                    if (err) {
                        console.log(err)
                        return res.status(500).send('Database error')
                    } else {

                    }
                    console.log("delete")
                })
            }
        }

    })

})






























































//check JWT
router.get('/mobile/verify', (req, res) => {
    const token = req.headers['authorization'] || req.headers['x-access-token'];
    jwt.verify(token, process.env.JWT_KEY, (err, decoded) => {
        if (err) {
            console.log(err)
            res.status(400).send('Invalid token')
        }
        else {
            res.send(decoded)
        }
    })

})
module.exports = router;
