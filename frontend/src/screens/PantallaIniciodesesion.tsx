import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import { useRouter } from "expo-router";
import { Text } from "expo-router/build/react-navigation";
import { Image, StyleSheet, View } from "react-native";
import { useState } from "react";
import TextBox from "../components/Textbox";
import React from "react";
import { servicioLogin } from "@/services/ServicioLogin";

export default function PantallaIniciodesesion() {
    const router = useRouter();

    const [datosUsuario ,setDatosUsuario] = useState({
        email: "",
        contraseña: ""
    });

    const cambiarTextbox = (campo: string, valor: string) => {
        setDatosUsuario((anterior) => ({...anterior, [campo]: valor}));
    }

    const [cargando, setCargando] = useState(false);
    const [error, setError] = useState("");

    const validar = () => {
        if(!datosUsuario.email.trim() || !datosUsuario.contraseña.trim()){
            return "Complete los campos";
        }
        if(datosUsuario.email.includes("@")) return "El email no es valido";
    }

    const enviarDatos = async () => {
        const mensaje = validar();
        if(mensaje){
            setError(mensaje);
            return;
        }

        setError("");
        setCargando(true);

        try{
            const respuesta = await servicioLogin(datosUsuario.email, datosUsuario.contraseña);
            console.log(respuesta.token);
            router.push("/");
        }catch (e){
            setError("No se pudo iniciar sesión. Intentelo de nuevo.");
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

                <Text style={styles.textoLabel}>Email Institucional</Text>
                <TextBox
                    placeholder="Email"
                    keyboardType="default"
                    value={datosUsuario.email}
                    onChangeText={(texto) => cambiarTextbox("email", texto)}
                />

                <Text style={styles.textoLabel}>Nombre completo:</Text>
                <TextBox
                    placeholder="Contraseña"
                    keyboardType="default"
                    value={datosUsuario.contraseña}
                    onChangeText={(texto) => cambiarTextbox("contraseña", texto)}
                />
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