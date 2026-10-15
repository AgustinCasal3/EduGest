const institucionModel = require('../models/institucionModel');

const obtenerMisInstituciones = async (req, res) => {
    try {
        // El ID viene del token que procesó el middleware en el paso 1
        const usuarioId = req.usuario.id; 

        const instituciones = await institucionModel.obtenerInstitucionesDelEstudiante(usuarioId);

        res.status(200).json(instituciones);
    } catch (error) {
        console.error('Error al obtener instituciones:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = {
    obtenerMisInstituciones
};