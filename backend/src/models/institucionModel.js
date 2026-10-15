const pool = require('../db');

const obtenerInstitucionesDelEstudiante = async (estudianteId) => {
    // Usamos DISTINCT para que no salgan tarjetas repetidas si está en varios cursos de la misma carrera
    const query = `
        SELECT DISTINCT
            i.id AS institucion_id,
            i.nombre AS institucion_nombre,
            i.direccion,
            c.nombre AS carrera_nombre,
            cu.anio_lectivo
        FROM usuario u
        JOIN estudiante e ON u.id = e.id
        JOIN inscripcion_curso ic ON e.id = ic.estudiante_id
        JOIN curso cu ON ic.curso_id = cu.id
        JOIN materia m ON cu.materia_id = m.id
        JOIN carrera c ON m.carrera_id = c.id
        JOIN institucion i ON c.institucion_id = i.id
        WHERE u.id = $1;
    `;
    
    const { rows } = await pool.query(query, [estudianteId]);
    return rows;
};

module.exports = {
    obtenerInstitucionesDelEstudiante
};