import axios from "axios";

interface login{
    mensaje: string,
    token: string,
    usuario: {id: number;
            nombre: string;
            apellido: string;
            email: string;
            password: string
        };
}

export async function servicioLogin (email: string, password: string): Promise<login> {
    try{
        
        const respuesta = await axios.post<login>(
            "http://192.168.0.79:3000/api/auth/login",
            {email, password},
            {timeout: 10000}
        );
        return respuesta.data;
    }catch(error){
        if(axios.isAxiosError(error)){
            if(error.response){
                throw new Error(error.response.data?.error ?? "Error al iniciar sesion");
                
            }
            throw new Error("Error de servidor");
        }
        throw new Error("Ocurrio un error inesperado");
    }
}
