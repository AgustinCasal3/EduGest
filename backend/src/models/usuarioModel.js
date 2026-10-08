const pool = require('../db'); // Asegurate de que la ruta a tu db.js sea correcta

const buscarUsuarioPorEmail = async (email) => {
    // Usamos $1 para proteger la consulta contra SQL Injection
    const query = 'SELECT * FROM usuario WHERE email = $1';
    const { rows } = await pool.query(query, [email]);
    
    // Retorna el primer usuario encontrado o undefined si no existe
    return rows[0]; 
};

module.exports = {
    buscarUsuarioPorEmail
};