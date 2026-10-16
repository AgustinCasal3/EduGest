const express = require('express');
const router = express.Router();
const preinscripcionController = require('../controllers/preinscripcionController');

// GET: Para llenar el primer desplegable
router.get('/instituciones', preinscripcionController.listarInstituciones);

// GET: Para llenar el segundo desplegable (depende de qué institución eligió)
router.get('/instituciones/:institucionId/carreras', preinscripcionController.listarCarreras);

// POST: Para enviar el formulario
router.post('/', preinscripcionController.crearPreinscripcion);

module.exports = router;