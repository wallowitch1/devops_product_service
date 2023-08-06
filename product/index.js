const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const FileStore = require('session-file-store')(session);
const methodOverride = require('method-override');
const cookieParser = require("cookie-parser");
const morgan = require('morgan');


const jwt = require("jsonwebtoken");
const SECRET_KEY = "keroro2424.";

const db = require('./models');
const productsRouter = require('./routes/product');

const { Product } = require('./models');
const fs = require('fs');

const app = express();
const port = 3000;

// 로그 파일 스트림 생성
const accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' });

// morgan을 사용하여 액세스 로그 설정
app.use(morgan('combined', { stream: accessLogStream }));

app.use(cookieParser());

app.set("view engine", "ejs");  // express 에서 ejs 모듈 사용(view 사용하기 위해서)

const viewPath = path.join(__dirname, "./views");
app.set("views", viewPath);

db.sequelize.sync()
  .then(() => {
    console.log('Database synced');
  })
  .catch((error) => {
    console.error('Error syncing database:', error);
  });

const verifyToken = (req, res, next) => {
   console.log(req.cookies.token	);
    const token = req.cookies.token;
  
    if (!token) {
      return res.status(401).json({ message: "No token provided" });
    }
  
    jwt.verify(token, SECRET_KEY, (err, decoded) => {
      if (err) {
        return res.status(401).json({ message: "Failed to authenticate token" });
      }
  
      req.user = decoded;
      next();
    });
};

app.use((req, res, next) => {
  next();
});
app.use("/products", productsRouter);

app.get('/', verifyToken, (req, res) => {
  //const username = req.decoded.username;
  //res.render("index");

  res.redirect('/index');
  /*if (username) {
    console.log('Session in /index route:', username);
    res.redirect('/index');
  } else {
    res.redirect('/auth/login');
  }*/
});

app.get('/index', verifyToken, async (req, res) => {
  if (req.user.username) {
    try {
      const products = await Product.findAll();
      console.log(products);
      res.render('index', { user: req.user.username , accounttype: req.user.accounttype, products, user_id : req.user.user_id});

    } catch (error) {
      console.error(error);
      res.status(500).send('Internal server error');
    }
  } else {
    res.redirect('http://www.devops.com/auth/login');
  }
});

// 상품 조회 API (JWT 검증 미들웨어 사용)
app.get("/products", verifyToken, (req, res) => {
  res.status(200).json(products);
});




app.listen(port, () => {
  console.log(`Product service app listening on port ${port}`);
});

