const express = require ("express");
const User = require("../models/user")

//to be imported to index.js as middleware
const authRouter = express.Router()




//ROUTES FOR GET POST UPDTAE DELETE



authRouter.post ("/api/signup",  async (req, res) => {
const {name, email, password} = req.body;

const existingUser = await  User.findOne({email})
if (existingUser){
  return res.status(400).json ({msg : "User with the same email already exists"})
}
//if user does not exist then create a user in the db
var user = new User({
        name,
        email,
        password
})

user = await user.save();
res.json(user)


})



module.exports = authRouter;