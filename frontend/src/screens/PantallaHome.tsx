import { useRouter } from "expo-router";
import { Image, StyleSheet, View } from "react-native";
import { Text } from "expo-router/build/react-navigation";
import Boton from "../components/Boton";

export default function PantallaHome() {

    const router = useRouter();

    return(

        <View style={styles.container}>
            <View style={styles.instituciones}>
                <View style={styles.institucionesDivision}>
                    <Text style={styles.institucionTitulo}>ISFT 220</Text>
                    <Text>Desarrollo de software 2026</Text>
                </View>
                <View style={styles.institucionesDivision}>
                    <Text>Virrey Loreto 2564</Text>
                </View>
            </View>

            <View style={styles.instituciones}>
                <Text style={styles.institucionTitulo}>ISFT 220</Text>
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
    instituciones: {
        height: 200,
        width: 400,
        marginTop: 30,

        backgroundColor: "lightgray",

        borderColor: "black",
        borderWidth: 2,
        borderRadius: 20,
    },

    institucionTitulo: {
        fontSize: 23,
        padding: 20,

    },

    institucionesDivision: {
        height: 100,

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