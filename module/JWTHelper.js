const JWT = require('jsonwebtoken');

exports.verify = async (TokenData) => {
    if(TokenData.authorization == null){
        return false;
    }
    let TokenAuth = TokenData.authorization.split(' ');
    if(TokenAuth[0] !== 'Bearer'){
        return false;
    }else{
        let resultToken = await JWT.verify(TokenAuth[1], process.env.SECRET_KEY, function(err, resultToken){
            if(err)return false;
            if(resultToken) return resultToken;
        });
        return resultToken;
    }
   


}

exports.isAuthenticated = (req, res, next) => {
    try {
        let token = req.get("authorization");
        if (!token){
            return res.status(404).send({
                status: "Failed",
                message: "Token not found"
            });
        }
        token = token.split(" ")[1];
        const decoded = JWT.verify(token,  process.env.SECRET_KEY);
        req.email = decoded.email;
        next();
   } catch (error) {
        return res.status(401).send({
            status: "Failed",
            message: error.message
        });
   }
}


exports.generateJWT = (id, email) => {
    let token = JWT.sign({
            Id: id,
            Email: email,
        },
        `${process.env.SECRET_KEY}`,
        {
            expiresIn: "1 days",
        }
    );
    return token; 
}

exports.generateRefreshJWT = (id, email) => {
    let token = JWT.sign({
            Id: id,
            Email: email,
        },
        `${process.env.SECRET_KEY}`,
        {
            expiresIn: "7 days",
        }
    );
    return token; 
}
