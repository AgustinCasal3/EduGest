const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');

// Definición de las 4 peticiones
router.get('/usuario/:id', homeController.getUsuario);
router.get('/instituciones', homeController.getInstituciones);
router.get('/carreras', homeController.getCarreras);
router.get('/usuario-institucion/:userId', homeController.getUsuarioInstituciones);

module.exports = router;