const pool = require('../db');

// 1. Verificar si el estudiante tiene permiso para ver este foro
const verificarAcceso = async (foroId, usuarioId) => {
    const query = `
        SELECT 1
        FROM foro f
        -- Validar si es un foro institucional y el usuario pertenece a la institución
        LEFT JOIN usuario_institucion ui ON f.institucion_id = ui.institucion_id AND ui.usuario_id = $2
        -- Validar si es un foro de carrera y el usuario está inscripto a algún curso de esa carrera
        LEFT JOIN materia m ON f.carrera_id = m.carrera_id
        LEFT JOIN curso cu ON cu.materia_id = m.id
        LEFT JOIN inscripcion_curso ic ON ic.curso_id = cu.id AND ic.estudiante_id = $2
        WHERE f.id = $1 
        AND (ui.id IS NOT NULL OR ic.id IS NOT NULL)
        LIMIT 1;
    `;
    const { rows } = await pool.query(query, [foroId, usuarioId]);
    return rows.length > 0; // Retorna true si encontró permisos, false si no
};

// 2. Obtener los datos generales del foro (Nombre Institución/Carrera)
const obtenerDetalleForo = async (foroId) => {
    const query = `
        SELECT 
            i.nombre AS institucion_nombre, 
            c.nombre AS carrera_nombre
        FROM foro f
        LEFT JOIN institucion i ON f.institucion_id = i.id
        LEFT JOIN carrera c ON f.carrera_id = c.id
        WHERE f.id = $1;
    `;
    const { rows } = await pool.query(query, [foroId]);
    return rows[0];
};

// 3. Obtener todas las charlas asociadas y su año (si aplica)
const obtenerCharlas = async (foroId) => {
    const query = `
        SELECT 
            ch.id AS charla_id, 
            ch.nombre AS charla_nombre, 
            m.anio_del_plan
        FROM charla ch
        LEFT JOIN materia m ON ch.materia_id = m.id
        WHERE ch.foro_id = $1
        ORDER BY m.anio_del_plan ASC NULLS FIRST, ch.id ASC;
    `;
    const { rows } = await pool.query(query, [foroId]);
    return rows;
};

module.exports = {
    verificarAcceso,
    obtenerDetalleForo,
    obtenerCharlas
};