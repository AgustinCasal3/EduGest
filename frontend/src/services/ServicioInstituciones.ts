// services/instituciones.ts
import axios from "axios";
import { obtenerToken } from "./ServicioToken";
import { borrarToken } from "./ServicioToken";

const API_URL = "http://192.168.0.79:3000/api";

export interface Institucion {
    id: number;
    nombre: string;
    direccion: string;
    carrera: string;
    anio: number;
}

export async function obtenerMisInstituciones(): Promise<Institucion[]> {
    try {
        const token = await obtenerToken();

        const respuesta = await axios.get<Institucion[]>(
            `${API_URL}/instituciones/mis-instituciones`,
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