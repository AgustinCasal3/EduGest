const express = require("express");
const pool = require('./db'); // Esta es la conexion a la base de datos de PostGre (Cambiar lo que haya que cambiar)

const app = express();

app.use(express.json());

// Ruta principal para la prueba del funcionamiento
app.get('/', (req, res) => {
    res.json({
        message: 'API de gestion educativa funcionando'
    });
});

// Recuperar todos los Alumnos
app.get('/alumnos', async (req, res) => {
    try {
        // Ejecutar CONSULTA
        const result = await pool.query('SELECT * FROM Alumnos ORDER BY id ASC');

        // result.rows trae los datos de los alumnos
        res.json({
            status: 'success',
            data: result.rows
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al obtener los alumnos' });
    }
});

// Recuperar un solo Alumno
app.get('/alumnos/:id', async (req, res) => {
    let { id } = req.params;
    
    try {
        // Hay que usar un $1 para evitar SQL Injection (Usar $1 y pasar [id] en un arreglo le indica a PostgreSQL que limpie y valide la variable antes de ejecutarla.)
        const result = await pool.query('SELECT * FROM alumnos WHERE id = $1', [id]);

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Alumno no encontrado'});
        }

        res.json({
            status: 'success',
            data: result.rows[0]
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al buscar el alumno. (Por parte de la BD)'});
    }
});

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutandose en http://localhost:${PORT}`);
})