const express = require("express");
const pool = require('./db'); // Esta es la conexion a la base de datos de PostGre (Cambiar lo que haya que cambiar)

const homeRoutes = require('./routes/homeRoutes'); // PANTALLA HOME
const foroRoutes = require('./routes/foroRoutes'); // PANTALLA FORO

const app = express();

app.use(express.json());

// Ruta principal para la prueba del funcionamiento
app.get('/', (req, res) => {
    res.json({
        message: 'API de gestion educativa funcionando'
    });
});

// PANTALLA HOME
app.use('/api/home', homeRoutes);

// PANTALLA FORO
app.use('/api/foro', foroRoutes);


const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutandose en http://localhost:${PORT}`);
})