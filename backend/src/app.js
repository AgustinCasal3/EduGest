const express = require("express");

const app = express();

const stringConection = 'CONNECT ALGO';

app.use(express.json());

app.get('/', (req, res) => {
    res.json({
        message: 'API de gestion educativa funcionando'
    });
});

//RECUPERAR USUARIO
app.get('/user/:id', (req, res) => {
    let userId = req.params.id;
    
    //Usuarios.findOne({id: {userId}}) <- Hay que ver como hacerlo con POSTGRESQL
    const peticion = 'SELECT * FROM usuarios WHERE id:' + userId;

    const completeUser = peticion;

    res.json({
        userId: userId,
        objeto: completeUser
    })
});


const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutandose en http://localhost:${PORT}`);
})