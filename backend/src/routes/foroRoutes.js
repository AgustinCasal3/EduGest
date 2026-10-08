const express = require('express');
const router = express.Router();
const foroController = require('../controllers/foroController');

// Rutas de la pantalla Foro
router.get('/info/:carreraId', foroController.getInfoForo);
router.get('/usuario/:id', foroController.getInfoUsuario);
router.get('/usuario-institucion/:userId/:institucionId', foroController.getUsuarioInstitucion); // Tambien podria ser usuarioInstitucion/usuario/:userId/institucion/:insitucionId
router.get('/institucion/:id', foroController.getInfoInstitucion);
router.get('/carrera/:id', foroController.getInfoCarrera);
router.get('/materias/:carreraId', foroController.getMateriasByCarrera);

module.exports = router;