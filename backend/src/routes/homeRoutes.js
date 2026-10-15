const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');
const { verificarToken } = require('../middlewares/authMiddleware');

// El frontend hará una petición GET a esta ruta enviando el Token.
// Primero pasa por verificarToken, si está todo ok, pasa a obtenerMisInstituciones
router.get('/mis-instituciones', verificarToken, homeController.obtenerMisInstituciones);

module.exports = router;