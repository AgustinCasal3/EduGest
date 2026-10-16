const pool = require('../db');

// A. Obtener todas las instituciones para el primer desplegable
const obtenerInstituciones = async () => {
    const query = 'SELECT id, nombre FROM institucion ORDER BY nombre ASC';
    const { rows } = await pool.query(query);
    return rows;
};

// B. Obtener las carreras filtradas por institución para el segundo desplegable
const obtenerCarrerasPorInstitucion = async (institucionId) => {
    const query = 'SELECT id, nombre FROM carrera WHERE institucion_id = $1 ORDER BY nombre ASC';
    const { rows } = await pool.query(query, [institucionId]);
    return rows;
};

// C. Guardar la solicitud de preinscripción
const registrar = async (datos) => {
    const query = `
        INSERT INTO preinscripcion 
        (institucion_id, carrera_id, nombre, apellido, dni, email, fecha_nacimiento, direccion, telefono, fecha_solicitud, estado) 
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, CURRENT_DATE, 'PENDIENTE') 
        RETURNING id;
    `;
    const valores = [
        datos.institucion_id,  
        datos.carrera_id, 
        datos.nombre, 
        datos.apellido, 
        datos.dni, 
        datos.email, 
        datos.fecha_nacimiento, 
        datos.direccion, 
        datos.telefono
    ];
    
    const { rows } = await pool.query(query, valores);
    return rows[0]; // Retorna el ID de la solicitud creada
};

module.exports = {
    obtenerInstituciones,
    obtenerCarrerasPorInstitucion,
    registrar
};