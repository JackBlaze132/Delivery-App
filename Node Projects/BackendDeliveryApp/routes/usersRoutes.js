const UsersController = require('../controllers/usersController');

module.exports = (app, upload) => {

    //Traer datos
    app.get("/api/users/getAll", UsersController.getAll);

    //Guardar datos
    app.post('/api/users/create', upload.array('image',1), UsersController.registerWithImage);

    //Autenticar usuario
    app.post('/api/users/login', UsersController.login);

    //Actualizar datos
    app.put('/api/users/update', upload.array('image',1), UsersController.update);
}