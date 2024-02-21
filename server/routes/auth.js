const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const jwt = require("jsonwebtoken");

//to be imported to index.js as middleware
const authRouter = express.Router();

//ROUTES FOR GET POST UPDTAE DELETE

//route for sign-up

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exists" });
    }

    const hashedpassword = await bcryptjs.hash(password, 8);
    console.log(hashedpassword);
    //if user does not exist then create a user in the db
    var user = new User({
      name,
      email,
      password: hashedpassword,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//route for sign-in

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "No user with this email exists" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrrect password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });

    print(token);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
