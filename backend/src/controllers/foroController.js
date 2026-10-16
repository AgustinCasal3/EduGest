const foroModel = require('../models/foroModel');

const obtenerForoCompleto = async (req, res) => {
    try {
        const foroId = req.params.id;
        const usuarioId = req.usuario.id; // Viene del token

        // 1. Validar permisos
        const tieneAcceso = await foroModel.verificarAcceso(foroId, usuarioId);
        if (!tieneAcceso) {
            return res.status(403).json({ error: 'No tienes permiso para ver este foro.' });
        }

        // 2. Buscar cabecera del foro
        const infoForo = await foroModel.obtenerDetalleForo(foroId);
        if (!infoForo) {
            return res.status(404).json({ error: 'Foro no encontrado.' });
        }

        // 3. Buscar y agrupar las charlas
        const charlasPlanas = await foroModel.obtenerCharlas(foroId);
        
        // Separamos las generales (materia_id es NULL, por ende anio_del_plan es NULL)
        const charlasGenerales = charlasPlanas.filter(c => c.anio_del_plan === null);
        
        // Separamos las de materias y las agrupamos por año
        const charlasMaterias = charlasPlanas.filter(c => c.anio_del_plan !== null);
        
        // Agrupamiento usando reduce
        const materiasAgrupadas = charlasMaterias.reduce((acumulador, charla) => {
            const anio = charla.anio_del_plan;
            if (!acumulador[anio]) {
                acumulador[anio] = [];
            }
            acumulador[anio].push({
                id: charla.charla_id,
                nombre: charla.charla_nombre
            });
            return acumulador;
        }, {});

        // Convertimos el objeto a un Array para que React Native lo dibuje más fácil
        const materiasPorAnio = Object.keys(materiasAgrupadas).map(anio => ({
            anio: parseInt(anio),
            charlas: materiasAgrupadas[anio]
        }));

        // 4. Enviar respuesta lista para el Frontend
        res.status(200).json({
            institucion: infoForo.institucion_nombre,
            carrera: infoForo.carrera_nombre,
            charlasGenerales: charlasGenerales.map(c => ({ id: c.charla_id, nombre: c.charla_nombre })),
            materiasPorAnio: materiasPorAnio
        });

    } catch (error) {
        console.error('Error al cargar el foro:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

module.exports = {
    obtenerForoCompleto
};