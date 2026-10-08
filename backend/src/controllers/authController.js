const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const usuarioModel = require('../models/usuarioModel');

const login = async (req, res) => {

    // 1. Recibir la información que manda el frontend
    const { email, password } = req.body;

    try {
        if (!email || !password) {
            return res.status(400).json({ error: 'Email y contraseña son obligatorios' });
        }

        // 2. Buscar al usuario en la base de datos
        const usuario = await usuarioModel.buscarUsuarioPorEmail(email);

        if (!usuario) {
            return res.status(401).json({ error: 'Credenciales incorrectas' });
        }

        // 3. Comparar la contraseña
        const passwordValida = await bcrypt.compare(password, usuario.password_hash);

        if (!passwordValida) {
            return res.status(401).json({ error: 'Credenciales incorrectas' });
        }

        // 4. Generar el Token de sesión usando la variable de entorno
        const token = jwt.sign(
            { id: usuario.id, email: usuario.email },
            process.env.JWT_SECRET, // <--- ACÁ LLAMAMOS AL .ENV
            { expiresIn: '24h' }
        );

        // 5. Devolver el "Ok" con el token y los datos del usuario
        res.status(200).json({
            mensaje: 'Inicio de sesión exitoso',
            token: token,
            usuario: {
                id: usuario.id,
                nombre: usuario.nombre,
                apellido: usuario.apellido,
                email: usuario.email
            }
        });

    } catch (error) {
        console.error('Error en el login:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = {
    login
};