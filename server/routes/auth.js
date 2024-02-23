const express = require("express");

const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

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

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    //if there is no token
    if (!token) return res.json(false);
    //if there is a token in the req.header verify it with the passwordkey
    const verified = jwt.verify(token, passwordKey);
    if (!verified) return res.json(false);
    //again check if the verified token has a user associated with it, b/c a random token could turn out to be true when verified with the passwordkey
    const user = await User.findById(verified.id);
    //if no user with that token exist return false
    if (!user) return res.json(false);
    //if user exists return true and send the user info to the front end
    return res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
