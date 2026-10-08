import express, { Application, Request, Response } from 'express';
import pool from './db'; // Nuestra conexión a PostgreSQL

// Importación de las rutas (recordá que ahora serán .ts también)
// import homeRoutes from './routes/homeRoutes'; 
// import foroRoutes from './routes/foroRoutes'; 

// Le decimos a TS que "app" es del tipo "Application" de express
const app: Application = express();

// Middleware para que nuestra API entienda formato JSON
app.use(express.json());

// Ruta principal para la prueba del funcionamiento
// Le decimos a TS que req es del tipo Request y res del tipo Response
app.get('/', (req: Request, res: Response) => {
    res.json({
        message: 'API de gestión educativa funcionando'
    });
});

// // PANTALLA HOME
// app.use('/api/home', homeRoutes);

// // PANTALLA FORO
// app.use('/api/foro', foroRoutes);

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});