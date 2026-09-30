import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import DateTimePicker from "@react-native-community/datetimepicker";
import { useRouter } from "expo-router";
import { Text } from "expo-router/build/react-navigation";
import { useState } from "react";
import { Image, Platform, StyleSheet, TouchableOpacity, View } from "react-native";

import TextBox from "../components/Textbox";

export default function PantallaPreinscripcion2() {
    const router = useRouter();
    const [fecha, setFecha] = useState(new Date());
    const [mostrarPicker, setMostrarPicker] = useState(false);

    return (
        <View style={styles.container}>

            <BotonAtras
                onPress={() => router.back()}
            />

            <Image
                source={require("../../assets/images/EduGestLogo.png")}
                style={styles.logo}
            /> 

            <Text style={styles.textoTitulo}>Formulario de Preinscripción</Text>

            <View style={styles.formContainer}>

                <Text style={styles.textoLabel}>Fecha de nacimiento</Text>
                {Platform.OS === "web" ? (
                    <input style={styles.textBoxDate} type="date" placeholder="Fecha de nacimiento"></input>
                ) : (
                    <>
                        <TouchableOpacity style={styles.textBox} onPress={() => setMostrarPicker(true)}>
                            <Text>Fecha de nacimiento</Text>
                        </TouchableOpacity>
        
                        {mostrarPicker && (
                            <DateTimePicker
                            style={styles.textBox}
                            value={fecha}
                            mode="date"
                            display={Platform.OS === "ios" ? "spinner" : "default"}
                            onChange={(event, selectedDate) => {
                                setMostrarPicker(Platform.OS === "ios");
                                if(selectedDate){
                                    setFecha(selectedDate);
                                }
                            }}
                            />
                        )} 
                    </>
                )}

                <Text style={styles.textoLabel}>Direccion</Text>
                <TextBox
                    placeholder="Direccion"
                    keyboardType="default"
                />

                <Text style={styles.textoLabel}>Telefono</Text>
                <TextBox
                    placeholder="Telefono"
                    keyboardType="default"
                />

                <Text style={styles.textoLabel}>Email</Text>
                <TextBox
                    placeholder="Email"
                    keyboardType="default"
                />

                <Boton
                    label = "Pre-inscribirse"
                    onPress ={() => router.push("/preinscripcionexitosa")}
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
    textBoxDate: {
        backgroundColor: "#d9d9d9",
        borderWidth: 2,
        borderColor: "black",
        borderRadius: 20,
        paddingHorizontal: 16,
        paddingVertical: 14,
        fontSize: 16,
        width: 215,
        height: 50,
        // marginBottom: 15,
    },
});