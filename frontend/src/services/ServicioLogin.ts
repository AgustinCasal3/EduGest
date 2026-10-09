import axios from "axios";

interface loginProp{
    mensaje: string,
    token: string,
    usuario: {id: number;
            nombre: string;
            apellido: string;
            email: string;
            password: string
        };
}

export async function servicioLogin (email: string, password: string): Promise<loginProp> {
    try{
        const respuesta = await axios.post<loginProp>(
            "http://10.0.50.15/api/auth/login",
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
