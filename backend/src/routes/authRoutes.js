// src/routes/authRoutes.js
const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Ruta POST para el inicio de sesión
router.post('/login', authController.login);

module.exports = router;