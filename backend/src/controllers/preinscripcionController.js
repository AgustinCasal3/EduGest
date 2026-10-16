const preinscripcionModel = require('../models/preinscripcionModel');

const listarInstituciones = async (req, res) => {
    try {
        const instituciones = await preinscripcionModel.obtenerInstituciones();
        res.status(200).json(instituciones);
    } catch (error) {
        console.error('Error al listar instituciones:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

const listarCarreras = async (req, res) => {
    try {
        const { institucionId } = req.params;
        const carreras = await preinscripcionModel.obtenerCarrerasPorInstitucion(institucionId);
        res.status(200).json(carreras);
    } catch (error) {
        console.error('Error al listar carreras:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

const crearPreinscripcion = async (req, res) => {
    try {
        const { institucion_id, carrera_id, nombre, apellido, dni, email } = req.body;

        // Validación básica: asegurarse de que los campos más importantes vengan en el body
        if (!institucion_id || !carrera_id || !nombre || !apellido || !dni || !email) {
            return res.status(400).json({ error: 'Faltan datos obligatorios para la preinscripción.' });
        }

        const nuevaSolicitud = await preinscripcionModel.registrar(req.body);

        res.status(201).json({
            mensaje: 'Preinscripción enviada con éxito. Será evaluada a la brevedad.',
            solicitud_id: nuevaSolicitud.id
        });
    } catch (error) {
        console.error('Error al registrar preinscripción:', error);
        res.status(500).json({ error: 'Error interno al procesar la solicitud' });
    }
};

module.exports = {
    listarInstituciones,
    listarCarreras,
    crearPreinscripcion
};