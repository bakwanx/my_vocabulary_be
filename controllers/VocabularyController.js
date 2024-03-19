const { Vocab, TypeVocab } = require('../models');


exports.getTypeVocabulary = async(req, res) => {
    let result = await TypeVocab.findAll();

    res.status(200).send({
        code:200,
        status:"success",
        message:"success get type vocabulary",
        data:result
    });
    return;
} 

exports.getVocabularyByOrder = async(req, res) => {
    const { idUser } = req.query;
    let result = await Vocab.findAll({
        where: {
            idUser:idUser
        },
        include: {
            model: TypeVocab,
            as: 'typeVocab'
        },
    });

    res.status(200).send({
        code:200,
        status:"success",
        message:"success get vocabulary",
        data:result
    });
    return;
}

exports.getVocabularyDetail = async(req, res) => {
    const { idVocab } = req.query;
    let result = await Vocab.findOne({
        where: {
            id: idVocab
        },
        include: {
            model: TypeVocab,
            as: 'typeVocab'
        },
    });

    res.status(200).send({
        code:200,
        status:"success",
        message:"success get vocabulary",
        data:result
    });
    return;
}

exports.postVocab = async(req, res) => {
    const { 
        idUser, 
        idType ,
        translation,
        vocab,
        variation,
        note
    } = req.body;

    let checkData = await Vocab.findOne({ where: { vocab: vocab } });
    if (checkData) {
        res.status(409).send({
            code:409,
            status: "Failed",
            message: "Vocab sudah terdaftar",
        });
        return;
    }

    let resultVocab = await Vocab.create({
        idUser: idUser,
        idType: idType,
        vocab: vocab,
        translation: translation,
        variation: variation,
        note: note
    })

    res.status(200).send({
        code:200,
        status:"success",
        message:"success posting",
        data:resultVocab
    });
    return;
}


exports.patchVocab = async(req, res) => {
    const { 
        idVocab, 
        idType ,
        translation,
        vocab,
        variation,
        note
    } = req.body;

    if(idVocab == null){
        res.status(400).send({
            code:400,
            status: "Failed",
            message: "idVocab tidak boleh kosong",
        });
        return;
    }
    Vocab.update({
        idType: idType,
        vocab: vocab,
        translation: translation,
        variation: variation,
        note: note
    }, {
        where: {
            id: idVocab
        }
    }).then(response => {
        res.status(200).send({
            code:200,
            status: "Success",
            message: "Sukses update vocabulary",
        });
    });
}

exports.deleteVocabulary = async(req, res) => {
    const { idVocab } = req.body;
    Vocab.destroy({
        where: {
          id: idVocab
        }
    });
    res.status(200).send({
        code:200,
        status: "Success",
        message: "Sukses delete vocabulary",
    });
}