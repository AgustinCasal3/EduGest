// services/instituciones.ts
import axios from "axios";
import { obtenerToken } from "./ServicioToken";
import { borrarToken } from "./ServicioToken";

import { API_URL } from "./configuracion";

export interface Institucion {
    institucion_id: number;
    institucion_nombre: string;
    direccion: string;
    carrera_nombre: string;
    anio_lectivo: number;
}

export async function obtenerMisInstituciones(): Promise<Institucion[]> {
    try {
        const token = await obtenerToken();

        const respuesta = await axios.get<Institucion[]>(
            `${API_URL}/home/mis-instituciones`,
            {
                headers: { Authorization: `Bearer ${token}` },
                timeout: 10000,
            }
            
        );
        return respuesta.data;
    } catch (error) {
        if (axios.isAxiosError(error)) {
            if (error.response?.status === 401) {
            await borrarToken();
            throw new Error("SESION_EXPIRADA");
        }
        if(error.response){

            throw new Error(error.response.data?.error ?? "Error al obtener instituciones");
        }
            throw new Error("No se pudo conectar con el servidor");
        }
        throw new Error("Ocurrio un error inesperado");
    }
}