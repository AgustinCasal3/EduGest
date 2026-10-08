
// No esta terminado 
interface loginProp{
    token: string,
    usuario: {id: number, email: string, password: string}
}



export async function servicioLogin (email:string, password:string) {
    const respuesta = await fetch("localhost:3000/login", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({email, password}),
    });
    
    const data = await respuesta.json();

    if(!respuesta.ok){
        throw new Error(data ?? "Error al iniciar sesion");
    }
    return data;
}
