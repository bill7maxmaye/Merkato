const mongoose = require("mongoose");

const productShema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },

  description: {
    required: true,
    type: String,
    trim: true,
  },

  images: [
    {
      type: String,
      required: true,
    },
  ],

  category: {
    required: true,
    type: String,
    trim: true,
  },

  price: {
    required: true,
    type: Number,
  },

  quantity: {
    required: true,
    type: Number,
  },
});

const Product = mongoose.model("Product", productShema);
module.exports = Product;
