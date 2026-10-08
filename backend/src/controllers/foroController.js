const pool = require('../db');

// PETICIÓN 1: Información del Foro (Vincular Institución y Carrera)
const getInfoForo = async (req, res) => {
  const { carreraId } = req.params;
  try {
    const query = `
      SELECT c.id AS carrera_id, c.nombre AS carrera, i.id AS institucion_id, i.nombre AS institucion
      FROM carrera c
      JOIN institucion i ON c.institucion_id = i.id
      WHERE c.id = $1
    `;
    const result = await pool.query(query, [carreraId]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Foro no encontrado' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 1.2: Información del Usuario (Validar acceso)
const getInfoUsuario = async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('SELECT * FROM usuario WHERE id = $1', [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 2: Recuperar UsuarioInstitucion (Vincular usuario con la institución)
const getUsuarioInstitucion = async (req, res) => {
  const { userId, institucionId } = req.params;
  try {
    const query = `
      SELECT * FROM usuario_institucion 
      WHERE usuario_id = $1 AND institucion_id = $2
    `;
    const result = await pool.query(query, [userId, institucionId]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'El usuario no pertenece a esta institución' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 3: Info Instituciones
const getInfoInstitucion = async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('SELECT * FROM institucion WHERE id = $1', [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Institución no encontrada' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 4: Info Carreras
const getInfoCarrera = async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('SELECT * FROM carrera WHERE id = $1', [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Carrera no encontrada' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 5: Info Materias (Listar las materias por carrera para el foro)
const getMateriasByCarrera = async (req, res) => {
  const { carreraId } = req.params;
  try {
    const query = `
      SELECT * FROM materia 
      WHERE carrera_id = $1 
      ORDER BY anio_del_plan ASC, nombre ASC
    `;
    const result = await pool.query(query, [carreraId]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'No hay materias asociadas a la carrera' });
    }

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getInfoForo,
  getInfoUsuario,
  getUsuarioInstitucion,
  getInfoInstitucion,
  getInfoCarrera,
  getMateriasByCarrera,
};