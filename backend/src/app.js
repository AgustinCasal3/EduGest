require('dotenv').config();

const express = require("express");
const cors = require("cors");
const os = require("os");
const authRoutes = require('./routes/authRoutes');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);

app.get('/', (req, res) => {
    res.json({ message: 'API de gestion educativa funcionando' });
});

const PORT = process.env.PORT || 3000;

// 3. Función para obtener tu IP local real
const obtenerIpLocal = () => {
    const interfaces = os.networkInterfaces();
    for (const nombreInterfaz in interfaces) {
        for (const iface of interfaces[nombreInterfaz]) {

            if (iface.family === 'IPv4' && !iface.internal) {
                return iface.address;
            }
        }
    }
    return 'localhost';
};

app.listen(PORT, '0.0.0.0', () => {
    const ip = obtenerIpLocal();
    console.log(`Servidor ejecutándose correctamente:`);
    console.log(`Local: http://localhost:${PORT}`);
    console.log(`En red: http://${ip}:${PORT}`);
});