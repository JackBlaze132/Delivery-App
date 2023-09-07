const UsersController = require('../controllers/usersController');

module.exports = (app) => {

    //Traer datos
    app.get("/api/users/getAll", UsersController.getAll);
}