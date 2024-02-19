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
    //minlength: [6, "Password must be at least 6 characters long"],
    validate: {
      validator: (value) => {
        const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        return regex.test(value);
      },
      message:
        "Password must be at least 6 characters long and include at least one number and one letter",
    },

    // validate: {
    //   validator: (value) => {
    //     // Password should be at least 6 characters long and contain at least one number and one letter
    //     const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
    //     return regex.test(value);
    //   },
    //   message:
    //     "Password must be at least 6 characters long and include at least one number and one letter",
    // },
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
