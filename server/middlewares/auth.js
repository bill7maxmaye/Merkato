const jwt = require("jsonwebtoken");

const auth = async(req, res, next)=>{
    try {
        const token = req.header("x-auth-token");
        if (!token) {
            return res.status(401).json({ msg: "No authentication token, access denied" });
        }
        const verified = jwt.verify(token, passwordkey);
        if (!verified) {
            return res.status(401).json({ msg: "Token verification failed, authorization denied" });
        }
      //if the token is verified then the user is verified and 
      //a property called user and token are added to the request object. the next() callback is called to move to the next middleware with an updated req object because the new request object contains the user and token property that will be used in the next middleware.

        req.user = verified.id;
        req.token = token;
        next();
        
    } catch (err) {
        res.status(500).json({ error: err.message });
        
    }
}


module.exports = auth;