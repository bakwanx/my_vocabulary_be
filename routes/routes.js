const express = require('express');
const routes = express.Router();
const userController = require('../controllers/UserController');
const vocabularyController = require('../controllers/VocabularyController');
const { isAuthenticated } = require('../module/JWTHelper');

/* WEB */
routes.get('/', (req, res) => {
    res.render('pages/index');
});

/* AUTH */
routes.post('/register', userController.uploadImage.single('profile'), userController.register);
routes.post('/login', userController.login);
routes.post('/refresh-token', userController.refreshToken);
routes.post('/check-token', isAuthenticated, (req, res) => {
    res.status(200).send({
        status: "Success",
        message: "Still authenticated",
    });
    return;
});

/* VOCABULARY */
routes.post('/api/vocabulary', vocabularyController.postVocab);
routes.get('/api/vocabulary', vocabularyController.getVocabularyByOrder);
routes.patch('/api/vocabulary', vocabularyController.patchVocab);
routes.delete('/api/vocabulary', vocabularyController.deleteVocabulary);
routes.get('/api/detail/vocabulary', vocabularyController.getVocabularyDetail);
routes.get('/api/type/vocabulary', vocabularyController.getTypeVocabulary);


module.exports = routes