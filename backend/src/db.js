const { Pool } = require('pg');

// Configuracion de la conexion a Postgre

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'EduGest',
    password: '1234',
    port: 5432
});

// Probar conexion
pool.connect((err, client, release) => {
    if (err) {
        return console.error('Error al conectar a la base de datos EduGest:', err.stack);
    }

    console.log('Conexion exitosa a la base de datos EduGest');
    release();
});

module.exports = pool;