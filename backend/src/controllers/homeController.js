const pool = require('../db');

// PETICIÓN 1: Recuperar Usuario
const getUsuario = async (req, res) => {
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

// PETICIÓN 2: Recuperar Instituciones
const getInstituciones = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM institucion');
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 3: Recuperar Carreras
const getCarreras = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM carrera');
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// PETICIÓN 4: Recuperar UsuarioInstitucion (Instituciones y carreras del usuario)
const getUsuarioInstituciones = async (req, res) => {
  const { userId } = req.params;
  try {
    // Ejemplo de consulta agrupada/JOIN
    const query = `
      SELECT i.nombre AS institucion, c.nombre AS carrera 
      FROM usuario_institucion ui
      JOIN institucion i ON ui.institucion_id = i.id
      JOIN carrera c ON ui.carrera_id = c.id
      WHERE ui.usuario_id = $1
    `;
    const result = await pool.query(query, [userId]);
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getUsuario,
  getInstituciones,
  getCarreras,
  getUsuarioInstituciones
};