import { Pool } from 'pg';

// Configuración de la conexión a PostgreSQL

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'edugest', 
    password: '1234',
    port: 5432
});

// Probar conexión
pool.connect((err, client, release) => {
    if (err) {
        console.error('Error al conectar a la base de datos edugest:', err.stack);
        return;
    }

    console.log('Conexión exitosa a la base de datos edugest');
    
    // release() libera el cliente (client) devolviéndolo al pool
    if (release) {
        release(); 
    }
});

export default pool;