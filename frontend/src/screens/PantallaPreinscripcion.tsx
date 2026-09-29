import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import { useRouter } from "expo-router";
import { Text } from "expo-router/build/react-navigation";
import { Image, StyleSheet, View } from "react-native";
import TextBox from "../components/Textbox";

export default function PantallaPreinscripcion() {
    const router = useRouter();

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


                <Text style={styles.textoLabel}>Institución:</Text>
                <TextBox
                    placeholder="Institución"
                    keyboardType="default"
                />

                <Text style={styles.textoLabel}>Carrera:</Text>
                <TextBox
                    placeholder="Carrera"
                    keyboardType="default"
                />

                <Text style={styles.textoLabel}>Nombre completo:</Text>
                <TextBox
                    placeholder="Nombre completo"
                    keyboardType="default"
                />

                <Text style={styles.textoLabel}>Apellido:</Text>
                <TextBox
                    placeholder="Apellido"
                    keyboardType="default"
                />

                <Boton
                    label = "Siguiente"
                    onPress ={() => router.push("/preinscripcion")}
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
});