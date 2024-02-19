const mongoose = require("mongoose");

//The userSchema defines the structure of the user
// data in the MongoDB database.

const userShema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },

  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter valid email",
    },
  },

  password: {
    required: true,
    type: String,
  },

  address: {
    type: String,
    default: "",
  },
  type: {
    default: "user",
    type: String,
  },
});

//The User model is created based on the schema,
//and it provides an interface for interacting with user data in the database.

const User = mongoose.model("User", userShema);
module.exports = User;
