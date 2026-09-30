import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import { useRouter } from "expo-router";
import { Text } from "expo-router/build/react-navigation";
import { Image, StyleSheet, View } from "react-native";


export default function PantallaPreinscripcionExitosa() {
    const router = useRouter();

return (
        <View style={styles.container}>

            <BotonAtras
                onPress={() => router.back()}
            />

            <Text style={styles.textoTitulo}>¡Felicitaciones!</Text>

            <View style={styles.formContainer}>

                <Text style={styles.textoLabel}>Su formulario de preinscripcion ha sido enviado correctamente.</Text>

                <Text style={styles.textoLabel}>Su proximo paso para terminar la preinscripcion, es pasar presencialmente para corroborar su identidad y ricibir su cuenta institucional</Text>
                
                <Text style={styles.textoLabel}>Ubicacion de la sede:</Text>

                <Image
                    source={require("../../assets/images/ubicacionInstituto.jpeg")}
                    style={styles.image}
                />

                <Text style={styles.textoTitulo}>¡Lo esperamos!</Text>

                <Text style={styles.textoLabel}>Si tiene alguna consulta contamos con un chatbot de ayuda al usuario</Text>

                <Boton
                    label = "Inicio"
                    onPress ={() => router.push("/")}
                    style = {styles.botonMargin}
                />
                <Boton
                    label = "Chatbot"
                    onPress ={() => router.push("/errorSistema")}
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
        justifyContent: "center",
    },
    image: {
        width: "100%",
        height: 170,
    },
    formContainer: {
        width: "30%",
        alignItems: "center",
        justifyContent: "center",
        marginTop: 0,
    },
     textoTitulo: {
        fontSize: 30,
        

    },

    textoLabel: {
        fontSize: 15,
        marginTop: 10,
        textAlign: "justify"
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