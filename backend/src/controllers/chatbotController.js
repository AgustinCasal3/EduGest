const { GoogleGenAI } = require('@google/genai');
const chatbotModel = require('../models/chatbotModel');

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

// A. Crear un nuevo chat (Validando el límite de 10)
const crearChat = async (req, res) => {
    try {
        const usuarioId = req.usuario.id; // Del token JWT
        const { titulo } = req.body;

        // Validar límite de 10 conversaciones activas
        const cantidadActivas = await chatbotModel.contarConversacionesActivas(usuarioId);
        if (cantidadActivas >= 10) {
            return res.status(400).json({ 
                error: 'Has alcanzado el límite de 10 chats activos. Elimina una conversación para iniciar una nueva.' 
            });
        }

        const nuevaConversacion = await chatbotModel.crearConversacion(usuarioId, titulo || 'Nueva consulta');
        res.status(201).json(nuevaConversacion);
    } catch (error) {
        console.error('Error al crear chat:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

// B. Obtener todos los chats activos del usuario
const listarChats = async (req, res) => {
    try {
        const usuarioId = req.usuario.id;
        const chats = await chatbotModel.obtenerConversaciones(usuarioId);
        res.status(200).json(chats);
    } catch (error) {
        console.error('Error al listar chats:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

// C. Borrado lógico de un chat (Liberar cupo)
const eliminarChat = async (req, res) => {
    try {
        const usuarioId = req.usuario.id;
        const conversacionId = req.params.id;

        const eliminado = await chatbotModel.desactivarConversacion(conversacionId, usuarioId);
        if (!eliminado) {
            return res.status(404).json({ error: 'Conversación no encontrada o no pertenece al usuario.' });
        }

        res.status(200).json({ mensaje: 'Chat eliminado correctamente.' });
    } catch (error) {
        console.error('Error al eliminar chat:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

// D. Obtener los mensajes de una conversación específica
const obtenerMensajesChat = async (req, res) => {
    try {
        const conversacionId = req.params.id;
        const mensajes = await chatbotModel.obtenerHistorialMensajes(conversacionId);
        res.status(200).json(mensajes);
    } catch (error) {
        console.error('Error al obtener mensajes:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

// E. Enviar un mensaje a Gemini y recibir la respuesta
const enviarMensaje = async (req, res) => {
    try {
        const usuarioId = req.usuario.id;
        const conversacionId = req.params.id;
        const { mensaje } = req.body;

        if (!mensaje || mensaje.trim() === '') {
            return res.status(400).json({ error: 'El mensaje no puede estar vacío.' });
        }

        // 1. Guardar el mensaje del usuario en la base de datos
        await chatbotModel.guardarMensaje(conversacionId, 'user', mensaje);

        // 2. Extraer contexto del estudiante desde la BD
        const datosContexto = await chatbotModel.obtenerContextoEstudiante(usuarioId);
        
        let contextoFormateado = 'Información del usuario:\n';
        if (datosContexto.length > 0) {
            const primerRegistro = datosContexto[0];
            contextoFormateado += `- Nombre: ${primerRegistro.nombre} ${primerRegistro.apellido}\n`;
            contextoFormateado += `- Institución: ${primerRegistro.institucion || 'No asignada'}\n`;
            contextoFormateado += `- Carrera: ${primerRegistro.carrera || 'No asignada'}\n`;
            contextoFormateado += `- Materias que cursa actualmente:\n`;
            
            const materias = datosContexto
                .filter(r => r.materia)
                .map(r => `  * ${r.materia} (${r.anio_del_plan || 1}.º Año)`);
            
            contextoFormateado += materias.length > 0 ? materias.join('\n') : '  * Ninguna materia en cursada activa.';
        }

        // 3. Traer el historial previo del chat
        const historial = await chatbotModel.obtenerHistorialMensajes(conversacionId);

        // Formatear el historial en texto para enviar a Gemini
        const historialTexto = historial.map(m => `${m.rol === 'user' ? 'Estudiante' : 'Asistente'}: ${m.contenido}`).join('\n');

        // 4. Prompt de Sistema con instrucciones claras
        const systemInstruction = `Sos el Asistente Virtual educativo de EduGest.
                                Tus respuestas deben ser breves, claras, profesionales y personalizadas según la información académica del estudiante.
                                Usa únicamente la siguiente información del contexto del alumno cuando te consulte sobre sus materias, carreras o institución:
                                ${contextoFormateado}

                                Si el usuario pregunta algo ajeno al ámbito educativo o a su institución, respondé amablemente redirigiendo la consulta al ámbito académico.`;

        // 5. Llamada a la API de Gemini
        const response = await ai.models.generateContent({
            model: 'gemini-3.1-flash-lite',
            contents: `${systemInstruction}\n\nHistorial de la conversación:\n${historialTexto}`,
            config: {
                maxOutputTokens: 1000,
                temperature: 0.7
            }
        });

        const respuestaIA = response.text || 'No pude generar una respuesta en este momento.';

        // 6. Guardar la respuesta de la IA en la base de datos
        const mensajeGuardado = await chatbotModel.guardarMensaje(conversacionId, 'assistant', respuestaIA);

        res.status(200).json(mensajeGuardado);

    } catch (error) {
        console.error('Error al procesar el mensaje con Gemini:', error);
        res.status(500).json({ error: 'Error interno al comunicarse con el Chatbot.' });
    }
};

module.exports = {
    crearChat,
    listarChats,
    eliminarChat,
    obtenerMensajesChat,
    enviarMensaje
};