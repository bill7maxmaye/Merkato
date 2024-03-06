const express = require("express");
const adminRouter = express.Router();
const Product = require("../models/product");
const admin = require("../middlewares/admin");

//Add Product

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, price, quantity, category, images } = req.body;

    let product = new Product({
      name,
      description,
      price,
      quantity,
      category,
      images,
    });

    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
