const express = require('express');
const router = express.Router();
const multer = require('multer');
const { Product } = require('../models');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images');
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`);
  },
});

const upload = multer({ storage });

router.get('/', async (req, res) => {
  try {
  //  const products = await Product.findAll({where: {user_id}}); // 기억이 안나
  const products = await Product.findAll();
    res.render('products', { products });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

router.post('/', upload.single('image_url'), async (req, res) => {
  try {
    const { name, description, price } = req.body;
    const image_url = req.file.filename;
    await Product.create({ name, description, price, image_url });
    res.redirect('/');
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { name, price } = req.body;
    await Product.update({ name, price }, { where: { id } });
    res.redirect('/');
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    await Product.destroy({ where: { id } });
    res.redirect('/');
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

router.get('/add', (req, res) => {
  res.render('add-product');
});

module.exports = router;
