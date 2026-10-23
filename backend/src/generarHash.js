const bcrypt = require('bcrypt');

const passwordEnTextoPlano = 'ivan';
const saltRounds = 10; // Nivel de seguridad del cifrado

bcrypt.hash(passwordEnTextoPlano, saltRounds, (err, hash) => {
    if (err) throw err;
    console.log('El hash para tu base de datos es:');
    console.log(hash);
});

// Usuarios y contraseñas:
// Agustin Casal: agustin@mail.com agustin
// Lucas Martinez: lucas@mail.com paragua
// Mateo Noba: mateo@mail.com mateo
// Guido Herrera: guido@mail.com guido
// Tobias Noba: tobias@mail.com tobias
// Ciro Hudson: ciro@mail.com ciro
// Alejo Fink: alejo@mail.com alejo
// Irma Cortez: irma@mail.com irma
// Ivan Arevalos: ivan@mail.com ivan