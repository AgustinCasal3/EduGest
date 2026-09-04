const express = require("express");

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
    res.json({
        message: 'API de gestion educativa funcionando'
    });
});

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutandose en http://localhost:${PORT}`);
})