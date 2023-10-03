const User = require('../models/user');
const Rol = require("../models/rol");
const jwt = require("jsonwebtoken");
const Keys = require("../config/keys");

module.exports = {
    async getAll(req, res, next){
        try{
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);
        }
        catch (error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                succesfull: false,
                message: 'Error al obtener los usuarios'
            });
        }
    },

    async register(req, res, next) {
        try{

            const user = req.body;
            const data = await User.create(user);
            await Rol.create(data.id, 1);

            return res.status(201).json({
                success: true,
                message: 'El registro se realizo correctamente, ahora inicia sesion',
                data: data.id
            });

        }
    catch (error){
        console.log(`Error: ${error}`);
        return res.status(501).json({
            success: false,
            message: 'Hubo un error con el registro del usuario',
            error: error
        });
        }
    },
}