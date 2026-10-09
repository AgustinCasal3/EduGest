const bcrypt = require('bcrypt');

const passwordEnTextoPlano = 'celeron';
const saltRounds = 10; // Nivel de seguridad del cifrado

bcrypt.hash(passwordEnTextoPlano, saltRounds, (err, hash) => {
    if (err) throw err;
    console.log('El hash para tu base de datos es:');
    console.log(hash);
});

// Usuarios y contraseñas:
// Agustin Casal: agustin@mail.com agustin
// Lucas Martinez: lucas@mail.com paragua
// Mateo Noba: mateo@mail.com mateo123
// Tobias Noba: tobi@mail.com hondansx1995
// Guido Herrera: guido@mail.com celeron