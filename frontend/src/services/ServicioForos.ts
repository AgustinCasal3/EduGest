import axios from "axios";
import { obtenerToken, borrarToken } from "./ServicioToken";
import { API_URL } from "./Configuracion";

export interface Charla {
  id: number;
  nombre: string;
}

export interface MateriasAnio {
  anio: number;
  charlas: Charla[];
}

export interface DatosForo {
  institucion: string;
  carrera: string;
  charlasGenerales: Charla[];
  materiasPorAnio: MateriasAnio[];
}

export async function obtenerForo(id: string): Promise<DatosForo> {
  try {
    const token = await obtenerToken();

    if (!token) {
      throw new Error("SESION_EXPIRADA");
    }

    const respuesta = await axios.get<DatosForo>(`${API_URL}/foros/${id}`, {
      headers: { Authorization: `Bearer ${token}` },
      timeout: 10000,
    });
    return respuesta.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      if (error.response?.status === 401) {
        await borrarToken();
        throw new Error("SESION_EXPIRADA");
      }
      if (error.response) {
        throw new Error(
          error.response.data?.error ?? "Error al obtener los datos del foro"
        );
      }
      throw new Error("No se pudo conectar con el servidor");
    }
    // Si ya era un Error nuestro (ej: SESION_EXPIRADA), lo dejamos pasar
    if (error instanceof Error) throw error;
    throw new Error("Ocurrio un error inesperado");
  }
}