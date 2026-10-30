const express = require('express');
const router = express.Router();
const chatbotController = require('../controllers/chatbotController');
const { verificarToken } = require('../middlewares/authMiddleware');

// Todas las rutas requieren autenticación con Token JWT
router.post('/chats', verificarToken, chatbotController.crearChat);
router.get('/chats', verificarToken, chatbotController.listarChats);
router.delete('/chats/:id', verificarToken, chatbotController.eliminarChat);
router.get('/chats/:id/mensajes', verificarToken, chatbotController.obtenerMensajesChat);
router.post('/chats/:id/mensajes', verificarToken, chatbotController.enviarMensaje);

module.exports = router;