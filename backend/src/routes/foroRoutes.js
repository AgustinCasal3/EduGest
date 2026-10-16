const express = require('express');
const router = express.Router();
const foroController = require('../controllers/foroController');
const { verificarToken } = require('../middlewares/authMiddleware');

// La ruta usa un parámetro dinámico ":id"
// Ejemplo de petición GET: /api/foros/2
router.get('/:id', verificarToken, foroController.obtenerForoCompleto);

module.exports = router;