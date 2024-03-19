const { User } = require('../models');
const { generateJWT, generateRefreshJWT } = require('../module/JWTHelper')
const multer = require('multer');
const bcrypt = require('bcrypt');
const path = require('path');
const saltRounds = 10;
const randomString = require('../module/RandomString').RandomString;
const fs = require('fs');

const multerStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images');
    },
    filename: (req, file, cb) => {

        cb(null, randomString(20) + path.extname(file.originalname))
            //path.extname get the uploaded file extension
    }
});

const multerFilter = (req, file, cb) => {

    if (!file.originalname.match(/\.(png|jpg|jpeg)$/)) {
        // upload only png and jpg format
        return cb(new Error('Please upload a Image'))
    }
    cb(null, true)

};


exports.uploadImage = multer({
    storage: multerStorage,
    fileFilter: multerFilter
});

exports.register = async(req, res) => {

    let email = req.body.email;
    let checkUser = await User.findOne({ where: { email: email } });
    if (checkUser) {
        res.status(409).send({
            code:409,
            status: "Failed",
            message: "Pengguna sudah terdaftar",
        });
        return;
    } else {
        let imgData = req.file.filename;
        // const pathImage = path.join(__dirname, '../public/images/'+imgData);  
        if(imgData == null){
            res.status(400).send({
                code:400,
                status: "Failed",
                message: "Pastikan foto profile terisi",
            });
            return;
        } 
        let passwordEncrypt = '';
            await bcrypt
                .genSalt(saltRounds)
                .then(salt => {
                    return bcrypt.hash(req.body.password, salt)
                })
                .then(hash => {
                    passwordEncrypt = hash;
                })
                .catch(err => console.error(err.message));
        User.create({
            email: email,
            password: passwordEncrypt,
            fullname: req.body.fullname,
            profile: imgData
        }).then(response => {
            res.status(200).send({
                code:200,
                status: "Success",
                message: "Berhasil registrasi",
            });
            return;
        });
    

    }

}

exports.login = async (req, res) => {
    var email = req.body.email;
    var password = req.body.password;

    const dataUser = await User.findOne({ where: { email: email } });
    if(!dataUser){
        res.status(400).send({
            code:400,
            status: "Failed",
            message: "Pengguna belum terdaftar",
        });
        return;
    } else {
        // regular login
        if (password == null || email == null) {
            res.status(400).send({
                code:400,
                status: "Failed",
                message: "Email atau password tidak boleh kosong",
            });
            return;
        }
        const compare = bcrypt.compareSync(password, dataUser.password);
        if (!compare) {
            res.status(400).send({
                code:400,
                status: "Failed",
                message: "Email atau password salah",
            });
            return;
        }

        let token = generateJWT(dataUser.id, dataUser.fullname);
        let refreshToken = generateRefreshJWT(dataUser.id, dataUser.fullname);

        let responseData = {
            id:        dataUser.id,
            email:         dataUser.email,
            fullname:      dataUser.fullname,
            profile:       dataUser.profile,
            token:         token,
            refresh_token: refreshToken,
        }
        

        res.status(200).send({
            code:200,
            status: "Success",
            message: `Sukses login, selamat datang ${dataUser.fullname}`,
            data: responseData
        });
        return;
    }
    

    
}

exports.refreshToken = async(req, res) => {
    const { fullname, id } = req.body;

    // const isValid = await verify(req.headers);
    let isValid = req.get("authorization");
    if (!isValid){
        return res.status(401).send({
            code:401,
            status: "Failed",
            message: "Invalid refresh token",
        });
    }
    // console.log(`pesan ${req.headers}`);
    // if (!isValid) {
    //     return res.status(401).send({
    //         status: "Failed",
    //         message: "Invalid refresh token",
    //     });
    // }

    let generateToken = generateJWT(id, fullname);
    let generateRefreshToken = generateRefreshJWT(id, fullname);

    res.status(200).send({
        code:200,
        status: "Success",
        message: "Success generate token",
        data:{
            token: generateToken,
            refreshToken: generateRefreshToken,
        }
    });
    return;
   
}
