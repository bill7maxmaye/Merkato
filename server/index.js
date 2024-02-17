//IMORT FROM PACKAGES
const express = require ('express');

//IMPORT FROM FILES
//this just imports it for use
const authRouter = require("./routes/auth")

//INITILIZATIONS
PORT = 3000
const app = express();


//MIDDLEWARE
//this now makes it functional that the server listening on port 3000, when any request to the specified get request comes it directs it to the authRouter
app.use(authRouter);




app.listen(PORT,"0.0.0.0",  ()=>{
console.log(`started server at port ${PORT}`)})
