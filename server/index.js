//IMORT FROM PACKAGES

//require('dotenv').config();
const express = require("express");
const mongoose = require("mongoose");

//load environmental variables from .env

//IMPORT FROM FILES
//this just imports it for use
const authRouter = require("./routes/auth");

//INITILIZATIONS
PORT = 3000;
const app = express();
const MONGODB_URL =
  "mongodb+srv://bilenmehalek7:merkato@merkato.9wazhsh.mongodb.net/?retryWrites=true&w=majority";

//MIDDLEWARE
//this now makes it functional that the server listening on port 3000, when any request to the specified get request comes it directs it to the authRouter
app.use(express.json()); //should be defined before app.use(authRouter)
app.use(authRouter);

//CONNECTIONS

mongoose
  .connect(MONGODB_URL)
  .then(() => {
    console.log("DB connected");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`started server at port ${PORT}`);
});
