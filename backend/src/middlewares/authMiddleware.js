const jwt = require('jsonwebtoken');

const verificarToken = (req, res, next) => {
    // Leer el token de los headers de la petición
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; // El formato es "Bearer <token>"

    if (!token) {
        return res.status(401).json({ error: 'Acceso denegado. Token no proporcionado.' });
    }

    try {
        // Verificar el token usando la palabra secreta del .env
        const usuarioDecodificado = jwt.verify(token, process.env.JWT_SECRET);
        
        // Guardar los datos del usuario en la petición para usarlos en el controlador
        req.usuario = usuarioDecodificado; 
        
        next(); // Permitir que la petición continúe hacia el controlador
    } catch (error) {
        return res.status(403).json({ error: 'Token inválido o expirado.' });
    }
};

module.exports = { verificarToken };