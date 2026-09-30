import Boton from "@/components/Boton";
import BotonAtras from "@/components/BotonAtras";
import { useRouter } from "expo-router";
import { Text } from "expo-router/build/react-navigation";
import { StyleSheet, View } from "react-native";


export default function PantallaErrorSistema() {
    const router = useRouter();

return (
        <View style={styles.container}>

            <BotonAtras
                onPress={() => router.back()}
            />

            <Text style={styles.textoTitulo}>Error del sistema</Text>

            <View style={styles.textContainer}>
                <Text style={styles.textoLabel}>Lo sentimos, hubo un error en nuestro sistema.</Text>
                <Text style={styles.textoLabel}>Le pedimos que intente nuevamente mas tarde</Text>
                <Text style={styles.textoLabel}>Gracias</Text>
                
                
                <Boton
                    label = "Reintentar"
                    onPress ={() => router.push("/")}
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
        justifyContent: "center"
        
    },
    logo: {
        width: 150,
        height: 100,
        marginTop: 60,
    },
    textContainer: {
        width: 220,
        // gap: 16,
        alignItems: "flex-start",
        justifyContent: "center",
        // marginBottom: 80,
    },

    textoTitulo: {
        fontSize: 30,
        marginBottom: 30,

    },

    textoLabel: {
        fontSize: 17,
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
        marginTop: 30,
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