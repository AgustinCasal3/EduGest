import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import { useRouter } from "expo-router";
import { Image, StyleSheet, View, Text } from "react-native";
import { useState } from "react";
import TextBox from "../components/Textbox";
import { servicioLogin } from "@/services/ServicioLogin";
import { guardarToken } from "@/services/ServicioToken";

export default function PantallaIniciodesesion() {
    const router = useRouter();

    const [datosUsuario ,setDatosUsuario] = useState({
        email: "",
        contraseña: ""
    });

    const [cargando, setCargando] = useState(false);

    type Errores = {email?: string; contraseña?: string; general?: string };
    const [errores, setErrores] = useState<Errores>({});
    
    const cambiarTextbox = (campo: string, valor: string) => {
        setDatosUsuario((anterior) => ({...anterior, [campo]: valor}));
        setErrores((anterior) => ({ ...anterior, [campo]: undefined, general: undefined}))
    }

    const validar = (): Errores => {
        const nuevos: Errores = {};
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(!datosUsuario.email.trim()){
            nuevos.email = "Ingrese su email";
        } else if(!emailRegex.test(datosUsuario.email.trim())){
            nuevos.email = "El email no es valido";
        }
        
        if(!datosUsuario.contraseña.trim()){
            nuevos.contraseña = "Ingrese su contraseña";
        }

        return nuevos;
            
    }
    
    const enviarDatos = async () => {
        
        const nuevos = validar();
        setErrores(nuevos);
        if(Object.keys(nuevos).length > 0) return;
        
        setCargando(true);
        try{
            const respuesta = await servicioLogin(datosUsuario.email, datosUsuario.contraseña);
            console.log( "Token: " + respuesta.token);
            await guardarToken(respuesta.token);
            router.replace("/home");
        }catch (e){
            setErrores({
                email: "",
                contraseña: "",
                general: (e as Error).message,
            })
        }finally{
            setCargando(false);
        }


    }

return (
        <View style={styles.container}>

            <BotonAtras
                onPress={() => router.back()}
            />

            <Image
                source={require("../../assets/images/EduGestLogo.png")}
                style={styles.logo}
            /> 

            <Text style={styles.textoTitulo}>Iniciar sesion</Text>

            <View style={styles.formContainer}>

                <Text style={styles.textoLabel}>Email Institucional:</Text>
                <TextBox
                    placeholder="Email"
                    keyboardType="email-address"
                    autoCapitalize="none"
                    autoCorrect= {false}
                    value={datosUsuario.email}
                    onChangeText={(texto) => cambiarTextbox("email", texto)}
                    error={!!errores.email}
                />
                {!!errores.email?.trim() && <Text style={styles.textoError}></Text>}

                <Text style={styles.textoLabel}>Contraseña:</Text>
                <TextBox
                    placeholder="Contraseña"
                    secureTextEntry
                    autoCapitalize="none"
                    value={datosUsuario.contraseña}
                    onChangeText={(texto) => cambiarTextbox("contraseña", texto)}
                    error={!!errores.contraseña}
                />
                {!!errores.contraseña?.trim() && <Text style={styles.textoError}>{errores.contraseña}</Text>}

                {!!errores.general && <Text style={styles.textoError}>{errores.general}</Text>}

                <Boton
                    label = "Iniciar sesion"
                    onPress = {enviarDatos}
                    style = {styles.botonMargin}
                />

            </View>
            
        </View>
    ); 
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fafbff",
        alignItems: "center",
        
    },
    logo: {
        width: 150,
        height: 100,
        marginTop: 60,
    },
    formContainer: {
        width: 220,
        // gap: 16,
        alignItems: "flex-start",
        justifyContent: "center",
        // marginBottom: 80,
    },

    textoTitulo: {
        fontSize: 23,
        // marginBottom: 15,

    },

    textoLabel: {
        fontSize: 15,
        marginTop: 10,
    },

    textoError: {
        color: "#d32f2f",
        fontSize: 13,
        marginTop: 4,
    },

    button: {
        backgroundColor: "#5B6FC7",
        paddingVertical: 16,
        borderRadius: 30,
        alignItems: "center",
        width: 220,
    },
    buttonText: {
        color: "white",
        fontSize: 16,
        fontWeight: "600",
    },
    botonMargin: {
        marginTop: 20,
    },
    textBox: {
        backgroundColor: "#d9d9d9",
        borderWidth: 2,
        borderColor: "black",
        borderRadius: 20,
        paddingHorizontal: 16,
        paddingVertical: 14,
        fontSize: 16,
        width: 220,
        // marginBottom: 15,
    },
});