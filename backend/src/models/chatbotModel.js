const pool = require('../db');

// 1. Contar cuántas conversaciones activas tiene el usuario (para validar el límite de 10)
const contarConversacionesActivas = async (usuarioId) => {
    const query = 'SELECT COUNT(*) FROM chatbot_conversacion WHERE usuario_id = $1 AND activo = true';
    const { rows } = await pool.query(query, [usuarioId]);
    return parseInt(rows[0].count, 10);
};

// 2. Crear una nueva conversación
const crearConversacion = async (usuarioId, titulo = 'Nueva consulta') => {
    const query = `
        INSERT INTO chatbot_conversacion (usuario_id, titulo)
        VALUES ($1, $2)
        RETURNING id, titulo, fecha_creacion;
    `;
    const { rows } = await pool.query(query, [usuarioId, titulo]);
    return rows[0];
};

// 3. Obtener el listado de conversaciones activas del usuario
const obtenerConversaciones = async (usuarioId) => {
    const query = `
        SELECT id, titulo, fecha_creacion 
        FROM chatbot_conversacion 
        WHERE usuario_id = $1 AND activo = true 
        ORDER BY fecha_creacion DESC;
    `;
    const { rows } = await pool.query(query, [usuarioId]);
    return rows;
};

// 4. Borrado lógico de una conversación (libera cupo de los 10 chats)
const desactivarConversacion = async (conversacionId, usuarioId) => {
    const query = `
        UPDATE chatbot_conversacion 
        SET activo = false 
        WHERE id = $1 AND usuario_id = $2 
        RETURNING id;
    `;
    const { rows } = await pool.query(query, [conversacionId, usuarioId]);
    return rows.length > 0;
};

// 5. Guardar un mensaje individual (rol: 'user' o 'assistant')
const guardarMensaje = async (conversacionId, rol, contenido) => {
    const query = `
        INSERT INTO chatbot_mensaje (conversacion_id, rol, contenido)
        VALUES ($1, $2, $3)
        RETURNING id, rol, contenido, fecha_envio;
    `;
    const { rows } = await pool.query(query, [conversacionId, rol, contenido]);
    return rows[0];
};

// 6. Obtener el historial completo de mensajes de un chat ordenado cronológicamente
const obtenerHistorialMensajes = async (conversacionId) => {
    const query = `
        SELECT rol, contenido, fecha_envio 
        FROM chatbot_mensaje 
        WHERE conversacion_id = $1 
        ORDER BY fecha_envio ASC;
    `;
    const { rows } = await pool.query(query, [conversacionId]);
    return rows;
};

// 7. Extraer la información académica relevante del estudiante para darle contexto a la IA
const obtenerContextoEstudiante = async (usuarioId) => {
    const query = `
        SELECT 
            u.nombre, 
            u.apellido,
            i.nombre AS institucion,
            c.nombre AS carrera,
            m.nombre AS materia,
            m.anio_del_plan
        FROM usuario u
        LEFT JOIN usuario_institucion ui ON ui.usuario_id = u.id AND ui.activo = true
        LEFT JOIN institucion i ON i.id = ui.institucion_id
        LEFT JOIN estudiante e ON e.id = u.id
        LEFT JOIN inscripcion_curso ic ON ic.estudiante_id = e.id AND ic.estado_cursada = 'CURSANDO'
        LEFT JOIN curso cu ON cu.id = ic.curso_id
        LEFT JOIN materia m ON m.id = cu.materia_id
        LEFT JOIN carrera c ON c.id = m.carrera_id
        WHERE u.id = $1;
    `;
    const { rows } = await pool.query(query, [usuarioId]);
    return rows;
};

module.exports = {
    contarConversacionesActivas,
    crearConversacion,
    obtenerConversaciones,
    desactivarConversacion,
    guardarMensaje,
    obtenerHistorialMensajes,
    obtenerContextoEstudiante
};